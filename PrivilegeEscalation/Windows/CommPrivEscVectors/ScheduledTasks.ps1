#A misconfigured scheduled tasks could lead to the execution from a privielge account of arbitrary malicious code. We are intereseted in three points when we enumerate scheduled tasjs:

#	As which user account (principal) does this task get executed?
#	What triggers are specified for the task?
#	What actions are executed when one or more of these triggers are met?

#######################################################################
#Enumeration
#
	schtasks /query /fo LIST /v

#The command above will list the scheduled but maybe the output could be a bit overwheilming. So first we modify the command above in order to filter the Task to Run term to search modifiables binaries:

	 schtasks /query /fo LIST /v | Select-String "Task To Run" | Select-String -Pattern "system32*" -NotMatch | Select-String -Pattern "COM handler" -NotMatch

#The command above will only list the binaries al exclude all which is inner the C:\Windows\system32 directory among other stuff.

#Then if we locate a suitable binary we can expand its properties to see more details with the following command

	schtasks /query /fo LIST /v | Select-String "<binPath>" -Context 4,4

#It's convinient to address that the binPath value must have double backlash or otherwise it will trigger an error: For example: "C:\\Users\\steve\\Pictures\\BackendCacheCleanup.exe".

#######################################################################
#Leading the attack.

#If we have permissions to modify a binary executed by a privilege account in a acceptable lapse of time then we can replace the binary with a malicious payload like in before attacks by rewritting the binary (or if its been used, moving it first).




