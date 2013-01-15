# Commands #

## USING YUI COMPRESSOR (AFTER COMPILING WITH ANT) ##
* java -jar `./path/to/yuicompressor-2.4.7.jar` -o '.js$:-min.js' `./js/*.js`
* java -jar `./path/to/yuicompressor-2.4.7.jar` -o '.css$:-min.css' `./css/*.css`

## ADDING APP TO THE ‘OPEN WITH’ DIALOG ##
_This example uses Titanium Studio as the sample application_

1. In shell run the command: `gksudo gedit /usr/share/applications/titanium.desktop`
2. With the following settings (the important bit is the `%f` in Exec):

		#!/usr/bin/env xdg-open
		[Desktop Entry]
		Version=1.0
		Type=Application
		Terminal=false
		Icon[en_GB]=/home/jasdeepharibhajan/Titanium_Studio/icon.xpm
		Name[en_GB]=titanium
		Exec=/home/jasdeepharibhajan/Titanium_Studio/TitaniumStudio %f
		Name=titanium
		Icon=/home/jasdeepharibhajan/Titanium_Studio/icon.xpm
		Categories=Motif;Utility;TextTools;

3. Find out the mimetype of a file using: mimetype `index.html` (which returns `text/html`)
4. Add the following entry in `~/.local/share/applications/mimeapps.list` under `[Default Applications]`: `text/html`=`titanium.desktop`;
5. Turn off option on any php file set to `Allow executing file as program` under `Properties`

## LOADING A SCRIPT ON STARTUP ##
* sudo mv /`filename` /etc/init.d/
* sudo chmod +x /etc/init.d/`filename`
* sudo update-rc.d /etc/init.d/`filename` defaults

[Read more on init scripts](http://wiki.debian.org/LSBInitScripts)

## GETTING TO GKSU NAUTILUS ##
* ALT + F2

## REMOUNT FILE SYSTEM / FIND UUID / EDIT MOUNTS / LIST DEVICES ##
* sudo mount -o remount /
* ls -l /dev/disk/by-uuid/
* sudo /etc/fstab
* mount

## USING MYSQL AND MYSQLDUMP COMMANDLINE `Windows/DOS` ##
_Commands in MySQL end in ; or \g, e.g. quit;_

_If you are having problems importing / exporting - double check your mysql username, password and hostname_

_The more-than symbol (>) denotes output, the less-than symbol (<) denotes input_

### EXPORT SQL file with mysqldump ###
* `C:\xampp\mysql\bin\`mysqldump`.exe` -u `root` -p`password` -h `hostname` `database` `table` > `output.sql`
* `C:\xampp\mysql\bin\`mysqldump`.exe` -u `root` -p`password` -h `hostname` `database` `table` -w"`field`=`value`" > `output.sql`

### IMPORT SQL file with mysql ###
* `C:\xampp\mysql\bin\`mysql`.exe` -u `root` -p`password` -h `hostname` `database` < `output.sql`


## COMBINE MULTIPLE CSVs INTO ONE FILE `Windows/DOS` ##
* cd `dir`
* copy \*.csv `all`.csv

## FIND AND REPLACE DATA IN MYSQL ##
* update `table_name` set `field_name` = replace(`field_name`,'`string_to_find`','`string_to_replace`');

## IMPORT CSV INTO MYSQL ##
_Note: First ensure the table and fields already exist in MySQL_

_Make sure you know what the line ending is either \n for UNIX or \r\n for Windows_

1. cd to `dir` of the `all`.csv file
2. Add the following into `all.sql` file:
	
		load data local infile 'all.csv' into table tblTable fields terminated by ','
		enclosed by '"'
		lines terminated by '\r\n'
		(field1, field2, field3)

3. Load MySQL Shell and run command: use `database`; _(Don't forget the trailing semi-colon ;)_
4. Run command `.\ all.sql` **or** `source all.sql`
5. CSV is now in the MySQL table!

## GREP FOR FINDING INFO ##
* grep --before-context=3 --after-context=3 -i `search text` *
* grep -l -i `search text` *

## CONFIGURING A PACKAGE ##
_(First cd to the directory of the package)_

* ./configure
* make
* make install

## NODE INSTALLING & CHECKING VERSIONS ##
* npm install `package` -g
* npm version
* npm ls
* npm shrinkwrap
* npm install

## GIT REPOSITORY UPDATE & SUBMIT ##
_(First cd to the directory of the package)_

_(Please note that this default setup uses HTTPS not SSH, and therefore you will have to enter your username and password each time you push. If you don't want to do this then add the SSH origin as follows: git@github.com:username/repo.git)_

* git init _(only use once to setup git repo)_
* git add . **or** git add `file`
* git commit -m `"this is my messsage"`
* git remote add origin `https://github.com/username/Hello-World.git`
* git push -u origin master

## REMOVE FILE FROM GIT ##
* git rm --cached `file`

## CHANGE GIT REPO NAME & URL ##
_(Git does not care what your folder in which you store your git repo is called but to change the repo's name, if you delete your old repo on GitHub then you can do the following)_

1. First rename your existing folder to your new repo name
2. Edit `.git/config` and change the name
3. Update the remote origin (example uses SSH): `git remote set-url origin git@github.com:username/repo.git`

## NOT HAVING TO ENTER USERNAME AND PASSWORD FOR GIT (BY USING SSH INSTEAD OF HTTPS) ##
1. Generate a new SSH key: `ssh-keygen -t rsa -C "your_email@youremail.com"`
2. Enter a passphrase when asked the question `Enter passphrase`
3. Install xclip for copying the SSH key: `sudo apt-get install xclip`
4. Copy the key using xclip: `xclip -sel clip < ~/.ssh/id_rsa.pub`
5. Go to [GitHub Settings](https://github.com/settings), click `SSH Keys` and paste in your key **without** any extra lines
6. Now in Terminal/Shell type the following `ssh -T git@github.com`, click yes to any warning and it should say:

		Hi _username_! You've successfully authenticated, but GitHub does not provide shell access.
		
7. Then `cd` back to your repo and update the remote origin to use SSH: `git remote set-url origin git@github.com:username/repo.git`
8. Do a `commit` and `push` it to test if it works! 

## UPDATE HEROKU APP ##
_(First commit files to git and then...)_

* git push heroku master

## UPDATE APPFOG APP ##
_(First cd to the directory of the app)_

* gem install af
* af login
* af update `appname`

## MONGODB - CHECKING STATUS AND RESTARTING ##
* sudo status mongodb
* sudo rm /var/lib/mongodb/mongod.lock
* sudo -u mongodb mongod -f /etc/mongodb.conf --repair
* sudo start mongodb
* mongo `test`

## PUSHING A LOCAL FILE TO A REMOTE SERVER ##
* scp `file.zip` `username`@`hostname.com`:`/path/on/server/`

## CHMOD FILES UNDER A DIRECTORY TO 644 (-RW-R--R--) ##
_(No sudo on some hosting providers)_

* sudo find `/path/to/directory` -type f -print0 | xargs -0 sudo chmod 644

## CHMOD DIRECTORIES UNDER A DIRECTORY TO 755 (DRWXR-XR-X) (includes directory) ##
_(No sudo on some hosting providers)_

_(First navigate to the parent directory)_

* sudo chmod 755 `folder` -R
* sudo find `/path/to/directory` -type d -print0 | xargs -0 sudo chmod 755

## INSTALLING SOFTWARE ##
* sudo apt-get install `inkscape`

## LIST NETWORKING HARDWARE ##
* sudo lshw -C network
* lsmod
* ifconfig -a
* iwconfig

## SOLVING SLOW INTERNET SPEED PROBLEM (Ubuntu 10 - 11) ##
_(Where "iwl3945" is the wireless driver, found with sudo lshw -C network)_

1. gksudo geany /etc/modprobe.d/iwl3945.conf **or** gksudo geany /etc/modprobe.d/iwl3945-disable11n.conf
2. options iwl3945 disable_hw_scan=0 **or** options iwl3945 11n_disable=1

## APACHE/MYSQL START, STOP, RESTART ##
* sudo a2dissite `default` && sudo a2ensite `mysite`
* sudo service apache2 start
* sudo service apache2 stop
* sudo service apache2 restart
* sudo service mysql start
* sudo service mysql stop

## SSH SECURE SHELL ##
* ssh -l `username` `hostname`

## LIST PROCESSES ##
* ps -e

## KILL A PROCESS ##
* killall -9 `appname/process name`

## SCHEDULED SHUTDOWN/RESTART (24 Hour Clock) ##
_(Shutdown at HH:MM)_

* sudo shutdown -P `HH:MM`

_(Restart Now)_

* sudo shutdown -r now

## COPYING A DIRECTORY ##
* cp -r `dir1` `dir2`

## REMOVING A DIRECTORY ##
* rm -rf `directory`

## RENAMING A DIRECTORY ##
* mv `test` `hope`

## CREATING A FILE ##
* touch `new.file`
* cat > `new.file`

		type file contents here

_(Press Control + D to complete)_

## UNZIP/UNRAR/UNTAR ##
* unzip `file`.zip
* unrar e `file`.rar
* tar xvf `something`.tar
* tar xvfz `something`.tar.gz

## AVG ##
* avgcfgctl
* avgctl
* avgdiag.sh
* avgdump
* avgscan
* avgspmctl
* avgupdate
* avgvvctl

## LOCAL TO REMOTE SYNC ##
* rsync --progress --ignore-times --delete -rvz `/localdir/files/` `username`@`mydomain.com`:`/remotedir/files/`

## REMOTE TO LOCAL SYNC ##
* rsync --progress --ignore-times --delete -rvz `username`@`mydomain.com`:`/remotedir/files/` `/localdir/files/`
