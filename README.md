GIT-FTP-scripts
===============

These scripts use https://github.com/resmo/git-ftp but provides an easy workflow with a live and dev folders on the FTP.


Usage
-----

First you must create a `ftp_config.txt` with configuration settings, please use `ftp_config.txt.sample` as a reference.

To create a new GIT repository and setup a connection to an FTP server run:

	$ ./ftp_init.command

This will create a GIT repository, configure git-ftp and upload an initial version.


Then when a new change has been committed and the developer folder on the FTP should be updated, run:

	$ ./ftp_push_dev.command

And when the live site should be updated, run:

	$ ./ftp_push_live.command


Notes
-----

The scripts have no error checking so be sure to create `ftp_config.txt` before you run the initialization script.

Also if something goes wrong in the initialization and you want to start over remove `.git` and `.created` and possibly remove manually from the FTP.

