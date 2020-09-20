#! /bin/bash
# Brandon Dave
#CEG3120
#Project 1
#
#
# Create PATH if not exist for script directory
expPATH () {
##  Prioritize previous PATH before /scripts
	if [ ! -d $HOME/scripts ]; then
		mkdir $HOME/scripts;
		echo "export PATH="$PATH:~/scripts"" >> ~/.profile
		echo "\$PATH created"
	fi
}
# Create custom alias if necessary
setupAlias () {
##  If grep returns true, alias is made
##  Else create alias and store in .bashrc
##  Requires refresh on .bashrc file

	if ! grep -q "aws-ssh" .bashrc ;then 
    		echo alias aws-ssh="'ssh -i BDD-Student_CEG3120_key.pem ubuntu@107.20.210.5'" >> .bashrc
	fi

## Re-alias used to remove unstored aliases
## and refresh alias list from .bashrc
	if ! grep -q "re-alias" .bashrc ;then
		echo alias re-alias="'unalias -a && . ~/.bashrc && alias'" >> .bashrc
	fi

## clearHistory used to reset .bash_history
	if ! grep -q "clearHistory" .bashrc ;then
		echo alias clearHistory="'echo \"\" > .bash_history'" >> .bashrc
	fi
}
# Refresh .bashrc
refreshBash () {
	. ~/.bashrc
	echo ".bashrc reloaded"
	echo ".bashrc should still be ran by user by running "source .bashrc""
	userRefresh
}

userRefresh () {
#	echo -n "Would you like to run "source .bashrc"? Type [y] or [n] "
	read -p "Would you like to refresh the .bashrc [y] or [n]: "  userInput
	case $userInput in
		y)	. ~/.bashrc;
		echo "You have refreshed the .bashrc";
		;;
		n)	echo "You chose not to refresh the .bashrc.";
			;;
		*)
		echo "An invalid entry was keyed: $userInput";
		userRefresh;
		;;
	esac
}

expPATH
setupAlias
refreshBash
