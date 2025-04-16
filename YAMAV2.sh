#!/bin/bash
# YAMA TOOLS by Emperor Sukuna
# WhatsApp: +2250501889640
# Instagram: j.m.h.2024

# Protection: empêche la modification
chmod 555 $0

# Couleurs
cyan='\033[0;36m'
green='\033[1;32m'
red='\033[1;31m'
reset='\033[0m'

# Logo YAMA
logo() {
clear
echo -e "${red}
__     ______  __  __      _      
\ \   / / __ \|  \/  |    | |     
 \ \_/ / |  | | \  / | ___| |__  
  \   /| |  | | |\/| |/ _ \ '_ \ 
   | | | |__| | |  | |  __/ |_) |
   |_|  \____/|_|  |_|\___|_.__/  
       ${cyan}By Emperor Sukuna${reset}
       WhatsApp: +2250501889640
       Instagram: j.m.h.2024
"
}

# Fonction: mot de passe Termux
set_password() {
  echo -e "${cyan}Créer un mot de passe pour Termux${reset}"
  read -p "New password: " pass1
  read -p "Enter password again: " pass2
  if [[ "$pass1" == "$pass2" ]]; then
    echo "echo 'Mot de passe Termux'" > ~/.termuxpass
    echo "[[ \$(read -p 'Password: ' p; echo \$p) == \"$pass1\" ]]" >> ~/.termuxpass
    echo "|| { echo 'Mot de passe incorrect'; exit; }" >> ~/.termuxpass
    chmod +x ~/.termuxpass
    grep -qxF 'source ~/.termuxpass' ~/.bashrc || echo "source ~/.termuxpass" >> ~/.bashrc
    echo -e "${green}Mot de passe activé avec succès !${reset}"
  else
    echo -e "${red}Les mots de passe ne correspondent pas.${reset}"
  fi
  sleep 2
  menu
}

# Fonction: changer couleurs Termux
change_color() {
  echo -e "${cyan}Changer les couleurs de Termux${reset}"
  pkg install termux-api -y
  termux-reload-settings
  termux-style
  sleep 2
  menu
}

# Installation langages
install_node() {
  pkg uninstall nodejs -y
  pkg install nodejs -y
  sleep 2
  menu
}

install_python() {
  pkg uninstall python -y
  pkg install python -y
  sleep 2
  menu
}

install_java() {
  pkg uninstall openjdk -y
  pkg install openjdk -y
  sleep 2
  menu
}

install_php() {
  pkg uninstall php -y
  pkg install php -y
  sleep 2
  menu
}

install_ruby() {
  pkg uninstall ruby -y
  pkg install ruby -y
  sleep 2
  menu
}

install_perl() {
  pkg uninstall perl -y
  pkg install perl -y
  sleep 2
  menu
}

install_c() {
  pkg uninstall clang -y
  pkg install clang -y
  sleep 2
  menu
}

menu() {
logo
echo -e "${green}1. Installer NodeJS"
echo "2. Installer Python"
echo "3. Installer Java"
echo "4. Installer PHP"
echo "5. Installer Ruby"
echo "6. Installer Perl"
echo "7. Installer C/C++"
echo "8. Changer couleur de Termux"
echo "9. Activer mot de passe au démarrage"
echo "0. Quitter${reset}"
read -p "Choix > " choix

case $choix in
  1) install_node ;;
  2) install_python ;;
  3) install_java ;;
  4) install_php ;;
  5) install_ruby ;;
  6) install_perl ;;
  7) install_c ;;
  8) change_color ;;
  9) set_password ;;
  0) exit ;;
  *) echo -e "${red}Choix invalide${reset}"; sleep 1; menu ;;
esac
}

menu
