#! /bin/sh
# Brandon Dave
#CEG3120
#Project 1
#
#
# Create PATH if not exist for script directory
##  Prioritize previous PATH before /scripts
if [ ! -d $HOME/scripts ]; then
	export PATH="$PATH:~/scripts"
	echo "\$PATH created"
fi

# Create custom alias if necessary
##  If grep returns true, alias is made
##  Else create alias and store in .bashrc
##  Requires refresh on .bashrc file
if ! grep -q "aws-ssh" .bashrc ;then 
    	echo alias aws-ssh="'ssh -i BDD-Student_CEG3120_key.pem ubuntu@107.20.210.5'" >> .bashrc
fi

# Refresh .bashrc
. ~/.bashrc
echo ".bashrc reloaded"

