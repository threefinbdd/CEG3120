#! /bin/bash
##  Brandon Dave
##  CEG3120
##  Project 1
#
#

expPATH () { # Create PATH if not exist for script directory
##  Prioritize previous PATH before /scripts
	if [ ! -d $HOME/scripts ]; then
		mkdir $HOME/scripts;
		echo "export PATH="$PATH:~/scripts"" >> ~/.profile
		echo "\$PATH created"
	fi
## Copy script to directory	
	if [ ! -f $HOME/scripts/bddStartUp.sh > /dev/null ]; then
		cp $0 $HOME/scripts/bddStartUp.sh
		echo "Copying bddStartUp.sh to $HOME/scripts"
	fi
}

setupAlias () { # Create custom alias if necessary
##  If grep returns true, alias is made
##  Else create alias and store in .bashrc
##  Requires refresh on .bashrc file

	if ! grep -q "aws-ssh" .bashrc ;then 
    		echo alias aws-ssh="'ssh -i BDD-Student_CEG3120_key.pem ubuntu@107.20.210.5'" >> ~/.bashrc
	fi
## Re-alias used to remove unstored aliases
## and refresh alias list from .bashrc
	if ! grep -q "re-alias" .bashrc ;then
		echo alias re-alias="'unalias -a && . ~/.bashrc && alias'" >> ~/.bashrc
	fi
## clearHistory used to reset .bash_history
	if ! grep -q "clearHistory" .bashrc ;then
		echo alias clearHistory="'echo \"\" > .bash_history'" >> ~/.bashrc
	fi
}

vimSetUp ()  { # Set color preferences while using VIM
	echo "vim"
}

motd () { # Re-configure Log-in Message/MotD
	echo "motd"
}

refreshBash () { # Refreshes the .bashrc file
	. ~/.bashrc
	echo ".bashrc reloaded"
	echo ".bashrc should still be ran by user by running "source .bashrc""
	userRefresh
}

userRefresh () { # Prompts user to refresh .bashrc
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

install () { # Clean Install of all preferences
	expPATH
	setupAlias
	vimSetUp
	motd
	refreshBash
}

usage (){ # Usage Guide
	echo "Usage: $0 [-p Export a Scripts Directory]"
	echo "		[-a Set Up Aliases]"	
	echo "		[-v Install VIM plug-ins and preferences]"
	echo "		[-m View the Message of the Day]	[-r Refresh the .bashrc]" 
	echo "		[-i Clean install on to system]"
	echo "For additional help, use -h to access the manual."
}

helpPage () { # Help Page
	echo "NAME:"
	echo "	bddStartUp"
	echo "SYNOPSIS"
	echo "	bddStartUp [ OPTION ]"
	echo "DESCRIPTION"
	echo "	Running bddStartUp.sh will set a user's system up with predefined "
	echo "	aliases and export a scripting directory to the environment variable's "
	echo "	\$PATH.  A .bashrc reload is automatically ran, but can also be done by "
	echo "	the user's request during and after running the BASH script."
	echo "OPTIONS"
        echo "Usage: 	[-p Export a Scripts Directory]"
        echo "          [-a Set Up Aliases]"  
     	echo "		[-v Install VIM plug ins and preferences]"
	echo "		[-m View the Message of the Day]"
	echo "		[-r Refresh the .bashrc]"
        echo "          [-i Clean install on to system]"
        echo "For additional help, use -h to access [THIS] manual."

}

## handles no arguments
if [ -z $1 ] ;then
	usage
fi

unset options ## Unaffected by Env Var

reqArgs='hpavmri'
while getopts $reqArgs options
do
	case $options in
		h) helpPage 
		;;	
		p) expPATH
		;;
		a) setupAlias
		;;
		v) vimSetUp
		;;
		m) motd
		;;
		r) refreshBash
		;;
		i) install
		;;
		\? )usage
		;;
	esac
done
shift $((OPTIND-1)) ## Options handler
