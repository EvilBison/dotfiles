# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ws='cd /home/prod/www/domains/'
alias wss='cd /home/prod/scripts/'

# Source global definitions
if [ -f /etc/bashrc ]; then
#	. /etc/bashrc
fi

######################################################
#####################  SETTINGS  #####################
######################################################


# Define some colors first:
red='\e[0;31m'
RED='\e[1;31m'
blue='\e[0;34m'
BLUE='\e[1;34m'
cyan='\e[0;36m'
CYAN='\e[1;36m'
NC='\e[0m'              # No Color
# --> Nice. Has the same effect as using "ansi.sys" in DOS.


#****************************************************#
######################################################
###########  BASH FUNCTIONS COMMANDS  ################
######################################################
#****************************************************#

function diskusage(){
  command du -sh * | sort -n | tail
}


function extract()      # Handy Extract Program.
{
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xvjf $1     ;;
             *.tar.gz)    tar xvzf $1     ;;
             *.bz2)       bunzip2 $1      ;;
             *.rar)       unrar x $1      ;;
             *.gz)        gunzip $1       ;;
             *.tar)       tar xvf $1      ;;
             *.tbz2)      tar xvjf $1     ;;
             *.tgz)       tar xvzf $1     ;;
             *.zip)       unzip $1        ;;
             *.Z)         uncompress $1   ;;
             *.7z)        7z x $1         ;;
             *)           echo "'$1' cannot be extracted via >extract<" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}


function my_ip() # Get IP adresses.
{
    MY_IP=$(/sbin/ifconfig ppp0 | awk '/inet/ { print $2 } ' | sed -e s/addr://)
    MY_ISP=$(/sbin/ifconfig ppp0 | awk '/P-t-P/ { print $3 } ' | sed -e s/P-t-P://)
}



function ii()   # Get current host related info.
{
    echo -e "\nYou are logged on ${RED}$HOST"
    echo -e "\nAdditionnal information:$NC " ; uname -a
    echo -e "\n${RED}Users logged on:$NC " ; w -h
    echo -e "\n${RED}Current date :$NC " ; date
    echo -e "\n${RED}Machine stats :$NC " ; uptime
    echo -e "\n${RED}Memory stats :$NC " ; free
    my_ip 2>&- ;
    echo -e "\n${RED}Local IP Address :$NC" ; echo ${MY_IP:-"Not connected"}
    echo -e "\n${RED}ISP Address :$NC" ; echo ${MY_ISP:-"Not connected"}
    echo -e "\n${RED}Open connections :$NC "; netstat -pan --inet;
    echo
}

function changecolor(){

 case $1 in
             'red')   echo -e "${red}"    ;;
             'RED')   echo -e "${RED}"    ;;
             'blue')  echo -e "${blue}"    ;;
             'BLUE')  echo -e "${BLUE}"    ;;
             'cyan')  echo -e "${cyan}"    ;;
             'CYAN')  echo -e "${CYAN}"    ;;
             'NC')    echo -e "${NC}"    ;;             
             *)           echo "'$1' is not defined try (red, RED, blue BLUE, cyan, CYAN, NC to resete the color)" ;;
 esac

}

####################################################################
######################### Greetings ################################
####################################################################

#-------------------------------------------------------------
# Greeting, motd etc...
#-------------------------------------------------------------


# Looks best on a terminal with black background.....
echo -e "${CYAN}This is BASH ${RED}${BASH_VERSION%.*}\
${CYAN} - Alert ${RED}SMS Sended${NC}\n"
#./sendsms.pl
date
if [ -x /usr/bin/fortune ]; then
#    /usr/games/fortune -s     # Makes our day a bit more fun.... :-)
    /usr/bin/fortune -s  # centos path :D
fi

function _exit()        # Function to run upon exit of shell.
{
   echo -e "${RED}Hasta la vista, baby${NC}"
  clear
}
trap _exit EXIT



####################################################################
######################  MISC FUNCTIONS  ############################
####################################################################

PATH=$PATH:/usr/share/Zend/bin
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/share/Zend/library

####################################################################
############################## ALIAS ###############################
####################################################################

alias tkill='exit';
alias cf='cd /etc/nginx/';

