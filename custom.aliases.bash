cite about-alias
about-alias 'my custom aliases'

alias default='sudo a2dissite mrlawyer && sudo a2ensite default && sudo service apache2 reload'
alias mrlawyer='sudo a2dissite default && sudo a2ensite mrlawyer && sudo service apache2 reload'
alias code='cd /media/Data/code'
alias nd='NODE_ENV=dev node app.js'
alias selenium='java -jar /media/Data/code/lib/selenium-server-standalone-2.32.0.jar'
alias refresh='bash-it disable alias custom && bash-it enable alias custom'
