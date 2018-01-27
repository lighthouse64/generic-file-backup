Things required for this to work:

sshpass (should be preinstalled with this)
your remote server needs to be able to use ssh

------------------------------------------

How to configure the variables in conf.txt
Nothing should be in quotes

file_to_backup=file you wish to back up
server=ip or domain name of your remote server
user=username you use to connect to the remote server
password=password you use to connect to the remote server
remote_location=location of where the file will be on the remote server (this must include the file itself)

------------------------------------------
example config

file_to_backup=/example/example.txt
server=example.tk
user=root
password=examplepassword
remote_location=/directory/example.txt
