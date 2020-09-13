#! /bin/sh
# Brandon Dave
#CEG3120
#Project 1
#
#
# Create PATH if not exist
if [ ! -d /usr/bin/ ]; then
	export PATH="$HOME/bin:$PATH"
	echo "\$PATH created"
fi

# Refresh .bashrc
source ~/.bashrc
echo ".bashrc reloaded"

