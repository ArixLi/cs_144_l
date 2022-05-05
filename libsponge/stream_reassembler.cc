#include "stream_reassembler.hh"

// Dummy implementation of a stream reassembler.

// For Lab 1, please replace with a real implementation that passes the
// automated checks run by `make check_lab1`.

// You will need to add private members to the class declaration in `stream_reassembler.hh`
using namespace std;

StreamReassembler::StreamReassembler(const size_t capacity) : _output(capacity), _capacity(capacity), _first_unacceptable(capacity) {}

//! check capacity limit, return or:
//! cut the bytes in new_seg and also cut the eof
void StreamReassembler::_add_new_seg(seg &new_seg, const bool eof) {
    if(new_seg.index >= _first_unacceptable) return;
    bool eof_this = eof;
    int over_flow_bytes = new_seg.index + new_seg.len - _first_unacceptable;
    if(over_flow_bytes>0) {
        int new_len = new_seg.len - over_flow_bytes;
        if(new_len<=0) return;
        eof_this = false;
        new_seg.len = new_len;
        new_seg.data = new_seg.data.substr(0, new_len);
    }
    if(new_seg.index < _first_unassembled) {
        int new_len = new_seg.len + new_seg.index - _first_unassembled;
        if(new_len<0) return;
        new_seg.len = new_len;
        new_seg.data = new_seg.data.substr(_first_unassembled-new_seg.index, new_len);
        new_seg.index = _first_unassembled;
    }
    _handle_overlap(new_seg);
    _eof = _eof || eof_this;
}

void StreamReassembler::_handle_overlap(seg &new_seg) {
    for(auto it=_stored_seg.begin(); it!=_stored_seg.end();) {
        auto next = ++it;
        --it;
        if((new_seg.index >= it->index && new_seg.index<it->index+it->len) || (it->index >= new_seg.index && it->index < new_seg.index+new_seg.len)) {
            _merge_seg(new_seg, *it);
            _stored_seg.erase(it);
        }
        it = next;
    }
    _stored_seg.insert(new_seg);
}

void StreamReassembler::_merge_seg(seg &new_seg, const seg &other) {
    size_t n_index=new_seg.index, n_end=new_seg.len+n_index;
    size_t o_index=other.index, o_end=other.len+o_index;
    string new_data;
    if(n_index<=o_index && n_end<=o_end) {
        new_data = new_seg.data + other.data.substr(n_end-o_index, n_end-o_end);
    } else if(n_index<=o_index && n_end>o_end) {
        new_data = new_seg.data;
    } else if(n_index>=o_index && n_end<=o_end) {
        new_data = other.data;
    } else {
        new_data = other.data.substr(0, n_index-o_index) + new_seg.data;
    }
    new_seg.index = n_index<o_index?n_index:o_index;
    new_seg.data = new_data;
    new_seg.len = (n_end>o_end?n_end:o_end) - new_seg.index;
}

void StreamReassembler::_stitch_output() {
    while(!_stored_seg.empty() && _stored_seg.begin()->index==_first_unassembled) {
        _stitch_one_seg(*_stored_seg.begin());
        _stored_seg.erase(_stored_seg.begin());
    }
}

void StreamReassembler::_stitch_one_seg(const seg &new_seg) {
    _output.write(new_seg.data);
    _first_unassembled += new_seg.len;
}

//! \details This function accepts a substring (aka a segment) of bytes,
//! possibly out-of-order, from the logical stream, and assembles any newly
//! contiguous substrings and writes them into the output stream in order.
void StreamReassembler::push_substring(const string &data, const size_t index, const bool eof) {
    _first_unread = _output.bytes_read();
    _first_unacceptable = _first_unread + _capacity;
    seg new_seg = {index, data.size(), data};
    _add_new_seg(new_seg, eof);
    _stitch_output();
    if(empty() && _eof) _output.end_input();
}

size_t StreamReassembler::unassembled_bytes() const {
    size_t un_bytes = 0;
    for(auto it=_stored_seg.begin(); it!=_stored_seg.end(); it++) {
        un_bytes += it->len;
    }
    return un_bytes;
}

bool StreamReassembler::empty() const { return unassembled_bytes()==0; }
