# Commands #
## CREATE A SYMLINK ##
* ln -s `destination` `linkname`

## VI OR VIM FOR BEGINNERS ##

_The two basic modes of vi or vim are to edit a document in INSERT mode or enter commands in COMMAND mode_

_Use arrow keys to navigate the document in COMMAND mode_

Editing or Entering Commands
* i - Enter insert/edit mode
* ESC - Enter command mode

Commands:
* :q - Quit
* :w - Save/Write
* :wq - Save/Write and Quit
* :q! - Don’t save and Quit
* :`line number` - Go to line
* dd - Delete line
* p - Paste line
* u - Undo last edit
* w - Skip word
* /`keyword` - Search keyword
* :syntax on - Syntax highlighting on
* For permanent syntax highlighting and changing tabs into 4 spaces, change your `~/.vimrc` to:

		syntax on
		set smartindent
		set tabstop=4
		set shiftwidth=4
		set expandtab

## INSTALL YEOMAN WITH WEBAPP GENERATOR ##
* npm uninstall -g grunt && npm install -g yo grunt-cli bower
* npm install -g generator-webapp && npm install -g generator-mocha

## CREATE AN ALIAS OF A COMMAND (LINUX) ##
* alias `alias`='`command`'

## FIND OUT WHERE AN APPLICATION IS LOCATED FOR SHELL SCRIPTS (Windows/Linux) ##
* Linux: which `bash`
* Windows: where `svn`

_Outputs something like /bin/bash to use with a shebang (#!) in a shell script e.g. "#!/bin/bash" or a Windows file path_

## RUN WEBCAM - LOAD VIDEO MODULE ##
* `sudo modprobe uvcvideo`

## RUN PHP INLINE ON THE COMMAND-LINE ##
* php -r 'echo "`Hello World`";'

## INSTALL PHPUNIT & RUN UNIT TESTS ##

* `cd` to the root of your application
* Install [Composer](http://getcomposer.org/) by downloading `composer.phar`
* Create a `composer.json` file in the root:

    	{
          "require-dev": {
              "phpunit/phpunit": "3.7.*",
              "phpunit/dbunit": ">=1.2",
              "phpunit/phpunit-selenium": ">=1.2"
          },
          "autoload": {
              "psr-0": {
                  "ApplicationNamespace": "lib/"
              }
          }
    	}


* Replace `ApplicationNamespace` with the `namespace` of your application
* Replace `lib/` with the folder with all your classes inside it
* Run: `php composer.phar update`
* Run: `./vendor/bin/phpunit tests_directory`

## COMPRESSING FILES ##

### ZIP/TAR ###
* zip `output`.zip `input.txt`
* tar czf `output`.tar.gz `input.txt`
* env GZIP=-9 tar cvzf `output`.tar.gz `/path/to/directory`

### UNZIP/UNRAR/UNTAR ###
* unzip `file`.zip
* unrar e `file`.rar
* tar xvf `something`.tar
* tar xvfz `something`.tar.gz

### LIST ARCHIVE FILES (TOP DIRECTORY ONLY) ###
* tar -ztf `file.tar.gz` | egrep '^[^/]+/?$'

## USING SUBVERSION (SVN) ##
_Please note: examples are just for http:// or https:// accessible repos_

_First cd to the parent directory_

### IMPORT INITIAL FILES INTO REPO ###
_This exports files from your computer and imports them into SVN on the server_

_Please note: after exporting your files you still MUST create a working copy of the repo by pulling it down using the "svn checkout" command described below_

* svn import . `https://svn.domain.co.uk/project/` -m "`initial import`"

### LIST FILES IN REPO ###

* svn list `https://svn.domain.co.uk/project/`

### CREATE A WORKING COPY OF THE SVN REPO ###
_cd to the directory you want to create the working repo in_

* svn checkout `https://svn.domain.co.uk/project/` `foldername`

_This will create a directory called "foldername" inside the current directory_

### EXPORT THE SVN REPO TO A WEB DIRECTORY ###
_Overwrites the public folder using the "--force" command_

_Note: SVN always requires a protocol. This example uses the "https://" protocol, but "http://", "svn://" and "svn+ssh://" are all supported for remote repos_

* svn export `https://svn.domain.co.uk/project/` `/home/user/public/` --force

_Or alternatively for exporting local repos to a local folder use the "file://" protocol:_

* svn export `file://$HOME/svn/project/` `$HOME/staging.website.co.uk/` --force

### FIND CHANGES TO A FILE BETWEEN PREVIOUS AND CURRENT REVISION ###
* svn diff -r `PREV`:`COMMITTED` `file`
* svn diff `COLOURED DIFF OF <FILE> USING VIM` | vim -R -
* svn log -r `PREV`:`COMMITTED` -v

### CREATE A NEW SVN REPO AND COPY AN EXISTING SVN REPO TO IT ###
* svnadmin dump `svn/dev` > `full.dump`
* svnadmin load --force-uuid `svn/dev2` < `full.dump`
* svnadmin setuuid `svn/dev2` `[UUID - use svn info to find out the UUID]`
* svn switch --relocate `http://svn.oldlink.co.uk/dev` `http://svn.newlink.co.uk/dev`
* grep --before-context=3 --after-context=3 -r --exclude=`*{svn,entries,svn-base,tmp,save,all-wcprops,xml}` `"old string"` *
* grep -rl --exclude=`*{svn,entries,svn-base,tmp,save,all-wcprops,xml}` `"old string"` * | xargs sed -i 's/`old string`/`new string`/g'
* update `table` set `field` = replace(`field`,'`old string`','`new string`');

### CREATE SVN POST COMMIT HOOK FOR AUTOMATIC DEPLOYMENT TO STAGING/LIVE SERVER ###
* In the `svn` root directory navigate to the `hooks` folder
* Find the file `post-commit.tmpl` and edit it by adding some shell commands! For example:

        #!/bin/sh
    
        REPOS="$1"
        REV="$2"
    
        svn export $REPOS /home/user/public --force
    
* You will want to save the file as `post-commit` and ensure its permissions are 755 with:

    	chmod 755 post-commit
    
* You will also want to ensure that the file's owner is your username and not someone else's!

* If this does not work check to make sure the $REPOS path is correct or use a hard coded path with the `file://` protocol if you only have one repo e.g. `file://$HOME/svn/project/`

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
* --skip-add-drop-table
* --skip-comments
* --no-create-info _or_ -t
* --no-data _or_ -d

### IMPORT SQL file with mysql ###
* `C:\xampp\mysql\bin\`mysql`.exe` -u `root` -p`password` -h `hostname` `database` < `output.sql`

## CHANGE MYSQL PASSWORD ##
* mysqladmin -u `username` -p'`oldpassword`' password '`newpassword`'

## CONNECT TO A MYSQL SERVER REMOTELY ##
_First login to the MySQL command-line_

### Create a User ###
* mysql> CREATE USER '`username`'@'%' IDENTIFIED BY '`password`';

### Grant a User Privileges ###
* mysql> GRANT ALL PRIVILEGES ON `database`.* TO '`username`'@'%' WITH GRANT OPTION;

## COMBINE MULTIPLE CSVs INTO ONE FILE `Windows/DOS` ##
* cd `dir`
* copy \*.csv `all`.csv

## FIND AND REPLACE DATA IN MYSQL ##
* update `table_name` set `field_name` = replace(`field_name`,'`string_to_find`','`string_to_replace`');

## UPDATING VALUES OF ONE TABLE USING ANOTHER TABLE ##

_Important: make sure that the temporary table has a foreign key (id) from the table you want to update, so that a relationship between the two tables can be created easily_

You can use [`LOAD DATA INFILE`][1] to bulk load the 800,000 rows of data into a temporary table, then use multiple-table [`UPDATE`][2] syntax to join your existing table to the temporary table and update the quantity values.

For example:

    CREATE TEMPORARY TABLE your_temp_table LIKE your_table;
    
    LOAD DATA INFILE '/tmp/your_file.csv'
    INTO TABLE your_temp_table
    FIELDS TERMINATED BY ','
    (id, product, sku, department, quantity); 
    
    UPDATE your_table
    INNER JOIN your_temp_table on your_temp_table.id = your_table.id
    SET your_table.quantity = your_temp_table.quantity;
    
    DROP TEMPORARY TABLE your_temp_table;

  [1]: http://dev.mysql.com/doc/refman/5.5/en/load-data.html
  [2]: http://dev.mysql.com/doc/refman/5.5/en/update.html

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

## GREP FOR FINDING INFO OR FIND & REPLACE ##
* grep --before-context=3 --after-context=3 -i `search text` * (non-recursive)
* grep --before-context=3 --after-context=3 -i -r `search text` ./* (recursive)
* grep -l -i `search text` * (non-recursive)
* grep -l -i -r `search text` ./* (recursive)
* grep -rl '`old text`' `directory` | xargs sed -i 's/`old text`/`new text`/g' (recursive find & replace)

## CONFIGURING A PACKAGE ##
_First cd to the directory of the package_

* ./configure
* make
* make install

## NODE INSTALLING & CHECKING VERSIONS ##
* npm install `package` -g
* npm install `package` --save
* npm install `grunt-contrib-mincss`@master --save-dev
* npm version
* npm ls
* npm shrinkwrap

## GIT REPOSITORY UPDATE & SUBMIT ##
_First cd to the directory of the package_

_(Please note that this default setup uses HTTPS not SSH, and therefore you will have to enter your username and password each time you push. If you don't want to do this then add the SSH origin as follows: git@github.com:username/repo.git)_

* git init _(only use once to setup git repo)_
* git add . **or** git add `file`
* git status _(check the correct files have been added)_
* git commit -m `"this is my messsage"`
* git remote add origin `ssh://git@github.com/username/repo.git`
* git push -u origin master
* git remote -v _(test remote origin is correct)_

## REMOVE FILE FROM GIT BUT KEEP LOCAL ##
* git rm --cached `file`

## REMOVE FOLDER FROM GIT BUT KEEP LOCAL ##
* git rm -r --cached `node_modules`

## CHANGE GIT REPO NAME & URL ##
_Git does not care what your folder in which you store your git repo is called but to change the repo's name, if you delete your old repo on GitHub then you can do the following_

1. First rename your existing folder to your new repo name
2. Edit `.git/config` and change the name
3. Update the remote origin (example uses SSH): `git remote set-url origin ssh://git@github.com/username/repo.git`

## NOT HAVING TO ENTER USERNAME AND PASSWORD FOR GIT (BY USING SSH INSTEAD OF HTTPS) ##
1. Generate a new SSH key: `ssh-keygen -t rsa -C "your_email@youremail.com"`
2. Enter a passphrase when asked the question `Enter passphrase`
3. Install xclip for copying the SSH key: `sudo apt-get install xclip`
4. Copy the key using xclip: `xclip -sel clip < ~/.ssh/id_rsa.pub`
5. Go to [GitHub Settings](https://github.com/settings), click `SSH Keys` and paste in your key **without** any extra lines
6. Now in Terminal/Shell type the following `ssh -T git@github.com`, click yes to any warning and it should say:

		Hi _username_! You've successfully authenticated, but GitHub does not provide shell access.
		
7. Then `cd` back to your repo and update the remote origin to use SSH: `git remote set-url origin ssh://git@github.com/username/repo.git`
8. Do a `commit` and `push` it to test if it works!

## KEEP YOUR LOCAL GIT REPOS UP-TO-DATE WITH AN AUTOMATIC GIT PULL CRONJOB ##
_This file should be added to /etc/cron.hourly/. Git repos, as denoted by the FILES variable, should all be available under the same folder inside subfolders._

		#!/bin/bash
		FILES=/dir/to/repos/*
		for f in $FILES
		do
		    if [ -d $f ] && [ -d $f/.git ]
		        then
		            echo "Processing Git repository, $f"
		            cd $f
		            git --git-dir="$f/.git" pull -q
		    fi;
		done

## UPDATE HEROKU APP ##
_First commit files to git and then..._

* git push heroku master

## UPDATE APPFOG APP ##
_First cd to the directory of the app_

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
_No sudo on some hosting providers_

* sudo find `/path/to/directory` -type f -print0 | xargs -0 sudo chmod 644

## CHMOD DIRECTORIES UNDER A DIRECTORY TO 755 (DRWXR-XR-X) (includes directory) ##
_No sudo on some hosting providers_

_First navigate to the parent directory_

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
_Where "iwl3945" is the wireless driver, found with sudo lshw -C network_

1. gksudo geany /etc/modprobe.d/iwl3945.conf **or** gksudo geany /etc/modprobe.d/iwl3945-disable11n.conf
2. options iwl3945 disable_hw_scan=0 **or** options iwl3945 11n_disable=1

## APACHE/MYSQL START, STOP, RESTART ##
* sudo a2dissite `default` && sudo a2ensite `mysite`
* sudo service apache2 start
* sudo service apache2 stop
* sudo service apache2 restart
* sudo service mysql start
* sudo service mysql stop

## APACHE ENABLE MODULES ##
* sudo a2enmod `module`

## APACHE ACCESS & ERROR LOG ##
* tail -f  /var/log/apache2/error.log
* tail -f  /var/log/apache2/access.log

## SETTING UP A LOCAL DEV ENVIRONMENT WITH VIRTUAL HOSTS ##
* Create a new virtual host file in `/etc/apache2/sites-available/` e.g. `websitename.conf`, as follows:

		NameVirtualHost *:80
		<VirtualHost *:80>
		    ServerAdmin webmaster@localhost
		    ServerName websitename.dev
		    ServerAlias www.websitename.dev
		
		    DocumentRoot /dir/to/website
		    <Directory />
		        Options FollowSymLinks
		        AllowOverride All
		    </Directory>
		    <Directory /dir/to/website>
		        Options Indexes FollowSymLinks MultiViews
		        AllowOverride All
		        Order allow,deny
		        Allow from all
		        Require all granted
		    </Directory>
		
		    ErrorLog ${APACHE_LOG_DIR}/error.log
		    CustomLog ${APACHE_LOG_DIR}/access.log combined
		</VirtualHost>
		
* Now enable the site with `sudo a2ensite websitename`
* Run `sudo service apache2 restart`
* Add your new `websitename.dev` to `/etc/hosts` using your localhost ip address e.g. `127.0.0.1`, as follows:

		127.0.0.1   websitename.dev www.websitename.dev

* Now try loading `websitename.dev/` in your browser to see if it works, if not, try the following:
	* `ping websitename.dev/` should bring back your localhost ip address `127.0.0.1`. If not, check your hosts file again
	* Delete your browser cache
	* Try loading the website in a different browser
	* Try reloading apache again


## SSH SECURE SHELL ##
* ssh `username`@`hostname`
* ssh -l `username` `hostname`

_You will be prompted for the password_

## SSH PASSWORD-LESS LOGIN ##
_From your local Linux PC run the following in Shell/Bash_

* ssh-copy-id -i ~/.ssh/id_rsa.pub `username`@`hostname`

_You will be prompted for the password_

## LIST PROCESSES ##
* ps -e

## KILL A PROCESS ##
* killall -9 `appname/process name`

## SCHEDULED SHUTDOWN/RESTART (24 Hour Clock) ##
_Shutdown at HH:MM_

* sudo shutdown -P `HH:MM`

_Restart Now_

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

_Press Control + D to complete_

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
* rsync -arvz --checksum --delete --progress --stats `/localdir/files/` `username`@`mydomain.com`:`/remotedir/files/`

## REMOTE TO LOCAL SYNC ##
* rsync -arvz --checksum --delete --progress --stats `username`@`mydomain.com`:`/remotedir/files/` `/localdir/files/`
