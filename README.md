**Git commands**

**git init**  # for initializing a new repository and telling git to track the files in the current directory

**git clone <repository_url>**  # for cloning a repository from a remote source like github into a new directory

**git add <file>**  # for adding a file to the staging area we can simply write git add . to add all the files to the staging area

**git commit -a -m "commit message"**  # for committing the changes to the repository we can simply write git commit -a to commit all the changes to the repository

**git commit -m "commit message"**  # for committing the changes to the repository

**git push**  # for pushing the changes to the remote repository

**git pull**  # for pulling the changes from the remote repository

**git status**  # for checking the status of the repository

**git branch <branch_name>**  # for creating a new branch

**git branch -d <branch_name>**  # for deleting a branch

**git checkout <branch_name>**  # for switching to a branch

**git merge <branch_name>**  # for merging a branch into the current branch

**git rebase <branch_name>**  # for rebasing the current branch onto the target branch

**git stash**  # for stashing the changes in the current branch

**git add remote <remote_name> <remote_url>**    # for adding a remote repository to the local repository

**git push remote <remote_name> <branch_name>**  # for pushing the changes to the remote repository

**git pull remote <remote_name> <branch_name>**  # for pulling the changes from the remote repository

**git fetch remote <remote_name>**  # for fetching the changes from the remote repository

**git merge remote <remote_name> <branch_name>**  # for merging the changes from the remote repository into the current branch

**git rebase remote <remote_name> <branch_name>**  # for rebasing the current branch onto the target branch

**git push -u origin <branch_name>**  # for pushing the changes to the remote repository and setting the branch to track the remote repository
