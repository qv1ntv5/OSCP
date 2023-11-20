sudo ip tuntap add user <localusername> mode tun ligolo
sudo ip link set ligolo up
sudo ip route add <targetnetmask - x.x.x.0/24> dev ligolo
./proxy -h # Help options
./proxy -selfcert # Automatically request LetsEncrypt certificates


Once the agent is in the Windows machine, we execute the following command on the interace of Ligolo:

- session (to check the agents connected)
- 1 (to select the agent)
- start (to start the tunnel with the agent)

Then, we can use the following command to redirect connection from target machine to local machine:

listener_add --addr 0.0.0.0:1234 --to 127.0.0.1:4321 --tcp

More information with:

help
