Инструкция по запуску стенда:

1. Убедиться, что на машине с Vagrant есть интернет.
2. #vagrant up server client
3. #vagrant ssh server => systemctl start openvpn@server - запустится OpenVPN в режиме RAS-сервера
4. #vagrant ssh client => systemctl start openvpn@client - запустится OpenVPN-клиент и подцепится к RAS-серверу
5. С машины client: #ping 172.16.1.1 - пингуем по VPN-подсети VPN-адрес RAS-сервера. Интерфейс с адресом из подсети 172.16.1.0/24 появляется только после успешного подключения к VPN-серверу.

Результаты замеров скорости iperf3:


STATIC KEY TUN:

[vagrant@client ~]$ iperf3 -c 10.0.0.1 -t 40 -i 5
Connecting to host 10.0.0.1, port 5201
[  4] local 10.0.0.2 port 50138 connected to 10.0.0.1 port 5201
[ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
[  4]   0.00-5.00   sec  80.8 MBytes   135 Mbits/sec   16    246 KBytes
[  4]   5.00-10.00  sec  75.7 MBytes   127 Mbits/sec   34    317 KBytes
[  4]  10.00-15.00  sec  71.4 MBytes   120 Mbits/sec   82    296 KBytes
[  4]  15.00-20.00  sec  74.4 MBytes   125 Mbits/sec  129    163 KBytes
[  4]  20.00-25.01  sec  80.2 MBytes   134 Mbits/sec    7    267 KBytes
[  4]  25.01-30.00  sec  65.8 MBytes   111 Mbits/sec    0    370 KBytes
[  4]  30.00-35.00  sec  68.6 MBytes   115 Mbits/sec   25    190 KBytes
[  4]  35.00-40.01  sec  78.7 MBytes   132 Mbits/sec    7    283 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-40.01  sec   596 MBytes   125 Mbits/sec  300             sender
[  4]   0.00-40.01  sec   595 MBytes   125 Mbits/sec                  receiver

STATIC KEY TAP:

[vagrant@client ~]$ iperf3 -c 10.0.0.1 -t 40 -i 5
Connecting to host 10.0.0.1, port 5201
[  4] local 10.0.0.2 port 50144 connected to 10.0.0.1 port 5201
[ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
[  4]   0.00-5.00   sec  72.7 MBytes   122 Mbits/sec   67    236 KBytes
[  4]   5.00-10.00  sec  75.5 MBytes   127 Mbits/sec   52    240 KBytes
[  4]  10.00-15.00  sec  81.0 MBytes   136 Mbits/sec    4    299 KBytes
[  4]  15.00-20.00  sec  78.4 MBytes   131 Mbits/sec   18    335 KBytes
[  4]  20.00-25.01  sec  81.0 MBytes   136 Mbits/sec   42    261 KBytes
[  4]  25.01-30.01  sec  79.0 MBytes   132 Mbits/sec    2    320 KBytes
[  4]  30.01-35.00  sec  77.3 MBytes   130 Mbits/sec   14    301 KBytes
[  4]  35.00-40.00  sec  81.5 MBytes   137 Mbits/sec    4    346 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-40.00  sec   626 MBytes   131 Mbits/sec  203             sender
[  4]   0.00-40.00  sec   626 MBytes   131 Mbits/sec                  receiver

RAS TUN UDP:

[vagrant@client ~]$ iperf3 -c 172.16.1.1 -t 40 -i 5
Connecting to host 172.16.1.1, port 5201
[  4] local 172.16.1.6 port 38442 connected to 172.16.1.1 port 5201
[ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
[  4]   0.00-5.01   sec   117 MBytes   196 Mbits/sec   42    201 KBytes
[  4]   5.01-10.01  sec   116 MBytes   194 Mbits/sec   34    179 KBytes
[  4]  10.01-15.01  sec   116 MBytes   194 Mbits/sec   78    184 KBytes
[  4]  15.01-20.01  sec   112 MBytes   189 Mbits/sec   57    184 KBytes
[  4]  20.01-25.01  sec   118 MBytes   198 Mbits/sec   29    213 KBytes
[  4]  25.01-30.01  sec   116 MBytes   194 Mbits/sec   42    226 KBytes
[  4]  30.01-35.01  sec   115 MBytes   193 Mbits/sec  118    202 KBytes
[  4]  35.01-40.00  sec   109 MBytes   183 Mbits/sec   32    162 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-40.00  sec   918 MBytes   193 Mbits/sec  432             sender
[  4]   0.00-40.00  sec   918 MBytes   193 Mbits/sec                  receiver

RAS TUN TCP:

[vagrant@client ~]$ iperf3 -c 172.16.1.1 -t 40 -i 5
Connecting to host 172.16.1.1, port 5201
[  4] local 172.16.1.6 port 38448 connected to 172.16.1.1 port 5201
[ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
[  4]   0.00-5.00   sec  91.2 MBytes   153 Mbits/sec    0    376 KBytes
[  4]   5.00-10.00  sec  88.9 MBytes   149 Mbits/sec    0    376 KBytes
[  4]  10.00-15.01  sec  83.5 MBytes   140 Mbits/sec    0    376 KBytes
[  4]  15.01-20.01  sec  80.9 MBytes   136 Mbits/sec    0    376 KBytes
[  4]  20.01-25.01  sec  83.1 MBytes   139 Mbits/sec    0    376 KBytes
[  4]  25.01-30.00  sec  86.2 MBytes   145 Mbits/sec    0    376 KBytes
[  4]  30.00-35.01  sec  84.5 MBytes   142 Mbits/sec    0    376 KBytes
[  4]  35.01-40.00  sec  87.7 MBytes   147 Mbits/sec    0    376 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-40.00  sec   686 MBytes   144 Mbits/sec    0             sender
[  4]   0.00-40.00  sec   686 MBytes   144 Mbits/sec                  receiver


RAS TAP UDP:

[vagrant@client ~]$ iperf3 -c 172.16.1.1 -t 40 -i 5
Connecting to host 172.16.1.1, port 5201
[  4] local 172.16.1.4 port 54854 connected to 172.16.1.1 port 5201
[ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
[  4]   0.00-5.01   sec  78.1 MBytes   131 Mbits/sec  144    145 KBytes
[  4]   5.01-10.01  sec   106 MBytes   178 Mbits/sec   44    163 KBytes
[  4]  10.01-15.01  sec   108 MBytes   182 Mbits/sec   47    176 KBytes
[  4]  15.01-20.00  sec  91.7 MBytes   154 Mbits/sec   32    158 KBytes
[  4]  20.00-25.00  sec   104 MBytes   175 Mbits/sec   80    164 KBytes
[  4]  25.00-30.00  sec   107 MBytes   180 Mbits/sec   85    169 KBytes
[  4]  30.00-35.00  sec   107 MBytes   179 Mbits/sec   55    149 KBytes
[  4]  35.00-40.01  sec   114 MBytes   191 Mbits/sec   40    197 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-40.01  sec   817 MBytes   171 Mbits/sec  527             sender
[  4]   0.00-40.01  sec   816 MBytes   171 Mbits/sec                  receiver

RAS TAP TCP:

[vagrant@client ~]$ iperf3 -c 172.16.1.1 -t 40 -i 5
Connecting to host 172.16.1.1, port 5201
[  4] local 172.16.1.4 port 54860 connected to 172.16.1.1 port 5201
[ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
[  4]   0.00-5.01   sec  90.4 MBytes   152 Mbits/sec    0    388 KBytes
[  4]   5.01-10.01  sec  94.6 MBytes   159 Mbits/sec    0    388 KBytes
[  4]  10.01-15.00  sec  87.3 MBytes   147 Mbits/sec    0    388 KBytes
[  4]  15.00-20.01  sec  90.4 MBytes   151 Mbits/sec    0    388 KBytes
[  4]  20.01-25.01  sec  86.4 MBytes   145 Mbits/sec    0    388 KBytes
[  4]  25.01-30.01  sec  88.1 MBytes   148 Mbits/sec    0    388 KBytes
[  4]  30.01-35.00  sec  85.0 MBytes   143 Mbits/sec    0    388 KBytes
[  4]  35.00-40.00  sec  88.3 MBytes   148 Mbits/sec    0    388 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-40.00  sec   711 MBytes   149 Mbits/sec    0             sender
[  4]   0.00-40.00  sec   710 MBytes   149 Mbits/sec                  receiver



Выводы: 

- В режиме STATIC KEY OpenVPN работает быстрее примерно на 5% в режиме TAP, чем в режиме TUN.
- В режиме RAS OpenVPN работает быстрее примерно на 15% по протоколу UDP, чем по протоколу TCP.
