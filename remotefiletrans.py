import os
import datetime
import ftplib
import smtplib
from email.message import EmailMessage

# Set variables
source_dir = '/path/to/source/dir'
remote_user = 'ftpabc'
remote_host = 'ftpabc.abc.def.net'
remote_dir = '/path/to/remote/dir'
local_time = datetime.datetime.now().strftime('%Y%m%d-%H%M%S')
email_subject = 'Special Files Have Been Transferred'

# Count the number of files in the source directory
num_files = len(os.listdir(source_dir))

# Connect to remote server using FTP
ftp = ftplib.FTP(remote_host)
ftp.login(remote_user)
ftp.cwd(remote_dir)

# Transfer files to remote server using FTP
for file_name in os.listdir(source_dir):
    with open(os.path.join(source_dir, file_name), 'rb') as f:
        ftp.storbinary('STOR ' + file_name + '.' + local_time, f)

# Close FTP connection
ftp.quit()

# Send email notification
msg = EmailMessage()
msg.set_content('Special files have been transferred.')
msg['Subject'] = email_subject
msg['From'] = 'george@abc123.com'
msg['To'] = 'fred@abc123.com'
s = smtplib.SMTP('localhost')
s.send_message(msg)
s.quit()

print(f'Transferred {num_files} files to {remote_host}:{remote_dir}')

