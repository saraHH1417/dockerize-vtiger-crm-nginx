#!/bin/bash
# ******************************************
# Program: ParsVT MySQL Tuner
# Developer: Hamid Rabiei
# Date: 1401-07-01
# Last Updated: 1401-07-01
# ******************************************
set -e
# Reset
Color_Off='\033[0m'       # Text Reset
# Regular Colors
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Blue='\033[0;34m'         # Blue
Yellow='\033[0;33m'       # Yellow
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
output () {
	echo -e " $1"
}
echo -e "$Yellow  ___            __   _______              "
echo -e " | _ \__ _ _ _ __\ \ / /_   _|__ ___ _ __  "
echo -e " |  _/ _\` | '_(_-<\ V /  | |_/ _/ _ \ '  \ "
echo -e " |_| \__,_|_| /__/ \_/   |_(_)__\___/_|_|_|"
echo -e "                                           $Color_Off"
echo -e "$Purple \n MySQLTuner is a script written in Perl that allows you to review a MySQL installation quickly and"
echo -e " make adjustments to increase performance and stability. The current configuration variables and"
echo -e " status data is retrieved and presented in a brief format along with some basic performance suggestions.\n$Color_Off"
echo -e "$Cyan MySQLTuner supports ~300 indicators for MySQL/MariaDB/Percona Server in this last version.\n$Color_Off"
echo -e "$Blue Before start you must install Perl (https://www.perl.org/get.html) on your system and$Color_Off"
echo -e "$Blue add PHP to your OS Environment Variables$Color_Off"
echo -e "$Blue Run script? (y/n)$Color_Off"
read -e run
if [ "$run" == n ] ; then
	output "$Red Operation aborted!$Color_Off";
	exit;
else
BASEDIR=$(dirname "$0")
cd "$BASEDIR"
file="mysqltuner.pl"
if [ ! -f "$file" ] ; then
   wget -O mysqltuner.pl https://license.aweb.co/download/mysqltuner.pl
fi
chmod +x mysqltuner.pl
OS=$(php -r 'echo substr(PHP_OS, 0, 3);')
if [ "$OS" == "WIN" ] ; then
 CRMPATH=$(php -r 'echo substr(getcwd(), 0, 2);')
 echo $CRMPATH
 cd $BASEDIR
fi
OSNAME=$(php -r "echo PHP_OS;")
PHPVERSION=$(php -v)
output "Operating System Information: $Green$OSNAME$Color_Off"
output "PHP Version: $Green"
output "$PHPVERSION"
output "$Color_Off"
DBUSERNAME=$(php -r "require '../../../../config.inc.php'; echo \$dbconfig['db_username'];")
DBPASSWORD=$(php -r "require '../../../../config.inc.php'; echo \$dbconfig['db_password'];")
DBHOST=$(php -r "require '../../../../config.inc.php'; echo \$dbconfig['db_server'];")
MYSQLTUNERLOG=$(php -r "require '../../../../config.inc.php'; echo \$root_directory.'logs/mysqltuner.log';")
echo $ROOTDIRECTORY;
chmod +x mysqltuner.pl
perl "$BASEDIR"/mysqltuner.pl --host $DBHOST --user $DBUSERNAME --pass $DBPASSWORD --color --nogood --noinfo --buffers --pfstat --debug --outputfile $MYSQLTUNERLOG
output "\n  Please check log in the following path: "
output "$Green $MYSQLTUNERLOG $Color_Off\n"
output "$Red Notice:$Yellow MySQLTuner is a read only script. It won't write to any configuration files, change the status of any daemons,"
output " or call your mother to wish her a happy birthday. It will give you an overview of your server's performance and"
output " make some basic recommendations for improvements that you can make after it completes$Color_Off\n"
fi
