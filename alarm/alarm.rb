require 'packetfu'

def is_xmas_packet?(pkt)
    pkt.tcp_flags.fin == 1 && 
    pkt.tcp_flags.psh == 1 && 
    pkt.tcp_flags.urg == 1
end

def is_null_packet?(pkt)
    is_null = true
    pkt.tcp_flags.each do |value|
        is_null = false unless value == 0
    end
    is_null
end

def is_fin_packet?(pkt)
    is_fin = true
    pkt.tcp_flags.each_pair do |flag, value|
        if flag == :fin
            is_fin = false unless value == 1
        else
            is_fin = false unless value == 0
        end
    end
    is_fin
end

def is_nmap_scan?(pkt)
    nmap_binary = "Nmap".each_byte.map { |b| sprintf(" 0x%02X ",b) }.join
    /Nmap/.match(pkt.payload) || /#{nmap_binary}/.match(pkt.payload)
end

def is_username?(pkt)
    user_binary = "USER".each_byte.map { |b| sprintf(" 0x%02X ",b) }.join
    /USER/i.match(pkt.payload) || /#{user_binary}/.match(pkt.payload)
end

def is_password?(pkt)
    pass_binary = "PASS".each_byte.map { |b| sprintf(" 0x%02X ",b) }.join
    /PASS/i.match(pkt.payload) || /#{pass_binary}/.match(pkt.payload)
end

def is_creditcard?(pkt)
    /4\d{3}(\s|-)?\d{4}(\s|-)?\d{4}(\s|-)?\d{4}/.match(pkt.payload) || # Visa
    /5\d{3}(\s|-)?\d{4}(\s|-)?\d{4}(\s|-)?\d{4}/.match(pkt.payload) || # MasterCard
    /6011(\s|-)?\d{4}(\s|-)?\d{4}(\s|-)?\d{4}/.match(pkt.payload) || # Discover
    /3\d{3}(\s|-)?\d{6}(\s|-)?\d{5}/.match(pkt.payload) # American Express
end

def has_script_tags?(pkt)
    /<script>.*<\/script>/.match(pkt.payload)
end

def print_alert(pkt, attack, incident_number)
    puts "#{incident_number}. ALERT: #{attack} is detected from #{pkt.ip_saddr} (#{pkt.proto.last})!"
end

iface = ARGV[0] || 'en1'
incident_number = 0

cap = PacketFu::Capture.new(start: true, iface: iface, promisc: true)
puts "Listening ..."
cap.stream.each do |p|
    pkt = PacketFu::Packet.parse(p)
    if pkt.is_tcp?
        if is_xmas_packet?(pkt)
            print_alert(pkt, 'Xmas Tree Scan', incident_number += 1)
        elsif is_null_packet?(pkt)
            print_alert(pkt, 'Null Scan', incident_number += 1)
        elsif is_nmap_scan?(pkt)
            print_alert(pkt, 'Nmap Scan', incident_number += 1)
        end
    end
    print_alert(pkt, 'Password Leak', incident_number += 1) if is_password?(pkt)
    print_alert(pkt, 'Credit Card Leak', incident_number += 1) if is_creditcard?(pkt)
    print_alert(pkt, 'Possible XSS', incident_number += 1) if has_script_tags?(pkt)
end
