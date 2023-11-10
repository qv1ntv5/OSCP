# This command will upload the content on <pathtocontent>, either file or directory, to the remote share on the server.

rsync -avh <pathtocontent> rsync://[<username>@]<ip>[:port]/<share>
