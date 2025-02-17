#!/bin/bash

# Définition des couleurs et du style avec une palette plus professionnelle
declare -A COLORS=(
    ["PRIMARY"]='\033[38;5;255m'     # Blanc
    ["SUCCESS"]='\033[38;5;71m'     # Vert apaisant
    ["WARNING"]='\033[38;5;184m'    # Jaune doux
    ["ERROR"]='\033[38;5;167m'      # Rouge atténué
    ["INFO"]='\033[38;5;74m'        # Bleu clair
    ["HEADER"]='\033[38;5;140m'     # Violet clair pour les titres
    ["BG"]='\033[48;5;16m'           # Fond noir (modifié)
    ["RESET"]='\033[0m'             # Reset
    ["TITLE"]='\033[38;5;208m'      # Orange pour les titres
    ["GRIS"]='\033[38;5;245m'        # GRIS
)

# Variables globales
USERNAME=""
LANG_CHOICE=""
BLOCKCHAIN_TYPE=""
MONERO_VERSION="0.18.3.4"
CURRENT_MOUNT_POINT=""
export LANG_CHOICE=""

# Fonction pour dessiner la bannière
draw_banner() {
    echo -e "${COLORS[TITLE]}"
    echo "  *     *   ***   *   * ***** ****   ***   "
    echo "  **   **  *   *  **  * *     *   * *   *  "
    echo "  * * * * *     * * * * ****  ****  *   *  "
    echo "  *  *  * *     * *  ** *     * *   *   *  "
    echo "  *     *  *   *  *   * *     *  *  *   *  "
    echo "  *     *   ***   *   * ***** *   *  ***   "
    echo "  ═════════════ ▌EASYNODE▐ ══════════Wsl2 "
    #echo " ════════════ EASYNODE ═══════════v1.wsl   "
    echo -e "${COLORS[RESET]}"
}

# Configuration du terminal
setup_terminal() {
    echo -e "${COLORS[BG]}"
    clear
    printf '\033]11;#1a1a1a\007'
    draw_banner
}

# Fonction d'affichage stylisé
print_styled() {
    local style=$1
    local message=$2
    echo -e "${COLORS[$style]}${message}${COLORS[RESET]}"
}

# Messages d'information
info() { print_styled "INFO" "ℹ $1"; }
error() { print_styled "ERROR" "✖ $1"; }
warning() { print_styled "WARNING" "⚠ $1"; }
success() { print_styled "SUCCESS" "✓ $1"; }

# Fonction pour afficher les en-têtes
print_header() {
    local message=$1
    #clear
    setup_terminal
    echo -e "\n"
    echo -e "${COLORS[TITLE]}"
    echo "═══════════════════════════════════════════════════"
    printf "%*s%s%*s\n" $(((50-${#message})/2)) "" "$message" $(((49-${#message})/2)) ""
    echo "═══════════════════════════════════════════════════"
    echo -e "${COLORS[RESET]}"
    echo
}


# Fonction pour obtenir les messages selon la langue
get_message() {
    local fr_msg=$1
    local en_msg=$2
    if [ "$LANG_CHOICE" = "FR" ]; then
        echo "$fr_msg"
    else
        echo "$en_msg"
    fi
}

# Sélection de la langue
select_language() {
    #clear
    setup_terminal
    echo -e "\n\n"
    print_header "LANGUAGE SELECTION / CHOIX DE LA LANGUE"
    
    while true; do
        print_styled "PRIMARY" "1) Français"
        print_styled "PRIMARY" "2) English"
        echo -n "$(print_styled "TITLE" "Choose/Choisissez (1-2): ")"
        read -r lang_choice
        case $lang_choice in
            1) LANG_CHOICE="FR"; break ;;
            2) LANG_CHOICE="EN"; break ;;
            *) error "Invalid choice / Choix invalide" ;;
        esac
    done
}
#######
#manuel
 Manuel() {
   clear
   setup_terminal
   echo -e "\n\n\n\n\n\n\n\n"  # Espace pour la bannière
   print_header "$(get_message "GUIDE" "HOW TO")"
    
   print_styled "TITLE" "$(get_message "Pour une installation complète, suivez ces étapes dans l'ordre:" "For a complete installation, follow these steps in order:")"
   echo
   
   print_styled "SUCCESS" "$(get_message "  >Commencer par le N°1) et continuer dans l'ordre 2),3),4) jusqu'au N°5)." "  >Start with Number 1) and continue in order 2),3),4) until Number 5.)")"
   echo
   print_styled "SUCCESS" "$(get_message "  >Puis faire le 6) si vous souhaitez démarrer sur le disque interne." "  >Then do 6) if you want to boot on the internal disk.")"
   echo
   print_styled "SUCCESS" "$(get_message "  >Ou faite le 8) si vous déplacez le noeud vers un disque externe puis 6) pour démarrer." "  >Or do 8) if you want to move the node to an external disk then again 6) to start.")"
   echo
   print_styled "TITLE" "$(get_message "═══════════════════════════════════════════════════" "═══════════════════════════════════════════════════")"
   print_styled "TITLE" "$(get_message "                   AUTRES" "                     OTHER")"
   print_styled "TITLE" "$(get_message "═══════════════════════════════════════════════════" "═══════════════════════════════════════════════════")"
   echo
   print_styled "GRIS" "$(get_message "  >Le N°6) Démarre le Noeud et introduit l'exclusion des 'IP bans listées'." "  >N°6 Start the Node and introduce the exclusion of the 'listed IP bans'.")"
   echo
   print_styled "GRIS" "$(get_message "  >Le N°9) Sert à démonter la blockchain du disque externe," "  >N°9) Is used to unmount the blockchain from the external disk,")"
   print_styled "GRIS" "$(get_message "   si vous souhaitez retournez vers le disque interne. puis faire le 6) pour démarrer." "   if you wish return on internal disk, then do 6) to start to the internal disk.")"
   echo
   print_styled "GRIS" "$(get_message "  >Le N°4 sert aussi de DEBUG du chemin de demarrage vers le disque interne." "  >N°4) Also serves as DEBUG of the boot path ti internal disk.")"
   echo
   print_styled "PRIMARY" "$(get_message "   CTRL+C 1 seule fois pour arreter la Blockchain et revenir au menu." "   CTRL+C 1 time only to stop the Blockchain and return to the menu.")"
   echo
   print_styled "WARNING" "$(get_message "⚠️ Important: REDIRIGER le port 22 et 18080 de votre Box internet" "⚠️ Important: REDIRECT port 22 and 18080 from your internet router")"
   print_styled "WARNING" "$(get_message "  vers l'adresse 'ip local' de votre PC" "   to your 'local ip' of your PC")"
   echo
    read -p "$(print_styled "PRIMARY" "$(get_message "Appuyez sur Entrée pour revenir au menu..." "Press Enter to return to menu...")")"
}
#######

#mise à jour systeme
update_system() {
    print_header "$(get_message "MISE À JOUR DU SYSTÈME" "SYSTEM UPDATE")"
    
# Vérification WSL2 (déplacée depuis check_and_update_wsl)
    info "$(get_message "Vérification de la version WSL..." "Checking WSL version...")"
    if ! grep -q "WSL2" /proc/version; then
        warning "$(get_message "WSL2 n'est pas détecté. Tentative de mise à jour automatique..." "WSL2 not detected. Attempting automatic update...")"
        
        # Obtenir le nom de la distribution actuelle
        DISTRO_NAME=$(wslpath -w ~ | cut -d'\' -f3)
        
        # Tentative de conversion vers WSL2
        info "$(get_message "Tentative de conversion vers WSL2..." "Attempting to convert to WSL2...")"
        powershell.exe -c "wsl --set-version $DISTRO_NAME 2" >/dev/null 2>&1

        if [ $? -eq 0 ]; then
            success "$(get_message "Conversion vers WSL2 réussie" "Successfully converted to WSL2")"
            info "$(get_message "Redémarrage de WSL nécessaire" "WSL restart required")"
            
            echo -n "$(print_styled "PRIMARY" "$(get_message "Voulez-vous redémarrer WSL maintenant ? (o/n): " "Do you want to restart WSL now? (y/n): ")")"
            read -r response
            case $response in
                [OoYy]*)
                    info "$(get_message "Redémarrage de WSL..." "Restarting WSL...")"
                    powershell.exe -c "wsl --shutdown" >/dev/null 2>&1
                    error "$(get_message "Veuillez relancer le script" "Please restart the script")"
                    exit 0
                    ;;
                *)
                    warning "$(get_message "Le redémarrage de WSL sera nécessaire plus tard" "WSL restart will be needed later")"
                    ;;
            esac
        else
            error "$(get_message "La conversion automatique a échoué" "Automatic conversion failed")"
            warning "$(get_message "Vérifiez que la virtualisation est activée dans le BIOS" "Check if virtualization is enabled in BIOS")"
            warning "$(get_message "Et que la 'Plateforme de machine virtuelle Windows' est activée" "And that 'Windows Virtual Machine Platform' is enabled")"
            
            echo -n "$(print_styled "PRIMARY" "$(get_message "Voulez-vous continuer avec WSL1 ? (o/n): " "Do you want to continue with WSL1? (y/n): ")")"
            read -r response
            case $response in
                [OoYy]*)
                    warning "$(get_message "Continuation avec WSL1..." "Continuing with WSL1...")"
                    ;;
                *)
                    info "$(get_message "Script arrêté" "Script stopped")"
                    exit 0
                    ;;
            esac
        fi
    else
        success "$(get_message "WSL2 est détecté" "WSL2 detected")"
    fi    

    # Activation de systemd
    info "$(get_message "Activation de systemd..." "Enabling systemd...")"
    if [ ! -f /etc/wsl.conf ]; then
        sudo tee /etc/wsl.conf > /dev/null << 'EOL'
[boot]
systemd=true
EOL
        success "$(get_message "Configuration de systemd ajoutée" "Systemd configuration added")"
        warning "$(get_message "Redémarrage de WSL requis" "WSL restart required")"
        warning "$(get_message "Utilisez 'wsl --shutdown' dans PowerShell après l'installation" "Use 'wsl --shutdown' in PowerShell after installation")"
    else
        if ! grep -q "systemd=true" /etc/wsl.conf; then
            sudo sed -i '/\[boot\]/a systemd=true' /etc/wsl.conf || \
            echo -e "[boot]\nsystemd=true" | sudo tee -a /etc/wsl.conf > /dev/null
            success "$(get_message "Configuration de systemd ajoutée" "Systemd configuration added")"
            warning "$(get_message "Redémarrage de WSL requis" "WSL restart required")"
            warning "$(get_message "Utilisez 'wsl --shutdown' dans PowerShell après l'installation" "Use 'wsl --shutdown' in PowerShell after installation")"
        else
            info "$(get_message "systemd est déjà activé" "systemd is already enabled")"
        fi
    fi
    
    # Mise à jour initiale du système
    info "$(get_message "Mise à jour initiale du système..." "Initial system update...")"
    sudo apt update && sudo apt upgrade -y

    # Outils système essentiels
    info "$(get_message "Installation des outils système essentiels..." "Installing essential system tools...")"
    sudo apt install -y \
        build-essential \
        software-properties-common \
        apt-transport-https \
        ca-certificates \
        curl \
        wget \
        git \
        gnupg \
        lsb-release

    # Outils de compression
    info "$(get_message "Installation des outils de compression..." "Installing compression tools...")"
    sudo apt install -y \
        bzip2 \
        libbz2-dev \
        zip \
        unzip \
        tar \
        gzip

    # Outils réseau
    info "$(get_message "Installation des outils réseau..." "Installing network tools...")"
    sudo apt install -y \
        net-tools \
        openssh-server \
        ufw \
        fail2ban \
        nmap \
        tcpdump \
        htop \
        iftop \
        iotop

# Configuration du hostname
sudo hostnamectl set-hostname easynode
HOSTNAME="easynode"
echo "127.0.0.1 $HOSTNAME" | sudo tee -a /etc/hosts
echo "127.0.0.1 localhost" | sudo tee -a /etc/hosts
echo "$HOSTNAME" | sudo tee /etc/hostname

    # Activation et démarrage du service SSH       
info "$(get_message "Configuration de SSH..." "Configuring SSH...")"
sudo systemctl stop ssh.socket
sudo systemctl disable ssh.socket
sudo systemctl stop ssh
sudo systemctl disable ssh
sudo systemctl enable ssh
sudo systemctl start ssh

# Configuration de sshd_config
info "$(get_message "Configuration du fichier SSH..." "Configuring SSH file...")"
####A enlever si ne fonctioone pas###

# Installation de SSH si non présent
if ! command -v ssh &> /dev/null; then
    info "$(get_message "Installation de SSH..." "Installing SSH...")"
    sudo apt install -y openssh-server openssh-client
fi

# Configuration de sshd_config
info "$(get_message "Configuration du fichier SSH..." "Configuring SSH file...")"
echo "Port 22" | sudo tee /etc/ssh/sshd_config
echo "ListenAddress 0.0.0.0" | sudo tee -a /etc/ssh/sshd_config
echo "PasswordAuthentication yes" | sudo tee -a /etc/ssh/sshd_config

##############
# Désinstaller complètement ssh
#sudo apt remove --purge openssh-server openssh-client -y
#sudo apt autoremove -y

# Nettoyer les restes de configuration
#sudo rm -rf /etc/ssh

# Réinstaller
#sudo apt install openssh-server openssh-client -y

# Configurer le fichier sshd_config
#echo "Port 22" | sudo tee /etc/ssh/sshd_config
#echo "ListenAddress 0.0.0.0" | sudo tee -a /etc/ssh/sshd_config
#echo "PasswordAuthentication yes" | sudo tee -a /etc/ssh/sshd_config
##############
# Configuration du hostname et hosts
info "$(get_message "Configuration du hostname et hosts..." "Configuring hostname and hosts...")"

# Modifier le fichier wsl.conf en préservant la configuration existante
if [ ! -f /etc/wsl.conf ]; then
    echo "[boot]" | sudo tee /etc/wsl.conf > /dev/null
    echo "systemd=true" | sudo tee -a /etc/wsl.conf > /dev/null
    echo "[network]" | sudo tee -a /etc/wsl.conf > /dev/null
    echo "generateHosts = false" | sudo tee -a /etc/wsl.conf > /dev/null
else
    if ! grep -q "\[network\]" /etc/wsl.conf; then
        echo "[network]" | sudo tee -a /etc/wsl.conf > /dev/null
        echo "generateHosts = false" | sudo tee -a /etc/wsl.conf > /dev/null
    fi
fi

# Créer un nouveau fichier hosts propre
cat << EOF | sudo tee /etc/hosts > /dev/null
127.0.0.1       localhost
127.0.1.1       fire    fire
127.0.0.1       easynode
$(hostname -I | cut -d' ' -f1) easynode

# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
EOF

# Mettre à jour /etc/hostname
echo "$HOSTNAME" | sudo tee /etc/hostname > /dev/null

# S'assurer des bonnes permissions
sudo chmod 644 /etc/hosts
sudo chmod 644 /etc/hostname
#######################

sudo systemctl enable ssh
sudo systemctl restart ssh



# Dans la fonction update_system(), après la configuration SSH actuelle, ajoutez :

# Configuration du message d'accueil SSH
info "$(get_message "Configuration du message d'accueil SSH..." "Configuring SSH welcome message...")"
####################

####################
# Créer le contenu du motd de manière dynamique
HOSTNAME=$(hostname)
IP_ADDRESS=$(hostname -I | cut -d' ' -f1)
SYSTEM_INFO=$(uname -s)" "$(uname -r)

# Utiliser echo -e pour interpréter les codes de couleur
echo -e "\e[0;33;38;5;208m  *     *   ***   *   * ***** ****   ***   
  **   **  *   *  **  * *     *   * *   *  
  * * * * *     * * * * ****  ****  *   *  
  *  *  * *     * *  ** *     * *   *   *  
  *     *  *   *  *   * *     *  *  *   *  
  *     *   ***   *   * ***** *   *  ***   
  ═════════════ ▌EASYNODE▐ ══════════Wsl2\e[0m

\e[0;33;38;5;208m    ▐ EASYNODE               EASYNODE▐ \e[0m

\e[1;34mNode Status:\e[0m
- Hostname: $HOSTNAME
- IP Address: $IP_ADDRESS
- Monero Version: $MONERO_VERSION
- System: $SYSTEM_INFO

\e[1;33mUseful Commands:\e[0m
- monerod --help : Show Monero daemon help
- monero-wallet-cli --help : Show wallet CLI help

\e[1;31mImportant:\e[0m
- Start monero: monerod
- Stop  monero: CTRL+C
- Check status: monerod status" | sudo tee /etc/motd > /dev/null
####################
# Vérification de l'état SSH
if ! systemctl is-active ssh >/dev/null 2>&1; then
    error "$(get_message "Échec du démarrage SSH" "SSH startup failed")"
    journalctl -u ssh --no-pager -n 50
fi

    # Outils de développement Python (utile pour scripts)
    info "$(get_message "Installation des outils Python..." "Installing Python tools...")"
    sudo apt install -y \
        python3 \
        python3-pip \
        python3-dev

    # Éditeurs de texte
    info "$(get_message "Installation des éditeurs..." "Installing text editors...")"
    sudo apt install -y \
        vim \
        nano

    # Configuration du pare-feu UFW
    info "$(get_message "Configuration du pare-feu..." "Configuring firewall...")"
    sudo ufw --force reset
    sudo ufw disable
    sudo ufw allow 22 #SSH
    sudo ufw allow 80 #HTTP 
    sudo ufw allow 443 #HTTPS
    sudo ufw allow 9050
    sudo ufw allow 18080:18090/tcp #MONERO PORT
    sudo ufw allow 18080:18090/udp #MONERO PORT
    sudo ufw allow 4200 #SHELL IN BOX
    sudo ufw allow 4444 # i2p http
    sudo ufw allow 4447 # i2p socks
    sudo ufw allow 53317/tcp #localsend
    sudo ufw allow 53317/udp #localsend  
    sudo ufw --force enable
    #détail des ports
    #zmq_pub 18083
    #tor_port 18084
    #i2p_port 18085
    #lws_port 18086
    #monero_port 18080
    #monero_public_port 18081
    #monero_rpc_port 18089
    #info "$(get_message "Configuration du pare-feu..." "Configuring firewall...")"
    #sudo ufw default deny incoming
    #sudo ufw default allow outgoing
    #sudo ufw allow ssh
    #sudo ufw allow 18080/tcp  # Port Monero P2P
    #sudo ufw allow 18089/tcp  # Port Monero RPC
    #sudo ufw --force enable

    # Configuration de fail2ban
    info "$(get_message "Configuration de fail2ban..." "Configuring fail2ban...")"
    sudo systemctl enable fail2ban
    sudo systemctl start fail2ban

    # Nettoyage final
    info "$(get_message "Nettoyage du système..." "System cleanup...")"
    sudo apt autoremove -y
    sudo apt clean

    success "$(get_message "Mise à jour terminée" "Update completed")"
    read -p "$(print_styled "PRIMARY" "$(get_message "Appuyez sur Entrée pour continuer..." "Press Enter to continue...")")"
}

# Sélection du type de blockchain

select_blockchain_type() {
    print_header "$(get_message "TYPE DE BLOCKCHAIN" "BLOCKCHAIN TYPE")"
    
    print_styled "PRIMARY" "$(get_message "1) Complète 200 Go" "1) Complete")"
    print_styled "PRIMARY" "$(get_message "2) Élaguée (prune) 90 Go" "2) Pruned")"
    echo -n "$(print_styled "INFO" "$(get_message "Choix (1-2): " "Choice (1-2): ")")"
    read -r choice
    
    case $choice in
        1) 
            BLOCKCHAIN_TYPE="complete"
            return 0 
            ;;
        2) 
            BLOCKCHAIN_TYPE="pruned"
            return 0 
            ;;
        *) 
            error "$(get_message "Choix invalide" "Invalid choice")"
            return 1 
            ;;
    esac
}

# Demande du nom d'utilisateur
ask_username() {
    print_header "$(get_message "CONFIGURATION UTILISATEUR" "USER CONFIGURATION")"
    
    # Récupération automatique du nom d'utilisateur actuel
    local current_user=""
    if [ -n "$SUDO_USER" ]; then
        current_user="$SUDO_USER"
    elif [ -n "$USER" ]; then
        current_user="$USER"
    else
        current_user=$(whoami)
    fi
    
    # Afficher l'utilisateur détecté avec le nom en vert
    echo -e "$(get_message "Utilisateur détecté: " "Detected user: ")${COLORS[SUCCESS]}${current_user}${COLORS[RESET]}"
    echo
    
    print_styled "INFO" "$(get_message "Appuyez sur Entrée pour confirmer ou tapez un autre nom d'utilisateur: " "Press Enter to confirm or type another username: ")"
    read -r input_username
    
    # Si l'utilisateur appuie juste sur Entrée, utiliser l'utilisateur actuel
    if [ -z "$input_username" ]; then
        input_username="$current_user"
        echo -e "$(get_message "Utilisation de l'utilisateur: " "Using user: ")${COLORS[SUCCESS]}${input_username}${COLORS[RESET]}"
        USERNAME="$input_username"
        return 0  # Success - user confirmed
    fi
    
    # Si l'utilisateur entre un nom différent, vérifier s'il existe
    if ! id "$input_username" &>/dev/null; then
        error "$(get_message "L'utilisateur n'existe pas" "User does not exist")"
        return 1  # Error - invalid user
    fi
    
    USERNAME="$input_username"
    echo -e "$(get_message "Utilisateur validé: " "Validated user: ")${COLORS[SUCCESS]}${USERNAME}${COLORS[RESET]}"
    return 0  # Success - new user validated
}

# Installation de Monero CLI
install_monero_cli() {
    if [ -z "$USERNAME" ]; then
        error "$(get_message "Nom d'utilisateur non défini" "Username not defined")"
        return 1
    fi

    print_header "$(get_message "INSTALLATION DE MONERO" "MONERO INSTALLATION")"
    
    # Installation de curl si nécessaire
    if ! command -v curl &> /dev/null; then
        info "$(get_message "Installation de curl..." "Installing curl...")"
        sudo apt-get update && sudo apt-get install -y curl
    fi
    
    # Test de la connectivité
    info "$(get_message "Test de la connectivité..." "Testing connectivity...")"
    if ! ping -c 1 8.8.8.8 &> /dev/null; then
        error "$(get_message "Pas de connexion Internet" "No Internet connection")"
        return 1
    fi
    
    # Configuration des serveurs DNS de secours
    echo "nameserver 9.9.9.9
nameserver 149.112.112.112
nameserver 91.239.100.100
nameserver 89.233.43.71" | sudo tee /etc/resolv.conf > /dev/null


    mkdir -p ~/monero_install
    cd ~/monero_install || exit

    info "$(get_message "Téléchargement de Monero..." "Downloading Monero...")"
    
    local download_urls=(
        "https://downloads.getmonero.org/cli/monero-linux-x64-v${MONERO_VERSION}.tar.bz2"
        "https://dlsrc.getmonero.org/cli/monero-linux-x64-v${MONERO_VERSION}.tar.bz2"
    )

    local download_success=false
    for url in "${download_urls[@]}"; do
        info "$(get_message "Essai de téléchargement depuis" "Trying to download from") $url"
        if curl --max-time 60 --retry 3 --retry-delay 5 -L -o "monero-linux-x64-v${MONERO_VERSION}.tar.bz2" "$url"; then
            download_success=true
            break
        fi
        warning "$(get_message "Échec, essai de la source suivante..." "Failed, trying next source...")"
    done

    if [ "$download_success" = false ]; then
        error "$(get_message "Tous les téléchargements ont échoué" "All downloads failed")"
        return 1
    fi

    success "$(get_message "Téléchargement terminé" "Download completed")"
    
     # Ajouter la vérification du hash ici :
    info "$(get_message "Vérification de l'intégrité du fichier..." "Verifying file integrity...")"
    
    # Téléchargement du fichier de hash
    local hash_url="https://www.getmonero.org/downloads/hashes.txt"
    if ! curl -L -o "hashes.txt" "$hash_url"; then
        error "$(get_message "Impossible de télécharger le fichier de hash" "Unable to download hash file")"
        return 1
    fi

    # Vérification que le fichier de hash contient bien notre version
    if ! grep -q "monero-linux-x64-v${MONERO_VERSION}.tar.bz2" hashes.txt; then
        error "$(get_message "Hash non trouvé pour cette version" "Hash not found for this version")"
        return 1
    fi

    # Extraction du hash attendu
    expected_hash=$(grep "monero-linux-x64-v${MONERO_VERSION}.tar.bz2" hashes.txt | cut -d' ' -f1)
    
    # Calcul du hash du fichier téléchargé
    actual_hash=$(sha256sum "monero-linux-x64-v${MONERO_VERSION}.tar.bz2" | cut -d' ' -f1)

    # Comparaison des hash
    if [ "$expected_hash" != "$actual_hash" ]; then
        error "$(get_message "Vérification du hash échouée" "Hash verification failed")"
        error "$(get_message "Hash attendu:" "Expected hash:") $expected_hash"
        error "$(get_message "Hash obtenu:" "Obtained hash:") $actual_hash"
        return 1
    fi
    
    success "$(get_message "Vérification du hash réussie" "Hash verification successful")"

    info "$(get_message "Extraction des fichiers..." "Extracting files...")"
    if tar xvf "monero-linux-x64-v${MONERO_VERSION}.tar.bz2"; then
        success "$(get_message "Extraction terminée" "Extraction completed")"
    else
        error "$(get_message "Échec de l'extraction" "Extraction failed")"
        return 1
    fi

    sudo mkdir -p "/home/$USERNAME/monero"
    sudo cp -r "monero-x86_64-linux-gnu-v${MONERO_VERSION}"/* "/home/$USERNAME/monero/"
    echo "export PATH=\$PATH:/home/$USERNAME/monero" | sudo tee -a "/home/$USERNAME/.bashrc"

    sudo chown -R "$USERNAME:$USERNAME" "/home/$USERNAME/monero"
    sudo chmod -R 755 "/home/$USERNAME/monero"

    sudo mkdir -p "/home/$USERNAME/.bitmonero"
    sudo chown -R "$USERNAME:$USERNAME" "/home/$USERNAME/.bitmonero"
    sudo chmod -R 755 "/home/$USERNAME/.bitmonero"

    cd ~ || exit
    rm -rf ~/monero_install

    success "$(get_message "Installation terminée dans" "Installation completed in") /home/$USERNAME/monero"
    read -p "$(print_styled "PRIMARY" "$(get_message "Appuyez sur Entrée pour continuer..." "Press Enter to continue...")")"
}

# Installation de Tor
install_tor() {
    print_header "$(get_message "INSTALLATION DE TOR" "TOR INSTALLATION")"
    
    info "$(get_message "Installation de Tor..." "Installing Tor...")"
    if sudo apt update && sudo apt install -y tor; then
        success "$(get_message "Installation de Tor terminée" "Tor installation completed")"
    else
        error "$(get_message "Échec de l'installation de Tor" "Tor installation failed")"
        return 1
    fi

    sudo cp /etc/tor/torrc /etc/tor/torrc.backup

    # Supprimer le fichier torrc existant et le recréer vide
    info "$(get_message "Réinitialisation du fichier de configuration..." "Resetting configuration file...")"
    sudo rm -f /etc/tor/torrc
    sudo touch /etc/tor/torrc
    #ecriture de la nouvelle configuration
    {
        echo "SOCKSPort 9050"
        echo "ControlPort 9051"
        echo "HiddenServiceDir /var/lib/tor/ssh/"
        echo "HiddenServicePort 22 127.0.0.1:22"
        echo "HiddenServiceDir /var/lib/tor/monero-service/"
        echo "HiddenServicePort 18089 127.0.0.1:18089"
    } | sudo tee -a /etc/tor/torrc

    sudo mkdir -p /var/lib/tor/monero-service/
    sudo chown -R debian-tor:debian-tor /var/lib/tor/monero-service/
    sudo chmod 700 /var/lib/tor/monero-service/

    info "$(get_message "Redémarrage de Tor..." "Restarting Tor...")"
    sudo systemctl restart tor

    info "$(get_message "Génération de l'adresse onion..." "Generating onion address...")"
    sleep 10

    if [ -f /var/lib/tor/monero-service/hostname ]; then
        ONION_ADDRESS=$(sudo cat /var/lib/tor/monero-service/hostname)
        success "$(get_message "Adresse onion: " "Onion address: ")$ONION_ADDRESS"
        echo "Monero Onion Address ($(date)): $ONION_ADDRESS" | sudo tee -a "/home/$USERNAME/monero_onion_address.txt"
        sudo chown "$USERNAME:$USERNAME" "/home/$USERNAME/monero_onion_address.txt"
        echo "-------------------->$(get_message "L'adresse est sauvegardée dans le Dossier /home" "The address is saved in the folder /home")"
    else
        error "$(get_message "Échec de la génération de l'adresse onion" "Failed to generate onion address")"
    fi
# Gestion de l'adresse SSH
    if [ -f /var/lib/tor/ssh/hostname ]; then
        SSH_ONION_ADDRESS=$(sudo cat /var/lib/tor/ssh/hostname)
        success "$(get_message "Adresse onion SSH: " "SSH onion address: ")$SSH_ONION_ADDRESS"
        echo "SSH Onion Address ($(date)): $SSH_ONION_ADDRESS" | sudo tee -a "/home/$USERNAME/ssh_onion_address.txt"
        sudo chown "$USERNAME:$USERNAME" "/home/$USERNAME/ssh_onion_address.txt"
        echo "-------------------->$(get_message "L'adresse SSH est sauvegardée dans le dossier /home" "The SSH address is saved in the folder /home")"
        
    else
        error "$(get_message "Échec de la génération de l'adresse onion SSH" "Failed to generate SSH onion address")"
    fi
    read -p "$(print_styled "PRIMARY" "$(get_message "Appuyez sur Entrée pour continuer..." "Press Enter to continue...")")"
}


# Configuration de Monero
configure_monero() {
    if [ -z "$USERNAME" ]; then
        error "$(get_message "Nom d'utilisateur non défini" "Username not defined")"
        return 1
    fi

    print_header "$(get_message "CONFIGURATION DE MONERO" "MONERO CONFIGURATION")"
    
    local config_file="/home/$USERNAME/.bitmonero/bitmonero.conf"
    mkdir -p "/home/$USERNAME/.bitmonero"

    # Configuration de base
    cat > "$config_file" << EOL
# Configuration Monero
no-igd=1
no-zmq=1
rpc-bind-ip=0.0.0.0
rpc-bind-port=18089
p2p-bind-port=18080
in-peers=64
out-peers=32
limit-rate-up=1048576
limit-rate-down=8388608
disable-dns-checkpoints=1
confirm-external-bind=1
data-dir=/home/$USERNAME/.bitmonero
EOL

    if [ "$BLOCKCHAIN_TYPE" = "pruned" ]; then
        echo "prune-blockchain=1" >> "$config_file"
    fi

    sudo chown "$USERNAME:$USERNAME" "$config_file"
    sudo chmod 644 "$config_file"

    success "$(get_message "Configuration créée dans" "Configuration created in") $config_file"
    read -p "$(print_styled "PRIMARY" "$(get_message "Appuyez sur Entrée pour continuer..." "Press Enter to continue...")")"
}

# Configuration des DNS
configure_dns() {
    print_header "$(get_message "CONFIGURATION DNS" "DNS CONFIGURATION")"
    
    info "$(get_message "Configuration des serveurs DNS..." "Configuring DNS servers...")"

    # Sauvegarder la configuration actuelle
    if [ -f /etc/resolv.conf ]; then
        sudo cp /etc/resolv.conf /etc/resolv.conf.backup
    fi

    # Désactiver DNSSec
    info "$(get_message "Désactivation de DNSSec..." "Disabling DNSSec...")"
    sudo mkdir -p /etc/systemd/resolved.conf.d/
    cat << EOF | sudo tee /etc/systemd/resolved.conf.d/dnssec.conf > /dev/null
[Resolve]
DNSSEC=no
EOF

    # Arrêter et désactiver systemd-resolved
    if systemctl is-active --quiet systemd-resolved; then
        sudo systemctl stop systemd-resolved
        sudo systemctl disable systemd-resolved
    fi

    # Supprimer le lien symbolique s'il existe
    if [ -L /etc/resolv.conf ]; then
        sudo rm -f /etc/resolv.conf
    fi

    # Créer le nouveau fichier resolv.conf
    info "$(get_message "Configuration des serveurs DNS..." "Configuring DNS servers...")"
    cat << EOL | sudo tee /etc/resolv.conf > /dev/null
   #Serveurs DNS pour Monero
nameserver 9.9.9.9
nameserver 149.112.112.112
nameserver 91.239.100.100
nameserver 89.233.43.71
EOL

    # Définir les permissions appropriées
    sudo chmod 644 /etc/resolv.conf

    success "$(get_message "Configuration DNS terminée" "DNS configuration completed")"
    info "$(get_message "Backup créé: /etc/resolv.conf.backup" "Backup created: /etc/resolv.conf.backup")"
    
    read -p "$(print_styled "PRIMARY" "$(get_message "Appuyez sur Entrée pour continuer..." "Press Enter to continue...")")"
}


manage_blockchain() {
    print_header "$(get_message "GESTION DE LA BLOCKCHAIN" "BLOCKCHAIN MANAGEMENT")"
    
    if [ -z "$USERNAME" ]; then
        error "$(get_message "Nom d'utilisateur non défini" "Username not defined")"
        return 1
    fi

    # Liste des disques disponibles avec leur espace
    info "$(get_message "Lecteurs Windows disponibles :" "Available Windows drives:")"
    echo "----------------------------------------"
    printf "%-8s %-15s %-15s %-15s\n" "$(get_message "Lettre" "Letter")" "$(get_message "Total" "Total")" "$(get_message "Utilisé" "Used")" "$(get_message "Disponible" "Available")"
    echo "----------------------------------------"
    
    # Tableau pour stocker les lettres de lecteur valides
    declare -a valid_drives=()
    
    for drive in /mnt/*; do
        if [ -d "$drive" ]; then
            letter=$(basename "$drive")
            if df -h "$drive" 2>/dev/null | grep -q "$drive"; then
                # Récupérer les informations d'espace disque
                total=$(df -h "$drive" | awk 'NR==2 {print $2}')
                used=$(df -h "$drive" | awk 'NR==2 {print $3}')
                avail=$(df -h "$drive" | awk 'NR==2 {print $4}')
                
                # Ajouter la lettre au tableau des lecteurs valides
                valid_drives+=("$letter")
                
                # Afficher les informations formatées
                printf "%-8s %-15s %-15s %-15s\n" "${letter^^}:" "$total" "$used" "$avail"
            fi
        fi
    done
    echo "----------------------------------------"

    # Demander à l'utilisateur de choisir un lecteur
    while true; do
        echo -n "$(print_styled "INFO" "$(get_message "Entrez la lettre du Disque Externe (ex: d pour D:) ou 'q' pour quitter : " "Enter External drive letter (e.g., d for D:) or 'q' to quit: ")")"
        read -r windows_drive_letter
        
        # Permettre à l'utilisateur de quitter
        if [ "$windows_drive_letter" = "q" ]; then
            return 1
        fi
        
        # Convertir en minuscule pour la comparaison
        windows_drive_letter=$(echo "$windows_drive_letter" | tr '[:upper:]' '[:lower:]')
        
        # Vérifier si le lecteur est valide
        if [[ " ${valid_drives[@]} " =~ " ${windows_drive_letter} " ]]; then
            break
        else
            error "$(get_message "Lecteur invalide. Veuillez choisir parmi les lecteurs affichés." "Invalid drive. Please choose from the displayed drives.")"
        fi
    done

    if [ -z "$windows_drive_letter" ]; then
        error "$(get_message "Aucun lecteur sélectionné" "No drive selected")"
        return 1
    fi
    
    local mount_point="/mnt/$windows_drive_letter"
    
    # Vérification et montage du disque
    if [ ! -d "$mount_point" ]; then
        info "$(get_message "Création du point de montage" "Creating mount point") $mount_point..."
        sudo mkdir -p "$mount_point"
    fi

    # Démonter d'abord si déjà monté
    if mountpoint -q "$mount_point"; then
        warning "$(get_message "Le lecteur est déjà monté. Démontage en cours..." "Drive is already mounted. Unmounting...")"
        sudo umount "$mount_point"
    fi

    info "$(get_message "Montage du lecteur" "Mounting drive") ${windows_drive_letter}: sur $mount_point..."
    if ! sudo mount -t drvfs "${windows_drive_letter}:" "$mount_point" -o metadata,uid=$(id -u),gid=$(id -g); then
        error "$(get_message "Erreur lors du montage" "Mount failed")"
        return 1
    fi

    # Mise à jour de la variable globale du point de montage
    CURRENT_MOUNT_POINT="$mount_point"

    # Configuration du dossier blockchain
    local blockchain_path="$mount_point/MoneroBlockchain"
    mkdir -p "$blockchain_path"
    
    # Mise à jour de la configuration Monero
    local config_file="/home/$USERNAME/.bitmonero/bitmonero.conf"
    
    # Vérifier si le fichier de configuration existe, sinon le créer
    if [ ! -f "$config_file" ]; then
        mkdir -p "$(dirname "$config_file")"
        touch "$config_file"
    fi
    
    # Mettre à jour ou ajouter la ligne data-dir
    if grep -q "^data-dir=" "$config_file"; then
        sed -i "s|^data-dir=.*|data-dir=$blockchain_path|" "$config_file"
    else
        echo "data-dir=$blockchain_path" >> "$config_file"
    fi

    # S'assurer des bonnes permissions
    sudo chown "$USERNAME:$USERNAME" "$config_file"
    sudo chmod 644 "$config_file"

    # Configurer les permissions du dossier blockchain
    sudo chown -R "$USERNAME:$USERNAME" "$blockchain_path"
    sudo chmod -R 755 "$blockchain_path"

    success "$(get_message "Configuration mise à jour avec le nouveau chemin" "Configuration updated with new path")"
    info "$(get_message "Disque monté sur" "Disk mounted on") $mount_point"
    info "$(get_message "Blockchain configurée dans" "Blockchain configured in") $blockchain_path"
    
    # Ajout au fstab pour le montage automatique
    local device_uuid=$(sudo blkid -s UUID -o value "/dev/sd${windows_drive_letter}")
    if [ -n "$device_uuid" ]; then
        if ! grep -q "$mount_point" /etc/fstab; then
            echo "UUID=$device_uuid $mount_point drvfs defaults,metadata 0 0" | sudo tee -a /etc/fstab > /dev/null
            success "$(get_message "Configuration du montage automatique ajoutée" "Automatic mount configuration added")"
        fi
    fi

    read -p "$(print_styled "PRIMARY" "$(get_message "Appuyez sur Entrée pour continuer..." "Press Enter to continue...")")"
}

# Démarrage de la blockchain
start_blockchain() {
    if [ -z "$USERNAME" ]; then
        error "$(get_message "Nom d'utilisateur non défini" "Username not defined")"
        return 1
    fi

    print_header "$(get_message "DÉMARRAGE DE LA BLOCKCHAIN" "STARTING BLOCKCHAIN")"
    
    CONFIG_FILE="/home/$USERNAME/.bitmonero/bitmonero.conf"
    DEFAULT_DATA_DIR="/home/$USERNAME/.bitmonero"
    
    # On vérifie d'abord le fichier de configuration
    if [ -f "$CONFIG_FILE" ]; then
        BLOCKCHAIN_LOCATION=$(grep "^data-dir=" "$CONFIG_FILE" 2>/dev/null | cut -d'=' -f2)
    fi

    # Si aucun emplacement n'est trouvé dans le fichier de config, on utilise l'emplacement par défaut
    if [ -z "$BLOCKCHAIN_LOCATION" ]; then
        BLOCKCHAIN_LOCATION="$DEFAULT_DATA_DIR"
    fi

    info "$(get_message "Emplacement de la blockchain: $BLOCKCHAIN_LOCATION" "Blockchain location: $BLOCKCHAIN_LOCATION")"
    
    # Vérification du montage du disque externe si nécessaire
    if [ -n "$BLOCKCHAIN_LOCATION" ] && [[ "$BLOCKCHAIN_LOCATION" == "/media/monero_external"* ]]; then
        DEVICE=$(mount | grep "/media/monero_external" | awk '{print $1}')
        if [ -z "$DEVICE" ]; then
            error "$(get_message "Le disque externe n'est pas monté" "External disk is not mounted")"
            return 1
        fi
        info "$(get_message "Disque externe monté: $DEVICE" "External disk mounted: $DEVICE")"
    fi
    
    echo -n "$(print_styled "PRIMARY" "$(get_message "Démarrer la blockchain MONERO? (o/n): " "Start blockchain MONERO? (y/n): ")")"
    read -r START_CHOICE

    # Vérification des permissions avant le démarrage
    if [ -n "$BLOCKCHAIN_LOCATION" ] && [ ! -w "$BLOCKCHAIN_LOCATION" ]; then
        error "$(get_message "Permissions insuffisantes sur $BLOCKCHAIN_LOCATION" "Insufficient permissions on $BLOCKCHAIN_LOCATION")"
        return 1
    fi

    MONEROD_PATH="/home/$USERNAME/monero/monerod"
    if [ ! -x "$MONEROD_PATH" ]; then
        error "$(get_message "monerod n'est pas trouvé ou n'est pas exécutable" "monerod not found or not executable")"
        return 1
    fi

    # Fonction de nettoyage
    cleanup_ban_script() {
        if [ -n "$BAN_SCRIPT_PID" ]; then
            kill $BAN_SCRIPT_PID 2>/dev/null
            sleep 4
        fi
        rm -f "$BAN_SCRIPT"
        trap - SIGINT
        echo
        return 0
    }

    case $START_CHOICE in
        [OoYy]*)
            # Créer script temporaire pour les bans
            BAN_SCRIPT=$(mktemp)
            chmod +x "$BAN_SCRIPT"

            # Écrire le script de ban
            cat > "$BAN_SCRIPT" << 'EOF'
#!/bin/bash
MONEROD_PATH="$1"

# Attendre que le service RPC soit disponible
for i in {1..30}; do
    if nc -z localhost 18089; then
        echo "Service RPC disponible, application des bans..."
        break
    fi
    echo "Attente du service RPC... ($i/30)"
    sleep 2
done

# Appliquer les bans
          
"$MONEROD_PATH" ban 91.198.115.0/24 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 100.42.27.0/24 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 162.218.65.0/24 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 193.142.4.0/24 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 199.116.84.0/24 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 209.222.252.0/24 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 5.75.129.208 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 5.75.135.144 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 5.75.140.246 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 5.75.154.135 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 5.75.166.225 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 5.75.173.84 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 5.75.181.138 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 5.75.183.84 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 5.75.241.110 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 5.75.242.41 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 5.78.97.160 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 5.78.113.251 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 5.78.124.88 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 5.78.124.89 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 5.78.124.95 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 5.78.124.96 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 5.78.124.106 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 5.78.124.111 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 5.78.124.113 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 5.78.124.115 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 5.78.124.118 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 5.78.124.119 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 5.78.124.123 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 5.78.124.124 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.88.39.174 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.88.42.79 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.88.124.70 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.88.127.26 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.2 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.3 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.4 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.6 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.7 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.8 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.9 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.10 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.11 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.12 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.13 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.14 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.15 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.16 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.17 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.18 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.19 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.20 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.21 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.22 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.23 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.24 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.25 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.26 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.27 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.28 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.29 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.30 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.31 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.32 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.33 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.34 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.35 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.36 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.37 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.38 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.39 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.40 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.41 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.42 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.43 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.44 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.45 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.46 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.47 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.48 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.49 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.50 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.51 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.52 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.53 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.54 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.55 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.56 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.57 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.58 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.59 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.60 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.61 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 23.92.36.62 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 37.27.9.156 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 37.27.9.176 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 37.27.12.24 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 37.27.12.114 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 37.27.18.63 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 37.27.23.39 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 37.27.30.128 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 37.27.43.145 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 37.27.86.92 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 37.27.89.118 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 37.27.89.229 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 37.27.91.48 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 37.27.91.89 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 37.27.91.229 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 37.27.92.147 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 37.27.94.36 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 37.27.95.115 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 37.27.179.123 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 37.27.179.234 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 37.27.179.235 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 45.55.74.44 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 45.55.133.250 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 45.55.201.250 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 49.12.74.216 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 49.12.106.86 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 49.13.49.199 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 49.13.52.47 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 49.13.57.134 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 49.13.78.19 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 49.13.86.148 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 49.13.115.32 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 49.13.115.123 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 49.13.127.117 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 49.13.139.15 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 49.13.152.188 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 49.13.156.57 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 49.13.158.166 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 49.13.159.91 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 49.13.169.113 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 49.13.173.101 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 49.13.201.131 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 49.13.208.17 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 49.13.212.212 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 49.13.214.121 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 49.13.217.129 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 49.13.219.34 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 49.13.226.74 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 49.13.232.107 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 49.13.239.236 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 64.225.29.96 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 64.225.59.68 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 64.225.59.199 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 64.225.69.16 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 64.225.74.135 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 64.227.32.84 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 64.227.161.55 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 64.227.181.143 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 65.21.6.209 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 65.21.52.50 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 65.21.56.139 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 65.21.56.200 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 65.21.63.66 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 65.21.145.141 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 65.21.147.241 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 65.21.157.23 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 65.21.178.72 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 65.21.181.13 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 65.21.241.126 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 65.21.241.224 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 65.21.245.133 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 65.21.253.115 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 65.108.80.132 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 65.108.90.40 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 65.108.93.212 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 65.108.145.157 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 65.108.150.128 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 65.108.209.79 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 65.108.212.232 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 65.108.213.63 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 65.108.240.2 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 65.109.12.65 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 65.109.168.69 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 65.109.174.20 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 65.109.235.207 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 65.109.236.9 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 68.183.38.171 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 68.183.190.108 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 78.47.14.189 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 78.47.80.201 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 78.47.82.76 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 78.47.92.219 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 88.99.80.10 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 88.99.227.244 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 91.107.224.99 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 91.107.231.93 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 94.130.107.145 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 94.130.150.121 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 94.130.169.110 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 94.130.185.207 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 95.216.150.29 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 95.216.150.102 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 95.216.170.126 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 95.216.192.178 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 95.216.193.143 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 95.216.200.166 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 95.216.214.133 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 95.217.1.90 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 95.217.5.143 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 95.217.7.137 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 95.217.7.248 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 95.217.132.209 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 95.217.159.229 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 95.217.178.183 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 95.217.213.229 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 95.217.214.103 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 95.217.234.3 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 103.253.145.110 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 104.131.2.165 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 104.131.75.4 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 104.236.69.16 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 104.236.74.196 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 104.236.198.104 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 116.203.45.151 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 116.203.56.205 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 116.203.72.253 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 116.203.100.92 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 116.203.128.49 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 116.203.154.174 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 116.203.189.48 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 116.203.195.31 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 116.203.254.206 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 128.140.0.62 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 128.140.48.217 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 128.140.61.144 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 128.140.74.60 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 128.140.85.154 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 128.140.90.102 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 128.140.91.160 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 128.140.94.96 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 128.140.120.209 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 128.199.25.219 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 128.199.28.133 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 128.199.217.194 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 128.199.218.182 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 134.122.3.184 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 134.122.51.152 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 134.122.55.173 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 134.122.102.253 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 134.122.108.176 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 134.209.43.125 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 134.209.145.121 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 134.209.169.106 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 135.181.27.88 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 135.181.32.89 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 135.181.39.124 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 135.181.47.102 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 135.181.87.223 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 135.181.94.62 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 135.181.95.54 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 135.181.153.146 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 135.181.192.47 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 135.181.196.185 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 135.181.249.92 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 138.68.138.2 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 138.197.38.115 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 138.197.46.235 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 138.197.95.57 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 138.197.113.109 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 138.197.114.182 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 139.59.7.102 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 139.59.27.56 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 139.59.61.137 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 139.59.76.91 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 139.59.86.82 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 139.59.89.227 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 139.59.93.75 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 139.59.115.56 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 139.59.177.185 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 142.93.44.96 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 142.93.71.86 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 142.93.128.65 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 142.93.132.1 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 142.93.231.48 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 142.132.168.80 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 142.132.184.119 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 142.132.185.251 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 142.132.225.75 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 143.198.95.193 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 143.198.203.49 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 143.198.207.91 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 144.126.233.7 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 146.190.93.37 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 146.190.98.172 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 146.190.229.52 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 152.42.137.12 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 152.42.164.168 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 152.42.176.57 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 152.42.234.2 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 152.42.238.126 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 152.42.242.48 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 152.42.252.27 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 157.90.30.197 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 157.90.156.155 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 157.90.166.187 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 157.90.226.104 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 157.245.5.43 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 157.245.38.164 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 157.245.108.248 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 157.245.116.159 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 157.245.118.156 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 157.245.213.224 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 157.245.223.125 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 159.65.21.166 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 159.65.48.50 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 159.65.89.114 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 159.65.159.205 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 159.65.168.201 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 159.65.169.67 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 159.65.170.33 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 159.65.187.74 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 159.65.195.116 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 159.65.197.116 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 159.69.43.127 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 159.69.88.107 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 159.69.203.235 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 159.69.214.249 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 159.69.215.100 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 159.89.38.217 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 159.89.163.38 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 159.89.163.55 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 159.89.163.68 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 159.89.173.136 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 159.203.84.7 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 159.203.92.111 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 159.203.167.3 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 159.223.39.35 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 159.223.237.96 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 161.35.33.150 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 161.35.93.237 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 161.35.145.80 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 161.35.158.99 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 162.55.34.195 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 162.55.48.235 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 162.55.51.42 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 162.55.169.58 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 165.22.105.164 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 165.227.69.220 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 165.227.72.42 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 165.227.213.94 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 165.232.108.85 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 165.232.177.43 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 167.71.2.86 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 167.71.6.186 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 167.71.161.206 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 167.71.174.206 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 167.71.193.163 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 167.71.197.173 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 167.71.255.162 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 167.71.255.186 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 167.99.37.161 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 167.99.50.191 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 167.99.56.83 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 167.99.57.58 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 167.99.57.78 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 167.99.71.164 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 167.99.94.162 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 167.99.201.188 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 167.99.217.155 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 167.172.34.234 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 167.172.36.214 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 167.172.90.67 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 167.172.239.75 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 167.172.239.179 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 167.235.70.103 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 167.235.72.103 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 167.235.74.95 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 167.235.78.12 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 167.235.145.20 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 167.235.231.155 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 167.235.251.83 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 167.235.252.193 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 168.119.107.214 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 168.119.156.17 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 174.138.23.108 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 174.138.62.153 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 174.138.68.39 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 178.128.45.22 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 178.128.103.174 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 178.128.111.15 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 178.128.160.225 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 178.128.246.209 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 188.166.12.16 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 188.166.12.183 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 188.166.14.6 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 188.166.14.205 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 188.166.17.201 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 188.166.76.68 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 188.245.34.63 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 188.245.35.36 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 188.245.35.65 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 188.245.43.15 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 188.245.43.136 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 188.245.47.3 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 188.245.47.63 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 188.245.48.51 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 188.245.50.241 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 188.245.52.192 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 188.245.56.14 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 188.245.56.69 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 188.245.56.125 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 195.201.112.241 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 195.201.114.108 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 195.201.118.2 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 195.201.119.80 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 195.201.122.209 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 195.201.125.129 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 195.201.220.208 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 206.189.1.196 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 206.189.2.124 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 206.189.36.70 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 206.189.131.31 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 206.189.144.80 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 209.38.44.153 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 209.38.167.250 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 209.97.149.119 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 209.97.154.206 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 209.97.163.171 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 209.97.171.207 86400000 --rpc-bind-port 18089
"$MONEROD_PATH" ban 209.97.189.94 86400000 --rpc-bind-port 18089 




# Vérifier les bans
sleep 2
echo -e "\033[38;5;71mVérification des bannissements...\033[0m"
BANS=$("$MONEROD_PATH" bans --rpc-bind-port 18089)
echo -e "\033[38;5;71m$BANS\033[0m"
EOF

            # Configuration du gestionnaire de signal pour CTRL+C
            trap 'cleanup_ban_script' SIGINT

            # Lancer le script de ban en arrière-plan
            "$BAN_SCRIPT" "$MONEROD_PATH" &
            BAN_SCRIPT_PID=$!

            # Démarrer monerod en avant-plan
            if [ -n "$BLOCKCHAIN_LOCATION" ]; then
                info "$(get_message "Démarrage de la blockchain avec le fichier de configuration" "Starting blockchain with config file")"
                "$MONEROD_PATH" --config-file="$CONFIG_FILE" --non-interactive
            else
                # Configuration par défaut si pas de fichier de configuration
                sudo mkdir -p "$DEFAULT_DATA_DIR"
                sudo chown -R "$USERNAME:$USERNAME" "$DEFAULT_DATA_DIR"
                sudo chmod -R 755 "$DEFAULT_DATA_DIR"
                info "$(get_message "Démarrage de la blockchain avec le dossier par défaut" "Starting blockchain with default folder")"
                "$MONEROD_PATH" --data-dir="$DEFAULT_DATA_DIR" --non-interactive
            fi

            # Nettoyage à la fin
            cleanup_ban_script
            ;;
        *)
            if [ -n "$BLOCKCHAIN_LOCATION" ]; then
                info "$(get_message "Commande de démarrage: $MONEROD_PATH --config-file=\"$CONFIG_FILE\" --non-interactive" \
                                  "Start command: $MONEROD_PATH --config-file=\"$CONFIG_FILE\" --non-interactive")"
            else
                DEFAULT_DATA_DIR="/home/$USERNAME/.bitmonero"
                info "$(get_message "Commande de démarrage: $MONEROD_PATH --data-dir=\"$DEFAULT_DATA_DIR\" --non-interactive" \
                                  "Start command: $MONEROD_PATH --data-dir=\"$DEFAULT_DATA_DIR\" --non-interactive")"
            fi
            ;;
    esac
}
unmount_external_disk() {
    print_header "$(get_message "DÉMONTAGE DU DISQUE" "DISK UNMOUNTING")"
    
    local mount_point="/mnt"
    
    # Liste des points de montage actifs
    info "$(get_message "Points de montage actifs:" "Active mount points:")"
    mount | grep "/mnt/"
    
    # D'abord demander le nom d'utilisateur
    ask_username
    
    if mount | grep -q "$mount_point"; then
        warning "$(get_message "Fermeture des processus en cours..." "Closing active processes...")"
        lsof "$mount_point" | awk 'NR!=1 {print $2}' | xargs -r sudo kill
        sleep 2

        for drive in $(mount | grep "^/mnt/" | cut -d' ' -f1); do
            if sudo umount -f "$drive" 2>/dev/null; then
                success "$(get_message "Disque démonté avec succès" "Disk unmounted successfully")"
            else
                error "$(get_message "Échec du démontage" "Unmounting failed")"
            fi
        done

        # Reset de la variable globale du point de montage
        CURRENT_MOUNT_POINT=""
    else
        warning "$(get_message "Aucun disque n'est monté dans" "No disk is mounted in") $mount_point"
    fi

    # Après le démontage, on supprime et recrée le fichier de configuration
    sudo rm -f "/home/$USERNAME/.bitmonero/bitmonero.conf"
    
    # Réécrire le fichier comme dans le menu 4
    local config_file="/home/$USERNAME/.bitmonero/bitmonero.conf"
    mkdir -p "/home/$USERNAME/.bitmonero"

    cat > "$config_file" << EOL
# Configuration Monero
no-igd=1
no-zmq=1
rpc-bind-ip=0.0.0.0
rpc-bind-port=18089
p2p-bind-port=18080
in-peers=64
out-peers=32
limit-rate-up=1048576
limit-rate-down=8388608
disable-dns-checkpoints=1
confirm-external-bind=1
data-dir=/home/$USERNAME/.bitmonero
EOL

    sudo chown "$USERNAME:$USERNAME" "$config_file"
    sudo chmod 644 "$config_file"
    
    success "$(get_message "Configuration mise à jour" "Configuration updated")"
    
    read -p "$(print_styled "PRIMARY" "$(get_message "Appuyez sur Entrée pour continuer..." "Press Enter to continue...")")"
}

# Affichage NOTICE MANUAL
show_scripts() {
       clear
       setup_terminal
       echo -e "\n\n\n\n"  # Espace pour la bannière
       print_header "$(get_message "INFOS" "FEATURES")"
  
  print_styled "TITLE" "1) $(get_message "Mise à jour système et installation des paquets" "System update and package installation")"
    print_styled "PRIMARY" "   $(get_message "- Configuration du firewall activé avec ouverture des ports :" "- Firewall configuration Actived with ports opening:")"
    echo -e "${COLORS[GRIS]}    $(get_message "-Ports system: 22(SSH), 80(HTTP), 443(HTTPS), 9050(Tor), 4200(SHELL IN BOX), 4444(i2p-http), 4447(i2p-socks), 53317(localsend)" "-System ports: 22(SSH), 80(HTTP), 443(HTTPS), 9050(Tor), 4200(SHELL IN BOX), 4444(i2p-http), 4447(i2p-socks), 53317(localsend)")${COLORS[RESET]}"
    echo -e "${COLORS[GRIS]}    $(get_message "-Ports Monero: 18080(P2P), 18081(Public), 18083(ZMQ), 18084(Tor), 18085(I2P), 18086(LWS), 18089(RPC)" "-Monero ports: 18080(P2P), 18081(Public), 18083(ZMQ), 18084(Tor), 18085(I2P), 18086(LWS), 18089(RPC)")${COLORS[RESET]}"
    echo
    print_styled "TITLE" "2) $(get_message "Installation de Monero CLI" "Monero CLI Installation")"
    print_styled "PRIMARY" "   $(get_message "- Installation des fichiers Monero" "- Installing Monero files")"
    print_styled "PRIMARY" "   $(get_message "- Configuration des permissions" "- Setting up permissions")"
    echo
    print_styled "TITLE" "3) $(get_message "Installation et configuration de TOR" "TOR Installation and configuration")"
           
    if [ -f /var/lib/tor/monero-service/hostname ]; then
    ONION_ADDRESS=$(sudo cat /var/lib/tor/monero-service/hostname)
    echo -e "${COLORS[SUCCESS]}    -TOR Onion: $ONION_ADDRESS${COLORS[RESET]}"
fi
   print_styled "SUCCESS" "     PORT RPC: 18089"
   if [ -f /var/lib/tor/ssh/hostname ]; then
    SSH_ONION_ADDRESS=$(sudo cat /var/lib/tor/ssh/hostname)
    echo -e "${COLORS[SUCCESS]}    -SSH Onion: $SSH_ONION_ADDRESS${COLORS[RESET]}"
fi
   print_styled "SUCCESS" "     PORT SSH: 22"
   print_styled "WARNING" "   $(get_message "  Les adresses Tor sont créées uniquement lors de votre installation" "  Tor addresses are only created during installation")"
    echo
    print_styled "TITLE" "4) $(get_message "Configuration de bitmonero.conf" "bitmonero.conf configuration")"
    print_styled "PRIMARY" "   $(get_message "- Configuration du fichier de démarrage" "- Configuring startup file")"
    print_styled "PRIMARY" "   $(get_message "- Configuration des ports" "- Setting up ports")"
    print_styled "SUCCESS" "$(get_message "    -rpc-bind-port=18089" "     rpc-bind-port=18089")"
    print_styled "PRIMARY" "   $(get_message "- Configuration des chemins" "- Setting up paths")"
    echo
    print_styled "TITLE" "5) $(get_message "Configuration DNS Anonyme" "Anonymous DNS Configuration")"
    print_styled "PRIMARY" "   $(get_message "- Installation des DNS sécurisés" "- Installing secure DNS")"
    print_styled "PRIMARY" "   $(get_message "- Configuration des serveurs DNS" "- Configuring DNS servers")"
    echo
    print_styled "TITLE" "6)$(get_message " Démarrage Blockchain et Bloquage 'IP Bans list':" " Start & Block 'IP bans list':")"
    print_styled "PRIMARY" "   $(get_message "- https://github.com/monero-project/meta/issues/1124" "- https://github.com/monero-project/meta/issues/1124")"
    print_styled "PRIMARY" "   $(get_message "- https://github.com/Boog900/monero-ban-list/blob/main/ban_list.txt" "- https://github.com/Boog900/monero-ban-list/blob/main/ban_list.txt")"
    echo
    print_styled "WARNING" "$(get_message " ⚠️  Configurer votre router/Box internet pour REDIRIGER le port 22 et 18080" " ⚠️ Configure your router/internet box to REDIRECT port 22 and 18080")"
   print_styled "WARNING" "$(get_message "    vers l'ADRESSE IP de votre PC" "    to your PC's IP ADDRESS")"
                echo

                read -p "$(print_styled "PRIMARY" "$(get_message "Appuyez sur Entrée pour continuer..." "Press Enter to continue...")")"
}

# Affichage des notes et informations
show_notes() {
    print_header "$(get_message "NOTES" "READ")"
    USERNAME=$SUDO_USER
    print_styled "TITLE" "$(get_message "- Pour arrêter la blockchain : CTRL + C." "- To stop the blockchain: CTRL + C.")"
    echo
    print_styled "TITLE" "$(get_message "- Votre nom d'utilisateur est: ${COLORS[SUCCESS]}$USERNAME${COLORS[INFO]}" "- Your username is: ${COLORS[SUCCESS]}$USERNAME${COLORS[INFO]}")"
    echo
    #print_styled "TITLE" "$(get_message "- Votre nom d'utilisateur est: $USERNAME" "- Your username is: $USERNAME")"
    # Vérification de l'adresse IP Tor
    print_styled "TITLE" "$(get_message "- Vérification de l'adresse IP Tor..." "- Checking Tor IP address...")"
    TOR_IP=$(torsocks curl -s https://check.torproject.org/api/ip 2>/dev/null)
    if [ $? -eq 0 ] && [ -n "$TOR_IP" ]; then
        print_styled "SUCCESS" "$(get_message "- Adresse IP TOR: ${COLORS[SUCCESS]}$TOR_IP${COLORS[SUCCESS]}" "- TOR IP address: ${COLORS[SUCCESS]}$TOR_IP${COLORS[SUCCESS]}")"
    else
        print_styled "ERROR" "$(get_message "- Impossible de récupérer l'adresse IP Tor" "- Unable to retrieve Tor IP address")"
    fi
    echo
    print_styled "PRIMARY" "$(get_message "- Configuration réseau requise :" "- Required network configuration:")"
    print_styled "PRIMARY" "$(get_message "/!\ REDIRIGER le port 22 et 18080 de votre Box internet" "/!\  Open port 22 and 18080 of your internet router")"
    print_styled "PRIMARY" "$(get_message "  vers l'IP de votre PC." "  to your PC's IP address.")"
    echo
    print_styled "TITLE" "$(get_message "- Installer MONERO GUI pour la gestion du wallet:" "- Install MONERO GUI for wallet management:")"
    print_styled "TITLE" "$(get_message "  https://www.getmonero.org/downloads/" "  https://www.getmonero.org/downloads/")"
    echo
    print_styled "PRIMARY" "$(get_message "  PDF Documentations point 5:" "  PDF Documentations point 5:")"
    print_styled "PRIMARY" "$(get_message "  https://tinyurl.com/kerlann" "  https://tinyurl.com/kerlann")"
    echo
    print_styled "TITLE" "$(get_message "- Questions: kerlann.xmr@ud.me" "- Questions: kerlann.xmr@ud.me")"
    echo
   print_styled "PRIMARY" "$(get_message "+ Gacieux Dons MONERO(Xmr) pour le dur labeur: " "+ Send MONERO Xmr donation for hard work")"
    print_styled "PRIMARY" "$(get_message "  avec 'cake wallet' à:   kerlann.xmr" " with 'cake wallet' to:   kerlann.xmr")"
    echo
    print_styled "TITLE" "$(get_message "- Code source:" "- Source Code:")"
    print_styled "TITLE" "$(get_message "  https://github.com/kerlannXmr" "  https://github.com/kerlannXmr")"
    
    read -p "$(print_styled "PRIMARY" "$(get_message "Appuyez sur Entrée pour continuer..." "Press Enter to continue...")")"
}

# Menu principal
show_menu() {
    while true; do
        setup_terminal
        echo -e "\n\n"
        
        print_styled "PRIMARY" "0) $(get_message "GUIDE" "HOW TO")"

        echo -e "${COLORS[TITLE]}$(get_message "Menu Principal:" "Main Menu:")${COLORS[RESET]}"
                
        print_styled "PRIMARY" "1) $(get_message "Mise à jour système" "Update system")"
        print_styled "PRIMARY" "2) $(get_message "Installer Monero CLI" "Install Monero CLI")"
        print_styled "PRIMARY" "3) $(get_message "Installer service Tor" "Install Tor")"
        print_styled "PRIMARY" "4) $(get_message "Configurer bitmonero" "Configure bitmonero")"
        print_styled "PRIMARY" "5) $(get_message "Configurer DNSSEC anonymes" "Configure anonymous DNS")"
        
        echo -e "${COLORS[TITLE]}$(get_message "BLOCKCHAIN" "BLOCKCHAIN")${COLORS[RESET]}"
        print_styled "PRIMARY" "6) $(get_message "MARCHE" "START")"
        print_styled "PRIMARY" "7) $(get_message "ARRET= ctrl+c" "STOP= ctrl+c")"
        
        echo -e "${COLORS[TITLE]}$(get_message "OPTION du NOEUD sur DISQUE:" "NODE OPTIONS on DISK:")${COLORS[RESET]}"
        print_styled "PRIMARY" "8) $(get_message "Blockchain sur disque Externe" "Blockchain on External disk")"
        print_styled "PRIMARY" "9) $(get_message "Blockchain sur disque Interne" "Blockchain on Internal disk")"
        echo -e "${COLORS[TITLE]}$(get_message "AUTRES OPTIONS" "OTHER OPTIONS")${COLORS[RESET]}"
        print_styled "PRIMARY" "10) $(get_message "Changer language" "Change language")"
        print_styled "PRIMARY" "11) $(get_message "INFOS" "FEATURES")"
        print_styled "PRIMARY" "12) $(get_message "NOTES" "READ")"
        
        echo -e "${COLORS[TITLE]}$(get_message "FIN" "END")${COLORS[RESET]}"
        print_styled "PRIMARY" "13) $(get_message "QUITTER" "EXIT")"
        
        echo -n "$(print_styled "INFO" "$(get_message "Choix (1-13): " "Choice (1-13): ")")"
        read -r choice

        case $choice in
            0) Manuel ;;
            1) update_system ;;
            2) 
        if ! ask_username; then
            continue  # Retourne au menu principal
        fi
        if ! select_blockchain_type; then
            continue  # Retourne au menu principal
        fi
        if ! install_monero_cli; then
            continue  # Retourne au menu principal
        fi
        ;;
            3) install_tor ;;
              4) 
        if ! ask_username; then
            continue
        fi
        if ! configure_monero; then
            continue
        fi
        ;;
            5) configure_dns ;;
            6) 
             clear
        setup_terminal
        echo -e "\n\n"
        if ! ask_username; then
            continue
        fi
        if ! start_blockchain; then
            continue
        fi
        ;;
            7)
                echo -n "$(print_styled "INFO" "$(get_message "Voulez-vous vraiment arrêter la blockchain? (o/n): " "Do you really want to stop the blockchain? (y/n): ")")"
                read -r confirm
                case $confirm in
                    [OoYy]*)
                        pkill -f monerod
                        success "$(get_message "Blockchain arrêtée" "Blockchain stopped")"
                        ;;
                esac
                ;;
            
            8) 
               if ! ask_username; then
            continue
        fi
        if ! manage_blockchain; then
            continue
        fi 
        ;;
            9) unmount_external_disk ;;
            10) select_language ;;
            11) show_scripts ;;
            12) show_notes ;;
            13)
                success "$(get_message "Programme d'aide informatique et de liberté. Permet d'installer un noeud MONERO sans aucune connaissance. Merci d'avoir utilisé ce programme." "Computer assistance and freedom program. Install a MONERO node without any knowledge. Thankful for today, using this program.")"
                exit 0
                ;;
            *)
                error "$(get_message "Option invalide" "Invalid option")"
                ;;
        esac

        # Si une erreur survient
        if [ $? -ne 0 ]; then
            error "$(get_message "Une erreur est survenue" "An error occurred")"
            read -p "$(print_styled "PRIMARY" "$(get_message "Appuyez sur Entrée pour continuer..." "Press Enter to continue...")")"
        fi
    done
}

# Point d'entrée du script
setup_terminal
check_and_update_wsl
select_language
show_menu
exit 0
