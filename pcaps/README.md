*Assignment 1 - By AJ Jenkins*

set1.pcap

1. 276
2. FTP
3. "FTP is not able to encrypt its traffic; all transmissions are in clear
text, and usernames, passwords, commands and data can be easily read by
anyone able to perform packet capture (sniffing) on the network." 
- Wikipedia
4. SSH File Transfer Protocol (SFTP)
5. 67.23.79.113
6. USER: stokerj  PASS: w00tfu! 
7. 3
8. acb.jpg, code.rtf, secret.pdf
9. See submission folder

set2.pcap

10. 74566
11. 3 pairs
12. From the command line: 
    strings set2.pcap | grep 'USER'
    strings set2.pcap | grep 'PASS'
13.
    USER: brewer
    PASS: 1qazxsw209simona12
    Protocol: POP
    Server IP: 62.173.185.22
    Domain name: www.imartini.it
    Port number (destination): 110

    USER: e129286
    PASS: 4.Ekkama
    Protocol: POP
    Server IP: 144.122.144.179
    Domain name: imap.metu.edu.tr 
    Port Number: 110

    USER: mbergeson@hjnews.com
    PASS: mb123on
    Protocol: POP
    Server IP: 67.128.149.178
    Domain name: Not resolved, but probably hjnews.com
    Port number: 110 
14. 2/3 username-password combinations were legitimate
15. I followed the TCP stream and the server said something like "Login
successful
16. It's unethical, and it could be a trap.
17. Always use encrypted protocols.
18. See file 'ip-hosts.txt'. Used Statistics -> Show address resolution
19. FTP-Data, HTTP, Data, SSL, UDP, Generic Routing Encapsulation, ICMP, SSH,
FTP, Telnet, POP, IMAP, XMPP, in order of number of packets. 
Used Statistics -> Protocol Hierarchy
20. Nothing. I'm not a cool hacker yet :(
