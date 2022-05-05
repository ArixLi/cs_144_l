#include "tcp_receiver.hh"
#include "tcp_helpers/tcp_header.hh"
// For Lab 2, please replace with a real implementation that passes the
// automated checks run by `make check_lab2`.

using namespace std;

void TCPReceiver::segment_received(const TCPSegment &seg) {
    TCPHeader header = seg.header();
    if(!_SYN_received && !header.syn) return;
    if(_SYN_received && header.syn) return;
    string payload = seg.payload().copy();
    WrappingInt32 payload_first_seqno = header.seqno;
    if(header.syn) {
        _SYN_received = true;
        _isn = header.seqno;
        payload_first_seqno = header.seqno+1;
    }
    if(header.fin) _FIN_received = true;

    uint64_t checkpoint = _reassembler.stream_out().bytes_written();
    uint64_t absolute_seqno = unwrap(payload_first_seqno, _isn, checkpoint);
    if(absolute_seqno==0) return;
    _reassembler.push_substring(payload, absolute_seqno-1, header.fin);
}

optional<WrappingInt32> TCPReceiver::ackno() const {
    if(!_SYN_received) return nullopt;
    uint64_t absolute_seqno =  stream_out().bytes_written()+1;
    if(stream_out().input_ended()) return wrap(absolute_seqno+1, _isn);
    return wrap(absolute_seqno, _isn);
}

size_t TCPReceiver::window_size() const {
    return stream_out().remaining_capacity();
}
