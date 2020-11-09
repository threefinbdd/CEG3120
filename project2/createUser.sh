#! /bin/bash
## Brandon Dave
## CEG3120
## Project2
#
# read text file and pass line as input
# checks if user name is in use
# creates user quietly with no prompts
# outputs username and group and password
read (){
        if !  grep -q "$1" /etc/passwd ;then
                adduser --quiet --disabled-password --shell /bin/bash --home /home/$1 --gid $( getent group $2 | awk -F ":" '{ print $3 }' )  --gecos "User" $1
                userPass=abcdefault12345
                echo "$1:$userPass" | chpasswd

                echo "Welcome $1 to the server!  We hope you enjoy your stay.  Play nice with others." > /home/$1/TheGrid.txt
                chown $1  /home/$1/TheGrid.txt
                chmod 755 /home/$1/TheGrid.txt
                echo "User $1 was created and put in group $2"
                date && echo "$1        $userPass" >> /etc/passwd_log
        else
                echo "User $1 has already been created."
        fi
}

# outputs error message to user if the bash script is ran improperly.
usage (){
        echo "$0 requires a parameter of a file name."
}

# the user must be using sudo
if [ "$EUID" -ne 0 ] ;then
        echo "The user creation script must be ran as root."
        exit
fi

# the user must be using a parameter
if [ -z $1 ] ;then
        usage
        exit
fi

# main init
if [ -f $1 ] ;then
        if ! grep -q "devops" /etc/group ;then
                addgroup devops
                echo "devops group was created."
        fi

        for i in $( cat $1);
        do
                read $i devops
                #devops can be substituted for another group to automate adding to group
        done
else
        echo "$1 does not exist."
