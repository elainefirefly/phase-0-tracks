*What are some of the key design philosophies of the Linux operating system?*  

* Small is beautiful
* Each program does one thing and does it well
* Protoype as soon as possible
* Choose portability over efficiency
* Store data in flat text files
* Use software leverage
* Use shell scripts to increase leverage and portability
* Avoid captive user interfaces
* Make every program a filter


*In your own words, what is a VPS (virtual private server)? What, according to your research, are the advantages of using a VPS?*  
VPS is a virtual machine server that runs its own copy of an OS.   
According to my research the advantages are as follows:
* It is cheaper than an actual dedicated physical server
* It is much more easily created and configured – easy scalability
* One can install almost any software that runs on that OS and for most purposes will be functionally equivalent to a physical server.
* It can provide a higher level of security, since individual virtual servers are isolated from each other.
* It can provide stability since each virtual instance can be rebooted independently
* You get complete root access to the environment


*Optional bonus question: Why is it considered a bad idea to run programs as the root user on a Linux system?*  
Running as root user is dangerous because one may inadvertently run a script that can wipeout the entire hard drive. Running on root will give access to all files, so a seemingly harmless "rm -rf \*" piece of command is actually catastrophic. One might also run a malicious software that can mess with the system and critical files.
