require 'packetfu'

p = PacketFu::TCPPacket.new
p.ip_id = 0xbabe
p.ip_saddr = '130.64.217.139'
p.ip_daddr = '130.64.217.139'
p.tcp_flags.ack = 1
p.payload = "<script>alert('XSS');</script>"
p.recalc
10.times{p.to_w('en1')}
