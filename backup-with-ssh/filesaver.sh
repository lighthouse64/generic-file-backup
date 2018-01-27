#made by lighthouse64
#for those who have their own servers
thisdir=$(dirname "${BASH_SOURCE[0]}")
cd "$thisdir"
chmod +x "$thisdir"/sshpass
if [ ! -f "sshpass" ]; then
	echo "sshpass is required, but it is missing from this directory."
	exit
fi

#setting variables based on the config file
file_to_backup=$(grep "file_to_backup=" conf.txt | sed 's/file_to_backup=//')
server=$(grep "server=" conf.txt | sed 's/server=//')
user=$(grep "user=" conf.txt | sed 's/user=//')
password=$(grep "password=" conf.txt | sed 's/password=//')
remote_location=$(grep "remote_location=" conf.txt | sed 's/remote_location=//')

function loop(){	
	if [ ! -f "$file_to_backup" ]; then
		echo "the file you wish to backup does not exist"
		exit
	fi
	
	if [ "$file_to_backup" == "" ]; then
		echo "the file_to_backup variable is missing or misconfigured"
		exit
	fi
	
	if [ "$server" == "" ]; then
		echo "the server variable is missing or misconfigured"
		exit
	fi
	
	if [ "$user" == "" ]; then
		echo "the user variable is missing or misconfigured"
		exit
	fi
	
	if [ "$password" == "" ]; then
		echo "the password variable is missing or misconfigured"
		exit
	fi
	
	if [ "$remote_location" == "" ]; then
		echo "the remote_location variable is missing or misconfigured"
		exit
	fi
	
	#actual code
	"$thisdir"/sshpass -p "$password" scp -o StrictHostKeyChecking=no "$file_to_backup" "$user"@"$server":"$remote_location"
	sleep 180
	loop
}
loop