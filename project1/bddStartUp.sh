#! /bin/sh
#Brandon Dave
#CEG3120
#
#
#
#
#Creates PATH if nonexistant
if [ ! -d $home/bin ]; then
        export PATH="$home/bin:$PATH"
        echo "\$PATH created"
fi