# We can extract from a .pfx file a private key and a cert from a user. Probably we can need a passphrase.

openssl pkcs12 -in <pfxfile>.pfx -nocerts -out <privatekey>.pem

openssl pkcs12 -in <pfxfile>.pfx -clcerts -nokeys -out <cert>.crt

# If a passphrase is requested:

pfx2john <pfxfile>.pfx > <pfxfile>.hash
