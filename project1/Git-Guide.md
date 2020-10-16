# Git Usage Guide

## Intro
This guide acts as a basics guide on how to use Git Hub commands to manage a repository.

## Git Hub
Git Hub itself is a repository management tool developers can use to work on a numerous tasks at multiple points of a development timeline.  Multiple Developers are able to share a single repository and clone a copy for their own usage, implementing personal changes, and pushing their changes alongside other developers' code.

## Commands

* Git Init - "Init"talize an empty repository or re-"Init"tialize existing repository
* Git Clone - "Clone" a repository into working directory

* Git Status - Display differences from a developer's working repository to the hosted repository.  Git Status can be used prior to committing to ensure the proper files are set to be pushed out. 

* Git Add - "Add" current working specified file or files as a "version" to be added for committing changes

* Git Pull - Performs a Fetch and Merge of changes from the desired repository into working repository

* Git Push - Updates working files into chain of development to be sent to the final development phase.

* Git Commit - "Commit" working changes into the active branch or repository.

## Beginner's Step-by-Step GitHub Usage/Development Stages
1)  A developer should typically start their developing with `git clone` or `git init` in order to obtain a copy of the existing repository.
2)  A developer should actively use `git status` to continously check how up-to-date their current working repository is based on the existing repository they cloned from.
3)  If a developer's current working repository is out of date, `git status` will alert them to perform a `git pull`.  This will perform a `git fetch` and `git merge` with all changes from the up-to-date repository into the developer's current working repository.
4)  After performing a `git merge` from the command itself or from `git pull`, the developer is required to go through their code to resolve merge conflicts where Github has detected anomalies.  Resolving git merge conflicts can help in having the code act as intended.
    * a) Anomalies will exist as code where Github has detected differences exist between the two versions of the existing code fetched and the current working code merged into.
5)  When all merge conflicts are reviewed and corrected, the developer will be able to perform a `git add` in order to ready the specific file/s for the next development phase.
6)  A developer may also opt to perform `git commit -a` where the option `-a` will act as a `git add` of all files within the repository.
7)  After adding the specific file to be readied, a `git commit` will need to be performed in order to save all changes within these specific files outside the local working repository.  `git commit` will require a message to be posted alongside the changes in order to communicate changes done with other developers.
8)  Once all files have been added and those files have had their changes committed, a final `git push` will need to be performed to finally send the files and corresponding changes to the next step of development.  These changes should be sent through Unit Testing and Quality Assurance.  After testing, the changes can be sent to individual users for additional testing where bugs can be reported.  If all bugs have been resolved, the final product can be pushed into all users.

##  GitHub Code Variance/Difference Resolution
1)  If one has decided to copy an existing repository into their own repository to perform work on, there will come a time when your working repository becomes out-of-date. 
2)  An easy way to manage merging conflicting code differences is to use a Pull Request.
3)  A Pull Request occurs when the developer has modified changes into a local working repository that does not exist in the existing repository, or vice versa.
4)  The Pull Request is used as a ways to review and confirm what code should be accepted into the existing repository.
5)  After resolving merge conflicts and making sure the code is acceptable, the reviewing developer can go ahead and merge the pull request.

## Unintended Features and Bugs
1)  A user who has detected unintended functioning codes or bugs, can use Github to report Issues.
   * a)  The current base version of Github currently does not have a command line; however, the API exists if one wishes to implement it into their working environment.
2)  Using Github Desktop GUI will link the user to the website Issues tab for a repository.
3)  After the user has directed their way to the Issues tab of Github for their specific repository, they will be abe to create an Issue.
4)  An Issue requires a Title and a Body detailing a specific problem they have encountered.
5)  Issues can be labeled with specific flags to further detail and organize their importance.
6)  Communication can be done on specific issue from the Author (person who created) to the development team via the comment section.
7)  After a developer has implemented changes to their project, they can create a comment that reports these changes and close out the issue.
8)  A user may choose to re-open the issue if the issue was falsely closed.  This should be done if the user is unhappy with the changes or if the unintended feature/bug persists after heavy testing.
