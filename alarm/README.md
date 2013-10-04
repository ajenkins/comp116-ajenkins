Alarm - a2
==========
By AJ Jenkins
-------------

Run with: sudo ruby alarm.rb

First line while running is "Listening..."

Alerts used:
1. Xmas scan - Looks for TCP packets with FIN, PSH, and URG flags set to 1
2. Null scan - Looks for TCP packets with all flags set to 0
3. Nmap scan - Looks for TCP packets with 'Nmap' or binary representation in the
payload
4. Password leak - Looks for PASS (case insensitive) in plaintext or PASS (case
sensitive) in binary in the payload
5. Credit Card leak - Looks for the 4 major credit card formats, using regex
from SANS, in a packet payload (plaintext only)
6. Possible XSS - Looks for an opening and closing script tag in the payload as
plaintext or binary

My Packet.rb is used for generating arbitrary packets for testing purposes.
