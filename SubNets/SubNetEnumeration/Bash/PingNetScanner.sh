for i in $(seq 1 254); do ping -c1 10.10.10.$i| grep "1 received" -C4; done
