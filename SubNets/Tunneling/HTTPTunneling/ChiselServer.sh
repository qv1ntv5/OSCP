chisel server --port 8080 --reverse #<--- Opens a SocksProxy that listen internal requests on port 8080.

#To use this connection is necesary to use a tool which interact with an HTTPSocksProxy. For example; 'ncat'; 'ssh -o ProxyCommand='ncat --proxy-type socks5 --proxy 127.0.0.1:1080 %h %p' database_admin@10.4.50.215'
