#!/bin/sh
home () {
clear
echo "welcome User"
echo "Please select and option from the designated numbers"
echo "1.Create a folder"
echo "2.Change Rights of a File"
echo "3.Search File"
echo "4.Create Process and Threads"
echo "5.Display Process"
echo "6.Open Application"
echo "7.Run an example of sub menu process"
echo "8.Run-Execute-Delete Program"
echo "9.Scheduling Algorithms"
echo "10.Run a sub-script"
echo "Enter 0 to exit"
read -p "Enter your option from [0-10]==" useroption
if [ $useroption == 1 ]
then
   Create_folder
fi
if [ $useroption == 0 ]
then
    clear
    exit
fi
if [ $useroption == 2 ]
then
    Change_File_Rights
fi

if [ $useroption == 3 ]
then
    Find_Files
fi
if [ $useroption == 5 ]
then
    Create_Process
fi
if [ $useroption == 6 ]
then
    Open_app
fi
if [ $useroption == 7 ]
then
    Run_Example
fi
if [ $useroption == 9 ]
then
    Run_Schedule
fi
if [ $useroption == 10 ]
then
    Sub_Script
fi
}

   
Create_folder () {
   clear
   read -p "Enter Destination to where the folder needs to be created i.e home/Desktop==" destination
   cd $destination
   Result=$?
   if [ $Result -eq 0 ]
   then
    read -p "Enter folder name=" folder_name
    mkdir $folder_name
    clear
    echo "Folder Created see below"
    ls -l
    read -p "Press Enter to go back" enter
    clear
    home
   else
    read -p "wrong Destination Press Enter to go back"
    clear
    Create_folder
   fi
}
Change_File_Rights () {
clear
cd ~
ls -l
echo "Here is the home directory"
a=1
while [ $a == 1 ]
do 
read -p "Enter 1 to change directory or 2 to select file =" a

if [ $a == 1 ]
then 
    ls -l 
    read -p "Enter The directory=" change
    clear
    cd $change
    ls -l
fi
done
if [ $a == 2 ]
then
  clear
  cd $change
  ls -l
  read -p "Enter file name =" $filename
  read -p "Enter rights detail i.e 777 or 775 =" $rights
  chmod $rights $filename 
  clear
  ls -l 
  echo "rights changed"
  read -p "Enter to go home"
  home
  fi
}
Find_Files () {
clear
a=1
read -p "Enter 1 to find file or 2 to change directory="
while [ $a == 1 ]
do
    ls -l 
    read -p "Enter The directory=" change
    clear
    cd $change
    read -p "Enter 1 to find file or 2 to change directory=" a
    clear
    ls- l
done
clear
ls -l
read -p "Enter file name= " filename
find -name $filename
read -p "Press Enter to go home"
home
}
Create_Process () {
clear
ps -aux
read -p "select process_id for the process to be killed or type 0 to go back=" ps
if [ $ps == 0 ]
then
    home
else

kill $ps
clear
ps -aux
echo "Process Killed"
read -p "Press Enter to Go Back Home"
home
fi
}
Open_app () {
clear
read -p "Enter App Name =" AppName
$AppName
clear
read -p "Press Enter to go Home" 
home
}
Run_Example () {
clear
echo "Enter string variable !!"
./task2
read -p "Press Enter to Continue"
home
}
Run_Schedule () {
clear
echo "1 for FCFS"
echo "2 for SJF"
echo "3 for RR"
read -p "Enter number 1-3 for the desired scheduling algorithm =" algorithm
if [ $algorithm == 1 ]
then
    clear
    ./FCFS
    read -p "Press Enter to Continue"
    home
fi
if [ $algorithm == 2 ]
then
    clear
    ./SJF
    read -p "Press Enter to Continue"
    home
fi
if [ $algorithm == 3 ]
then
    clear
    ./RR
    read -p "Press Enter to Continue"
    home
else
echo "Wrong Value inserted "
read -p "Press Enter to go back"
Run_Schedule
fi
}
Sub_Script () {
clear
read -p "Enter your script name i.e test1.sh =" script
vi $script
read -p "Want to run yes/no =" $decision
if [ $decision == 'yes' ]
then
    chmod 777 $script
    ./$script
    read -p "Press Enter to go back"
    home
else
    read -p "Press Enter to go back"
    home
fi
}
home

