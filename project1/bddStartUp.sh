#! /bin/bash
##  Brandon Dave
##  CEG3120
##  Project 1
#
#

init () { # Initial install of project repo
  if [ ! -d $PWD/dave-ceg-3120-student/ ]
    git clone https://github.com/BDDave-Student/dave-ceg3120-student.git
    echo "Student git reposity was created in $PWD"
  fi

}

initPath () { # Create PATH if not exist for script directory
##  Prioritize previous PATH before /scripts
	if [ ! -d $HOME/scripts ]; then
		mkdir $HOME/scripts;
		echo "export PATH="$PATH:~/scripts"" >> ~/.profile
		echo "\$PATH created"
	fi
## Copy script to directory
	cp $0 $HOME/scripts/bddStartUp.sh
  chmod +x $HOME/scripts/bddStartUp.sh # allows execution perms
	echo "Copying bddStartUp.sh to $HOME/scripts"

}

initAlias () { # Create custom alias if necessary
##  If grep returns true,
##  alias is made and stored in the .bashrc file
##  Requires refresh on .bashrc file

	if ! grep -q "aws-ssh" ~/.bashrc ;then
    echo alias aws-ssh="'ssh -i BDD-Student_CEG3120_key.pem ubuntu@107.20.210.5'" >> ~/.bashrc
    echo "Alias aws-ssh was created"
	fi
## Re-alias used to remove unstored aliases
## and refresh alias list from .bashrc
	if ! grep -q "re-alias" ~/.bashrc ;then
		echo alias re-alias="'unalias -a && . ~/.bashrc && alias'" >> ~/.bashrc
    echo "Alias re-alias was created"
	fi
## clearHistory used to reset .bash_history
	if ! grep -q "clearHistory" ~/.bashrc ;then
		echo alias clearHistory="'echo \"\" > .bash_history'" >> ~/.bashrc
    echo "Alias clearHistory was created"
	fi
}

initVim ()  { # Initialize preferences while using VIM
## Copies project's VIM preference to system
  if [ -f vimrc ] ;then
		sudo cp vimrc /etc/vim/vimrc
    echo "Configurations to VIM have been set to this system."
  else
    echo "No config file was found for VIM.  Using system settings."
  fi
}

initMotd () { # Initialize Log-in Message/MotD
	if [ ! -f /etc/update-motd.d/01-bdd-motd ] ;then
    sudo touch /etc/update-motd.d/01-bdd-motd		
		sudo chown ubuntu /etc/update-motd.d/01-bdd-motd
    sudo echo "#! /bin/bash " >> /etc/update-motd.d/01-bdd-motd	
		sudo echo "echo \"Welcome to the Ubuntu machine hosted by \"" >> /etc/update-motd.d/01-bdd-motd
    sudo echo "echo \"AWS.  This machine is used for CEG3120.\"" >> /etc/update-motd.d/01-bdd-motd
  fi
    sudo chmod -x /etc/update-motd.d/* # Disable all MOTD
    sudo chmod 755 /etc/update-motd.d/01-bdd-motd # Enable Custom Message
    sudo chmod 755 /etc/update-motd.d/50-landscape-sysinfo # Enable system info 

}

modifyMotd (){ # Modifies MOTD after initial run
	echo 	  "Would you like to [v]iew your available messages or	"
	read -p "		               [e]dit your custom message?		    " motdQuery
  case $motdQuery in
    v) chmodMotd 
      ;;
    e) customMotd
      ;;
    *) echo "Invalid entry. Please run the script again."
  esac

}

chmodMotd () { # Utilize pre-configured motd scripts
  read -p "Would you like to [a]ppend or [r]emove a message: " queryMotd
  case $queryMotd in
    a) echo "Available MOTD to Enable/Disable: "
      ls -lah /etc/update-motd.d/
      read -p "Append bash script to your current motd? " append
      if [ -f /etc/update-motd.d/$append ] ;then
        sudo chmod +x /etc/update-motd.d/$append
        echo "To review the changes to your MOTD, exit and re-login."
      else
        echo "File was not found.  No changes have been made to your MOTD."
      fi
      ;;
    r) echo "Available MOTD to Enable/Disable: "
    ls -lah /etc/update-motd.d/
    read -p "Remove bash script to your current motd? " disable
    if [ -f /etc/update-motd.d/$disable ] then;
      sudo chmod -x /etc/update-motd.d/$disable
      echo "To review the changes to your MOTD, exit and re-login."
    else
      echo "File was not found.  No changes have been made to your MOTD."
    fi
    ;;
  esac

}

customMotd () { # Prompts user to motd changes
  echo "Current custom motd:"
  cat /run/motd.dynamic
  echo "Changes to your motd will override the existing message."
	read -p "Enter in a new MOTD:	 " customMotd
	echo "#! /bin/bash" > /etc/update-motd.d/01-bdd-motd
	echo "echo \"$customMotd\" " >> /etc/update-motd.d/01-bdd-motd
	echo "Re-login to see your new motd."
}

initBash () { # Refreshes the .bashrc file
	. ~/.bashrc
	echo ".bashrc reloaded"
  echo "Users are recommended to refresh the .bashrc by running either:"
  echo "  source .bashrc"
  echo "  bddStartUp.sh -r"
}

userReBash () { # Prompts user to refresh .bashrc
  . ~/.bashrc;
  echo "You have reloaded your .bashrc."

}

install () { # Clean Install of all preferences
  init
  initPath
  initAlias
  initVim
  initMotd
  initBash
}

usage (){ # Usage Guide
	echo "Usage: $0 [-p Export a Scripts Directory]"
	echo "		[-a Set Up Aliases]"	
	echo "		[-v Install VIM plug-ins and preferences]"
	echo "		[-m View/Edit the Message of the Day]	[-r Refresh the .bashrc]" 
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
  echo "        [-a Set Up Aliases]"
  echo "		    [-v Install VIM plug ins and preferences]"
	echo "		    [-m View/Edit the Message of the Day]"
	echo "		    [-r Refresh the .bashrc]"
  echo "        [-i Clean install on to system]"
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
		p) initPath
		;;
		a) initAlias
		;;
		v) initVim
		;;
		m) modifyMotd
		;;
		r) userReBash
		;;
		i) install
		;;
		\? )usage
		;;
	esac
done
shift $((OPTIND-1)) ## Options handler
