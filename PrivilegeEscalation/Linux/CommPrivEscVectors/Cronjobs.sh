/etc/cron* <--- Files which have scheduled tasks stored in order of time execution.
crontab -l <--- Current user scheduled tasks. With sudo; root scheduled tasks.
grep "CRON" /var/log/syslog <--- Show executed scheduled tasks and owner.
