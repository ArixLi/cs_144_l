#include "byte_stream.hh"

// Dummy implementation of a flow-controlled in-memory byte stream.

// For Lab 0, please replace with a real implementation that passes the
// automated checks run by `make check_lab0`.

// You will need to add private members to the class declaration in `byte_stream.hh`


using namespace std;

ByteStream::ByteStream(const size_t capacity): _buffer(std::deque<char>()), _capacity(capacity)  {}

size_t ByteStream::write(const string &data) {
    size_t len = data.length();
    if(len > _capacity-_buffer.size()) len = _capacity - _buffer.size();
    _write_cnt += len;
    for(size_t i=0; i<len; i++) _buffer.push_back(data[i]);
    return len;
}

//! \param[in] len bytes will be copied from the output side of the buffer
string ByteStream::peek_output(const size_t len) const {
    size_t length = len;
    if(len > _buffer.size()) {
        length = _buffer.size();
    }
    return string().assign(_buffer.begin(), _buffer.begin()+length);
}

//! \param[in] len bytes will be removed from the output side of the buffer
void ByteStream::pop_output(const size_t len) {
    size_t length = len;
    if(len > _buffer.size()) length = _buffer.size();
    _read_cnt += length;
    for(; length>0; length--) _buffer.pop_front();
}

//! Read (i.e., copy and then pop) the next "len" bytes of the stream
//! \param[in] len bytes will be popped and returned
//! \returns a string
std::string ByteStream::read(const size_t len) {
    std::string msg = peek_output(len);
    pop_output(len);
    return msg;
}

void ByteStream::end_input() { _is_end = true;}

bool ByteStream::input_ended() const { return _is_end; }

size_t ByteStream::buffer_size() const { return _buffer.size(); }

bool ByteStream::buffer_empty() const { return _buffer.empty(); }

bool ByteStream::eof() const { return buffer_empty() && input_ended(); }

size_t ByteStream::bytes_written() const { return _write_cnt; }

size_t ByteStream::bytes_read() const { return _read_cnt; }

size_t ByteStream::remaining_capacity() const { return _capacity - _buffer.size(); }
