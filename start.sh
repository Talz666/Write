#Warna
black="\033[1;30m"
red="\033[1;31m"
green="\033[1;32m"
yellow="\033[1;33m"
blue="\033[1;34m"
purple="\033[1;35m"
cyan="\033[1;36m"
violate="\033[1;37m"
white="\033[0;37m"
nc="\033[00m"
LRED='\033[01;31m'
LGREEN='\033[01;32m'
LYELLOW='\033[01;33m'
LBLUE='\033[01;34m'
LPURPLE='\033[01;35m'
LCYAN='\033[01;36m'
WHITE='\033[01;37m'

#Tetapan
creator="Talz666"
scname="Write Codee"
number=10
date=$(date)
filename="Write-Files"

#Pemberitahuan
info="${yellow}[${LGREEN}+${yellow}] ${LCYAN}"
loading="${yellow}[${WHITE}:${yellow}] ${LCYAN}"
error="${yellow}[${LRED}-${yellow}] ${LCYAN}"

#pilihan
choi1="${yellow}[${red}n${yellow}] ${red}> ${LCYAN}New File"
choi2="${yellow}[${red}s${yellow}] ${red}> ${LCYAN}My File"
choi3="${yellow}[${red}x${yellow}] ${red}> ${LCYAN}Exit${LGREEN}"

#language
listlang=("js" "py" "sh")

#loading
loading(){
  while [ $number -le 0 ]
  do
    echo -e "${loading}Loading In ${number}"
    (( --number ))
    clear
  done
  
  tampilan
}

#loadingsc
loadingsc(){
  clear
  echo -e "${loading}Please Wait -"
  sleep 1
  clear
  echo -e "${loading}Please Wait |"
  sleep 1
  clear
  echo -e "${loading}Please Wait -"
  sleep 1
  clear
  echo -e "${loading}Please Wait |"
  sleep 1
  clear
  echo -e "${loading}Please Wait -"
  sleep 1
}

#tampilan-awal
tampilan(){
  clear
  toilet -f future -F metal ${scname}
  echo -e "${yellow}[${LCYAN}${date}${yellow}]"
  echo ""
  echo -e "${choi1}"
  sleep 1
  echo -e "${choi2}"
  sleep 1
  echo -e "${choi3}"
  sleep 1
  echo ""
  read -p "Write @ Choice >> " choice
  if [ $choice = "n" ]
  then
    newfile
  elif [ $choice = "N" ]
  then
    newfile
  elif [ $choice = "s" ]
  then
    myfile
  elif [ $choice = "S" ]
  then
    myfile
  elif [ $choice = "x" ]
  then
    keluar
  elif [ $choice = "X" ]
  then
    keluar
  else
    echo -e "${error}Error 404"
    sleep 2
    tampilan
  fi
}

#Newfile Selection
newfile(){
  loadingsc
  clear
  toilet -f future -F metal "New File"
  echo -e "[${date}]"
  echo -e "
  ${yellow}[${red}0${yellow}] ${red}> ${yellow}Java Script
  ${yellow}[${red}1${yellow}] ${red}> ${yellow}Pyt${blue}hon
  ${yellow}[${red}2${yellow}] ${red}> ${green}Bash Shell
  "
  read -p "Select Language: " langname
  read -p "File Name: " filename
  cd /sdcard
  if [ -e $filename ]
  then
    cd
    cd Write
    nano ${filename}.${listlang[$langname]}
    mv ${filename}.${listlang[$langname]} cd /sdcard/$filename
    clear
    echo -e "${info}File Saved"
    sleep 2
    tampilan
  else
    loadingsc
    clear
    cd /sdcard
    mkdir $filename
    cd $filename
    nano ${filename}.${listlang[$langname]}
    clear
    echo -e "${info}File Saved"
    sleep 2
    tampilan
  fi
}

#MyFile Selection
myfile(){
  loadingsc
  clear
  cd /sdcard
  if [ -e $filename ]
  then
    cd /sdcard/$filename
    toilet -f future -F metal "Files"
    echo -e "${yellow}[${LCYAN}${date}${yellow}]${LCYAN}"
    echo ""
    ls
    echo ""
    read -p "Choose File: " file
    if [ -e $file ]
    then
      nano $file
      clear
      echo -e "${info}File Saved"
      sleep 2
      tampilan
    else
      clear
      echo -e "${error}${file} Not Found"
      sleep 1
      myfile
    fi
  else
    loadingsc
    clear
    mkdir $filename
    echo -e "${info}Your Set File Has Been Created Please Enter Again To Continue"
    sleep 4
    tampilan
  fi
}

#Keluar
keluar(){
  clear
  echo -e "${info}Thanks For Using This Script"
}

#MAIN
loading