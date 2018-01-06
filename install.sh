#!/bin/bash
# Installer

if [ ! "$(whoami)" == "root" ]; then 
	echo "Run this script as root"
	exit
fi

INSTALL_FROM_LOCAL=
while [ $# -gt 0 ]
do
	key="$1"

	case $key in

		-l|--local)
		INSTALL_FROM_LOCAL=true
		shift
		;;

		--uninstall)
		if [ -L "/bin/woodyssl" ]; then
			rm /bin/woodyssl
		fi
		if [ -d /var/woodyssl ]; then
			rm -rf /var/woodyssl
		fi
		exit
		;;

		*)
		;;
	esac
done

command -v openssl > /dev/null || { echo "openssl is not installed. Install it with 'sudo apt-get install openssl' first"; exit; }
command -v git > /dev/null || { echo "wget is not installed. Install it with sudo 'apt-get install git' first"; exit; }

if [ -d /var/woodyssl ]; then
	rm -rf /var/woodyssl
fi
mkdir /var/woodyssl

if [ -z "${INSTALL_FROM_LOCAL}" ]; then
	git clone https://github.com/huangy10/quick-ca-signer -s /var/woodyssl
else
	if [ -f "./woodyssl" ] && [ -d "./templates" ]; then
		cp -r ./* /var/woodyssl
	fi
fi
cd /var/woodyssl

rm -rf ./README.md ./.git ./.gitignore
if [ -L "/bin/woodyssl" ]; then
	rm /bin/woodyssl
fi
ln -s /var/woodyssl/woodyssl /bin/woodyssl
