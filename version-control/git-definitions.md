# Git Definitions

**Instructions: ** Define each of the following Git concepts.

* What is version control?  Why is it useful?  
  *Version control is a system designed to manage changes made to a file. It is a god-send solution that allows a user to review and compare the current and past versions of a file and be able to revert back to a previous version if necessary. More excitingly, it can allow and prevent other users to perform revisions to the same file and can also track the authors of the revisions made. It makes collaboration easy, prevents costly mistakes and eliminates the need to start over a project from scratch.*  

* What is a branch and why would you use one?  
  *With Git, a project can have several duplicates of itself that can develop in different directions and pace.  These duplicates are called branches. A typical use case is when the main branch, referred to as the master, is treated as the working copy of the project. The goal is to prevent the corruption of the master. In order to protect this working copy, a branch is typically created in scenarios when a user is implementing a major change to a project. If the branch is tested and proves to be a success, it can then be merged to the master branch. Otherwise, it will be very easy to abort the changes by deleting the branch and the master copy remains untouched and working.*  

* What is a commit? What makes a good commit message?  
*A commit is a version control terminology which is both a verb and a noun. It is the act of affirming the version control system that the changes the author made to a file needs to be recorded and tracked. This action results to a noun, which is also called a commit. The commit is then a record of a change to a file at a specific point in time.*  
*Each time a commit is made, a message is added to it, which is a description of the change that was made. I found this [article](https://chris.beams.io/posts/git-commit/) useful as a guide. It outlines 7 great Git commit message rules:*
    1. *Separate subject from body with a blank line*
    2. *Limit the subject line to 50 characters*
    3. *Capitalize the subject line*
    4. *Do not end the subject line with a period*
    5. *Use the imperative mood in the subject line*
    6. *Wrap the body at 72 characters*
    7. *Use the body to explain what and why vs. how*   


* What is a merge conflict?  
*A merge conflict may arise when merging branches to the master. There are two possible reasons for a merge conflict to which the user must help the computer to resolve:*
  * *Merging branches with competing revisions to a line of code on the same file*
  * *Merging revisions to a file that was previously deleted by another branch or author*
