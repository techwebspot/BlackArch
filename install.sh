#!/bin/bash

red='\033[1;31m'
NC='\033[0m'

echo -e """ 

+---------------------------------------------------------------------------------+
|                            Author:- Techwebspot                                 |
+---------------------------------------------------------------------------------+
          ___ _         _      _          _      ___                  
         | _ ) |__ _ __| |__  /_\  _ _ __| |_   | _ \___ _ __  ___ ___
         | _ \ /  \` / _| / / / _ \| '_/ _| ' \  |   / -_) '_ \/ _ (_-<
         |___/_\__,_\__|_\_\/_/ \_\_| \__|_||_| |_|_\___| .__/\___/__/
                                                       |_|           
                                                       
                           _         _        _ _ 
                          (_)_ _  __| |_ __ _| | |
                          | | ' \(_-<  _/ _\` | | |
                          |_|_||_/__/\__\__,_|_|_|
                        
${red}
                                       -                                                   
                                      .o+                 
                                      ooo/                 
                                     +oooo:                                                                                  
                                    +oooooo:               
                                   -+oooooo+:              
                                  /:-:++oooo+:             
                                 /++++/+++++++:            
                                /++++++++++++++:           
                               /+++ooooooooooooo/         
                             ./ooosssso++osssssso+        
                            .oossssso-    /ossssss+       
                           -osssssso.      :ssssssso.      
                          :osssssss/        osssso+++.     
                         /ossssssss/        +ssssooo/-     
                        /ossssso+/:-        -:/+osssso+-   
                       +sso+:-                   .-/+oso:  
                      ++:.                            -/+/
                     .                                   / 
${NC} """


if [ $EUID != 0 ]
then
	echo "------------------------------------------------------------------------------------"
	echo "                       [-] Error: You must run as a root                            "
	echo "------------------------------------------------------------------------------------"
	exit 1
fi


echo -e "Checking the system...\n"

echo -e "[+] Setting up the installation for blackarch repos...\n"

mkdir BlackArch-repos

echo -e "[+] Making new directory for repos...\n"

cd BlackArch-repos

echo -e "[+] Downloading the blackarch repos file...\n"

curl -O https://blackarch.org/strap.sh

echo -e "[+] Giving the permission to repos...\n"

chmod +x strap.sh

echo -e "[+] Installing the blackarch repos...\n"

./strap.sh

echo -e "\n[+] Removing unnecessary files...\n"

cd ..

rm -r BlackArch-repos

echo -e "[+] Copying the main file to system directory...\n"

cp BlackArch /usr/local/bin/BlackArch

cd /usr/local/bin/ && chmod +x BlackArch

echo -e "[+] Giving the permission to tool...\n"

echo -e "[+] BlackArch repos installed successfully \n"

echo -e "Type 'BlackArch' in terminal from any directory to start the script \n"
