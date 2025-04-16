#!/bin/bash

# Script YAMAV2 - By Emperor Sukuna | WhatsApp: +2250501889640

# Fonction pour afficher le logo YAMA
display_logo() {
    clear
    echo "  __     _____     ____   ____    _____    "
    echo " |  |   |  _  |   |  _  | |  _  |  |  _  |   "
    echo " |__|   | |_| |   | |_| | | |__| |  | |_| |   "
    echo "       ___   ___   ___   ___  ___   ___   "
    echo "YAMA TECH | by Emperor Sukuna"
    echo "WhatsApp: +2250501889640"
    echo "-------------------------------------------"
    echo ""
}

# Fonction de vérification de modification du script
check_script_integrity() {
    original_script_hash="d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2"  # Remplacez par le hash MD5 du script original
    current_script_hash=$(md5sum "$0" | awk '{ print $1 }')
    
    if [ "$original_script_hash" != "$current_script_hash" ]; then
        echo "Le script a été modifié, il ne fonctionne plus."
        exit 1
    fi
}

# Fonction pour afficher le menu
show_menu() {
    display_logo
    echo "1. Installer Node.js"
    echo "2. Installer Python"
    echo "3. Installer Java"
    echo "4. Changer la couleur de Termux"
    echo "5. Ajouter un mot de passe à Termux"
    echo "6. Quitter"
    echo "-------------------------------------------"
    read -p "Choisissez une option : " option
}

# Fonction pour installer Node.js
install_nodejs() {
    apt update && apt upgrade -y
    apt install nodejs -y
    apt install npm -y
    echo "Node.js et NPM ont été installés."
    read -p "Appuyez sur Entrée pour revenir au menu."
}

# Fonction pour installer Python
install_python() {
    apt update && apt upgrade -y
    apt install python python3 python3-pip -y
    echo "Python a été installé."
    read -p "Appuyez sur Entrée pour revenir au menu."
}

# Fonction pour installer Java
install_java() {
    apt update && apt upgrade -y
    apt install default-jdk -y
    echo "Java a été installé."
    read -p "Appuyez sur Entrée pour revenir au menu."
}

# Fonction pour changer la couleur de Termux
change_termux_colors() {
    echo "Choisissez une couleur pour le texte :"
    echo "1. Rouge"
    echo "2. Vert"
    echo "3. Bleu"
    read -p "Choisissez une couleur (1/2/3) : " color_option
    
    if [ "$color_option" == "1" ]; then
        echo -e "\033[31mTexte rouge sélectionné."
    elif [ "$color_option" == "2" ]; then
        echo -e "\033[32mTexte vert sélectionné."
    elif [ "$color_option" == "3" ]; then
        echo -e "\033[34mTexte bleu sélectionné."
    fi
    read -p "Appuyez sur Entrée pour revenir au menu."
}

# Fonction pour ajouter un mot de passe à Termux
add_password() {
    echo "Entrez un nouveau mot de passe : "
    read -sp "New password: " password
    echo
    read -sp "Enter password again: " password2
    echo

    if [ "$password" == "$password2" ]; then
        echo "$password" > ~/.termux_password
        echo "Mot de passe enregistré avec succès."
        echo "À partir de maintenant, vous devrez entrer votre mot de passe avant d'utiliser Termux."
    else
        echo "Les mots de passe ne correspondent pas."
    fi
    read -p "Appuyez sur Entrée pour revenir au menu."
}

# Fonction de verrouillage de Termux avec mot de passe
lock_termux() {
    if [ -f ~/.termux_password ]; then
        echo "Entrez votre mot de passe pour accéder à Termux :"
        read -sp "Password: " entered_password
        echo

        saved_password=$(cat ~/.termux_password)

        if [ "$entered_password" != "$saved_password" ]; then
            echo "Mot de passe incorrect. Termux se ferme."
            exit 1
        fi
    fi
}

# Fonction principale pour exécuter le script
main() {
    check_script_integrity
    lock_termux
    while true; do
        show_menu
        case $option in
            1)
                install_nodejs
                ;;
            2)
                install_python
                ;;
            3)
                install_java
                ;;
            4)
                change_termux_colors
                ;;
            5)
                add_password
                ;;
            6)
                exit 0
                ;;
            *)
                echo "Option invalide. Essayez à nouveau."
                ;;
        esac
    done
}

# Exécution du script
main
