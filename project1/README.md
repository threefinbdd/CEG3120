# dave-ceg3120-student
Brandon's classwork for the class CEG3120

## Project 1:</br>
My main focus on Project 1 is to create a script that is the be-all-that-ends-all for creating a personalized server and user directory based on my preferences.<br>

## Running bddStartUp will:</br>
> 1) Set up a /scripts/ directory in order to call custom scripts by their name
> 2) Create and store an assorted number of aliases: </br>
> >    - aws-ssh:  quick access into the Ubuntu environment given an existing private key</br>
> >    - re-alias:  removes all non-stored alias</br>
> >    - clearHistory:  cleans up .bash_history (Alternative to history -c)</br>
> 3) Remove the current MOTD and have it be replaceable on command</br>
> 4) Replace the current vim configuration file</br>
> 5) Allows for [option] tags in order to run specific functions within the script command.
> >    - \-h : Help Page
> >    - \-i : Initial Install
> >    - \-a : Pre-config Aliases
> >    - \-v : Pre-config VIM
> >    - \-p : Export /scripts/ directory
> >    - \-m : Make changes to the MOTD
> >    - \-r : Refresh .bashrc within Script process
