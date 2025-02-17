#!/bin/bash

# Définition unique des couleurs et du style
declare -A COLORS=(
    ["PRIMARY"]='\033[38;5;255m'    # Blanc normal
    ["SUCCESS"]='\033[38;5;71m'     # Vert apaisant
    ["MONERO"]='\033[38;5;208m'     # Orange monero
    ["WARNING"]='\033[38;5;184m'    # Jaune doux
    ["ERROR"]='\033[38;5;167m'      # Rouge atténué
    ["INFO"]='\033[38;5;74m'        # Bleu clair
    ["HEADER"]='\033[38;5;140m'     # Violet clair pour les titres
    ["BG"]='\033[48;5;16m'          # Noir encore plus profond
    ["RESET"]='\033[0m'             # Reset
    ["GRIS"]='\033[38;5;245m'       # GRIS
)

declare -A COLORS=(
    ["PRIMARY"]='\033[38;5;255m'    # Blanc normal
    ["SUCCESS"]='\033[38;5;71m'     # Vert apaisant
    ["MONERO"]='\033[38;5;208m'     # Orange monero
    ["WARNING"]='\033[38;5;184m'    # Jaune doux
    ["ERROR"]='\033[38;5;167m'      # Rouge atténué
    ["INFO"]='\033[38;5;74m'        # Bleu clair
    #["BG"]='\033[48;5;0m'           # Fond noir (modifié)
    ["BG"]='\033[48;5;16m'           # Noir encore plus profond
    #["BG"]='\033[48;2;0;0;0m'       # Noir absolu RGB
    ["GRIS"]='\033[38;5;245m'        # GRIS
    # ... autres couleurs ...
)

# Fonction pour dessiner la bannière
draw_banner() {
    tput sc
    tput cup 0 0
    echo -e "\033[38;5;208m"
    echo "  *     *   ***   *   * ***** ****   ***   "
    echo "  **   **  *   *  **  * *     *   * *   *  "
    echo "  * * * * *     * * * * ****  ****  *   *  "
    echo "  *  *  * *     * *  ** *     * *   *   *  "
    echo "  *     *  *   *  *   * *     *  *  *   *  "
    echo "  *     *   ***   *   * ***** *   *  ***   "
    echo "  ═══════════ ▌EASYNODE▐ ═══════════linux"
    #echo "  ═══════════ EASYNODE ═══════════v1linux  "
    echo -e "${COLORS[RESET]}"
    tput rc
}

# Variables globales
USERNAME=""
LANG_CHOICE=""
BLOCKCHAIN_TYPE=""
MONERO_VERSION="0.18.3.4"

# Fonction d'affichage stylisé (placée après la déclaration des couleurs)
print_styled() {
    local style=$1
    local message=$2
    echo -e "${COLORS[$style]}${message}${COLORS[RESET]}"
}
# Fonction pour les messages d'information
info() {
    print_styled "INFO" "ℹ $1"
}

# Messages d'erreur
error() {
    print_styled "ERROR" "✖ $1"
}

# Messages d'avertissement
warning() {
    print_styled "WARNING" "⚠ $1"
}

# Messages de succès
success() {
    print_styled "SUCCESS" "✓ $1"
}


# Fonction pour afficher les en-têtes
print_header() {
    local message=$1
    local length=${#message}
    local total_width=37    # Largeur totale de la ligne
    local line="═════════════════════════════════════════"
    local padding=$(( (total_width - length) / 2 ))
    local spaces=$(printf '%*s' $padding '')
    echo
    print_styled "MONERO" "$line"
    print_styled "HEADER" "${spaces}${message}"
    print_styled "MONERO" "$line"
    echo
}

# Configuration du terminal
setup_terminal() {
    echo -e "${COLORS[BG]}"
    clear
    printf '\033]11;#1a1a1a\007'
    draw_banner
}
# Messages d'information
info() {
    print_styled "INFO" "ℹ $1"
}

# Messages d'erreur
error() {
    print_styled "ERROR" "✖ $1"
}

# Messages d'avertissement
warning() {
    print_styled "WARNING" "⚠ $1"
}

# Messages de succès
success() {
    print_styled "SUCCESS" "✓ $1"
}

# Sélection de la langue
select_language() {
    clear
    draw_banner
    echo -e "\n\n\n\n\n\n\n\n"  # Ajoute de l'espace après la bannière
    print_header "LANGUAGE SELECTION"
                  
    while true; do
        print_styled "PRIMARY" "1) Français"
        print_styled "PRIMARY" "2) English"
        echo -n "$(print_styled "MONERO" "Choose/Choisissez (1-2): ")"    
            
        read -r lang_choice
        case $lang_choice in
            1) LANG_CHOICE="FR"; break ;;
            2) LANG_CHOICE="EN"; break ;;
            *) error "Invalid choice / Choix invalide" ;;    
        esac
      done
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
 #manuel
 Manuel() {
    clear
    setup_terminal
    echo -e "\n\n\n\n\n\n\n\n"  # Espace pour la bannière
    print_header "$(get_message "GUIDE" "HOW TO")"
   
    print_styled "MONERO" "$(get_message "Pour une installation complète, suivez ces étapes dans l'ordre:" "For a complete installation, follow these steps in order:")"
    echo
         print_styled "SUCCESS" "$(get_message "  1️⃣ ➜ 2️⃣ ➜ 3️⃣ ➜ 4️⃣ ➜ 5️⃣." "  1️⃣ ➜ 2️⃣ ➜ 3️⃣ ➜ 4️⃣ ➜ 5️⃣.")"
   echo
   print_styled "SUCCESS" "$(get_message "  Puis au choix :" "  Then your choice :")"
   echo
   print_styled "SUCCESS" "$(get_message "  ▶️ Disque interne : étape 6️⃣." "  ▶️ Internal disk : stape 6️⃣.")"
   echo
   print_styled "SUCCESS" "$(get_message "  ▶️ Disque externe : étape 8️⃣ puis 6️⃣." "  ▶️ External disk : stape 8️⃣ then 6️⃣.")"
   echo
   print_header "$(get_message "AUTRES" "OTHER")"
   print_styled "GRIS" "$(get_message "  ➡️ Étape 6 : Démarrer le nœud et configurer l'exclusion des ⛔ 'IP bannis '." "  ➡️ stape6: Start the Node and introduce the exclusion of the ⛔ 'listed IP bans'.")"
   echo
   print_styled "GRIS" "$(get_message "  ➡️ Étape 9 : Démonter la blockchain du disque externe," "  ➡️ Stape 9 : Is used to unmount the blockchain from the external disk,")"
   print_styled "GRIS" "$(get_message "  ↳ Pour revenir au disque interne : passez à l'étape 6." "  ↳ Return on internal disk: then stape 6.")"
   echo
   print_styled "GRIS" "$(get_message "  ➡️ Étape 4 : Sert aussi pour le DEBUG du chemin d'amorçage du disque interne." "  ➡️ Stape 4 : Also serves as DEBUG of the boot path to internal disk.")"
   echo
   print_styled "PRIMARY" "$(get_message "   CTRL+C 1 seule fois pour arreter la Blockchain et revenir au menu." "  -CTRL+C 1 time only to stop the Blockchain and return to the menu.")"
   echo
   print_styled "WARNING" "$(get_message "⚠️ Important: REDIRIGER le port 22 et 18080 de votre Box internet" "⚠️ Important: REDIRECT port 22 and 18080 from your internet router")"
   print_styled "WARNING" "$(get_message "  vers l'adresse 'ip local' de votre PC" "  to your 'local ip' of your PC")"
   echo
    read -p "$(print_styled "PRIMARY" "$(get_message "Appuyez sur Entrée pour revenir au menu..." "Press Enter to return to menu...")")"
}
# Sélection du type de blockchain
select_blockchain_type() {
    print_header "$(get_message "TYPE DE BLOCKCHAIN" "BLOCKCHAIN TYPE")"
    
        print_styled "PRIMARY" "$(get_message "1) Complète 220 Go" "1) Complete 220 Go")"
        print_styled "PRIMARY" "$(get_message "2) Prune 90 Go" "2) Pruned 90 Go")"
        echo -n "$(print_styled "INFO" "$(get_message "Choix (1-2): " "Choice (1-2): ")")"
        read -r choice
        case $choice in
            1) BLOCKCHAIN_TYPE="complete"; return 0  ;;
            2) BLOCKCHAIN_TYPE="pruned"; return 0 ;;
            *) 
            error "$(get_message "Choix invalide" "Invalid choice")" 
            return 1;;
        esac
    
}

update_system() {
    print_header "$(get_message "MISE À JOUR DU SYSTÈME" "SYSTEM UPDATE")"
    
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

    # Activation et configuration de SSH
    info "$(get_message "Configuration de SSH..." "Configuring SSH...")"
    sudo systemctl enable ssh
    sudo systemctl start ssh
    
    # Configuration de sshd_config
info "$(get_message "Configuration du fichier SSH..." "Configuring SSH file...")"
echo "Port 22" | sudo tee /etc/ssh/sshd_config
echo "ListenAddress 0.0.0.0" | sudo tee -a /etc/ssh/sshd_config
echo "PasswordAuthentication yes" | sudo tee -a /etc/ssh/sshd_config

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
    sudo ufw allow 22
    sudo ufw allow 80
    sudo ufw allow 443
    sudo ufw allow 9050
    sudo ufw allow 18080:18090/tcp
    sudo ufw allow 18080:18090/udp
    sudo ufw allow 4200
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
    
    #ou 
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
# Fonction pour ajouter les IPs bannies à bitmonero.conf

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
  ═════════════ ▌EASYNODE▐ ═════════Linux\e[0m

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
# Demande du nom d'utilisateur
ask_username() {
    print_header "$(get_message "CONFIGURATION UTILISATEUR" "USER CONFIGURATION")"
    
    local current_user=""
    if [ -n "$SUDO_USER" ]; then
        current_user="$SUDO_USER"
    elif [ -n "$USER" ]; then
        current_user="$USER"
    else
        current_user=$(whoami)
    fi
    
    echo -e "$(get_message "Utilisateur détecté: " "Detected user: ")${COLORS[SUCCESS]}${current_user}${COLORS[RESET]}"
    echo
    
    print_styled "INFO" "$(get_message "Appuyez sur Entrée pour confirmer ou tapez un autre nom d'utilisateur: " "Press Enter to confirm or type another username: ")"
    read -r input_username
    
    if [ -z "$input_username" ]; then
        input_username="$current_user"
        USERNAME="$input_username"
        return 0
    fi
    
    if ! id "$input_username" &>/dev/null; then
        error "$(get_message "L'utilisateur n'existe pas" "User does not exist")"
        return 1
    fi
    
    USERNAME="$input_username"
    return 0
}


install_monero_cli() {
    if [ -z "$USERNAME" ]; then
        error "$(get_message "Nom d'utilisateur non défini" "Username not defined")"
        return 1
    fi

    print_header "$(get_message "INSTALLATION DE MONERO" "MONERO INSTALLATION")"
    
    # Création du répertoire d'installation
    mkdir -p ~/monero_install
    cd ~/monero_install || exit
    
    # Définition du nom de fichier
    local MONERO_FILE="monero-linux-x64-v${MONERO_VERSION}.tar.bz2"
    
    info "$(get_message "Téléchargement de Monero..." "Downloading Monero...")"
    if wget --tries=3 "https://downloads.getmonero.org/cli/${MONERO_FILE}"; then
        success "$(get_message "Téléchargement terminé" "Download completed")"
        
        # Vérification de la taille du fichier
        local FILE_SIZE=$(stat -f%z "$MONERO_FILE" 2>/dev/null || stat -c%s "$MONERO_FILE")
        if [ "$FILE_SIZE" -lt 1000000 ]; then  # Si le fichier fait moins de 1MB
            error "$(get_message "Fichier téléchargé incomplet" "Downloaded file is incomplete")"
            rm -f "$MONERO_FILE"
            return 1
        fi
        
        info "$(get_message "Extraction des fichiers..." "Extracting files...")"
        if tar xvjf "$MONERO_FILE"; then
            success "$(get_message "Extraction terminée" "Extraction completed")"
        else
            error "$(get_message "Échec de l'extraction - Tentative de re-téléchargement" "Extraction failed - Trying to download again")"
            rm -f "$MONERO_FILE"
            if wget --tries=3 "https://downloads.getmonero.org/cli/${MONERO_FILE}" && tar xvjf "$MONERO_FILE"; then
                success "$(get_message "Second essai réussi" "Second attempt successful")"
            else
                error "$(get_message "Installation impossible" "Installation impossible")"
                return 1
            fi
        fi
    else
        error "$(get_message "Échec du téléchargement" "Download failed")"
        return 1
    fi

    # Suite de l'installation si tout est OK
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

    success "$(get_message "Installation terminée dans /home/$USERNAME/monero" "Installation completed in /home/$USERNAME/monero")"
    return 0
}
install_tor() {
    print_header "$(get_message "INSTALLATION DE TOR" "TOR INSTALLATION")"
    
    # Vérifier si Tor est déjà installé
    if ! command -v tor &> /dev/null; then
        info "$(get_message "Installation de Tor..." "Installing Tor...")"
        if sudo apt update && sudo apt install -y tor; then
            success "$(get_message "Installation de Tor terminée" "Tor installation completed")"
        else
            error "$(get_message "Échec de l'installation de Tor" "Tor installation failed")"
            return 1
        fi
    else
        info "$(get_message "Tor est déjà installé" "Tor is already installed")"
    fi

    # Sauvegarder la configuration originale si elle existe
    if [ -f /etc/tor/torrc ]; then
        sudo cp /etc/tor/torrc /etc/tor/torrc.backup
    fi

    # Écrire la nouvelle configuration
    sudo bash -c 'cat > /etc/tor/torrc << EOL
# Configuration Tor pour Monero
SOCKSPort 9050
ControlPort 9051
HiddenServiceDir /var/lib/tor/ssh/
HiddenServicePort 22 127.0.0.1:22
HiddenServiceDir /var/lib/tor/monero-service/
HiddenServicePort 18089 127.0.0.1:18089
EOL'

    # Créer les répertoires seulement s'ils n'existent pas
    if [ ! -d "/var/lib/tor/monero-service/" ]; then
        sudo mkdir -p /var/lib/tor/monero-service/
        sudo chown -R debian-tor:debian-tor /var/lib/tor/monero-service/
        sudo chmod 700 /var/lib/tor/monero-service/
    fi

    if [ ! -d "/var/lib/tor/ssh/" ]; then
        sudo mkdir -p /var/lib/tor/ssh/
        sudo chown -R debian-tor:debian-tor /var/lib/tor/ssh/
        sudo chmod 700 /var/lib/tor/ssh/
    fi

    info "$(get_message "Redémarrage de Tor..." "Restarting Tor...")"
    sudo systemctl restart tor

    info "$(get_message "Génération de l'adresse onion..." "Generating onion address...")"
    sleep 10

    if [ -f /var/lib/tor/monero-service/hostname ]; then
        ONION_ADDRESS=$(sudo cat /var/lib/tor/monero-service/hostname)
        success "$(get_message "Adresse onion: $ONION_ADDRESS" "Onion address: $ONION_ADDRESS")"
        echo "Monero Onion Address ($(date)): $ONION_ADDRESS" | sudo tee -a "/home/$USERNAME/monero_onion_address.txt"
        sudo chown "$USERNAME:$USERNAME" "/home/$USERNAME/monero_onion_address.txt"
        echo "-------------------->$(get_message "L'adresse TOR est sauvegardée dans le dossier /home" "The TOR address is saved in the folder /home")"
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
    
    CONFIG_FILE="/home/$USERNAME/.bitmonero/bitmonero.conf"
    mkdir -p "/home/$USERNAME/.bitmonero"

    # Configuration de base
    cat > "$CONFIG_FILE" << EOL
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
confirm-external-bind=1
data-dir=/home/$USERNAME/.bitmonero
EOL

    if [ "$BLOCKCHAIN_TYPE" = "pruned" ]; then
        echo "prune-blockchain=1" >> "$CONFIG_FILE"
    fi

    sudo chown "$USERNAME:$USERNAME" "$CONFIG_FILE"
    sudo chmod 644 "$CONFIG_FILE"

    success "$(get_message "Configuration créée dans $CONFIG_FILE" "Configuration created in $CONFIG_FILE")"
    read -p "$(print_styled "PRIMARY" "$(get_message "Appuyez sur Entrée pour continuer..." "Press Enter to continue...")")"
}

# Configuration des DNS
configure_dns() {
    print_header "$(get_message "CONFIGURATION DNS" "DNS CONFIGURATION")"
    
    info "$(get_message "Configuration des serveurs DNS..." "Configuring DNS servers...")"

    sudo cp /etc/resolv.conf /etc/resolv.conf.backup

    if systemctl is-active --quiet systemd-resolved; then
        sudo systemctl stop systemd-resolved
        sudo systemctl disable systemd-resolved
    fi

    if [ -L /etc/resolv.conf ]; then
        sudo rm /etc/resolv.conf
    fi

    cat << EOL | sudo tee /etc/resolv.conf
# Serveurs DNS pour Monero
nameserver 9.9.9.9
nameserver 149.112.112.112
nameserver 91.239.100.100
nameserver 89.233.43.71
EOL

    sudo chmod 644 /etc/resolv.conf

    success "$(get_message "Configuration DNS terminée" "DNS configuration completed")"
    info "$(get_message "Backup créé: /etc/resolv.conf.backup" "Backup created: /etc/resolv.conf.backup")"
    
    read -p "$(print_styled "PRIMARY" "$(get_message "Appuyez sur Entrée pour continuer..." "Press Enter to continue...")")"
}

unmount_sdb1() {
    print_header "$(get_message "DÉMONTAGE DU DISQUE" "DISK UNMOUNTING")"
    
    MOUNT_POINT="/media/monero_external"
    
    if mount | grep -q "$MOUNT_POINT"; then
        if lsof "$MOUNT_POINT" > /dev/null 2>&1; then
            warning "$(get_message "Fermeture des processus en cours..." "Closing active processes...")"
            lsof "$MOUNT_POINT" | awk 'NR!=1 {print $2}' | xargs -r sudo kill
            sleep 2
        fi
        
        if sudo umount -f "$MOUNT_POINT"; then
            success "$(get_message "Disque démonté avec succès" "Disk unmounted successfully")"
            
            if [ -n "$USERNAME" ]; then
                CONFIG_FILE="/home/$USERNAME/.bitmonero/bitmonero.conf"
                if [ -f "$CONFIG_FILE" ]; then
                    # Supprimer l'ancienne ligne data-dir
                    grep -v "^data-dir=" "$CONFIG_FILE" | sudo tee "$CONFIG_FILE.tmp" > /dev/null
                    # Ajouter la nouvelle ligne data-dir
                    echo "data-dir=/home/$USERNAME/.bitmonero" | sudo tee -a "$CONFIG_FILE.tmp"
                    sudo mv "$CONFIG_FILE.tmp" "$CONFIG_FILE"
                    sudo chown "$USERNAME:$USERNAME" "$CONFIG_FILE"
                    sudo chmod 644 "$CONFIG_FILE"
                    success "$(get_message "Configuration Monero mise à jour" "Monero configuration updated")"
                fi
            else
                warning "$(get_message "Impossible de mettre à jour la configuration: utilisateur non défini" "Cannot update configuration: username not defined")"
            fi
        else
            error "$(get_message "Échec du démontage" "Unmounting failed")"
            return 1
        fi
    else
        warning "$(get_message "Le disque n'est pas monté sur $MOUNT_POINT" "Disk is not mounted on $MOUNT_POINT")"
    fi
    read -p "$(print_styled "PRIMARY" "$(get_message "Appuyez sur Entrée pour continuer..." "Press Enter to continue...")")"
}

# Gestion de la blockchain
manage_blockchain() {
    print_header "$(get_message "GESTION DE LA BLOCKCHAIN" "BLOCKCHAIN MANAGEMENT")"
    
    if [ -z "$USERNAME" ]; then
        error "$(get_message "Nom d'utilisateur non défini" "Username not defined")"
        return 1
    fi

    # Définition des chemins
    EXTERNAL_DRIVE="/media/monero_external"
    BLOCKCHAIN_FOLDER="MoneroBlockchain"
    BLOCKCHAIN_PATH="$EXTERNAL_DRIVE/$BLOCKCHAIN_FOLDER"

    info "$(get_message "Liste des disques disponibles:" "Available disks:")"
    lsblk -nrpo "NAME,SIZE,TYPE,MOUNTPOINT,FSTYPE" | awk '$3=="disk" || $3=="part"'
    
    echo -n "$(print_styled "INFO" "$(get_message "Entrez le nom du disque (ex: sdb1): " "Enter disk name (e.g., sdb1): ")")"
    read -r DEVICE
    
    if [ -z "$DEVICE" ]; then
        error "$(get_message "Aucun disque sélectionné" "No disk selected")"
        return 1
    fi
    
    DEVICE="/dev/$DEVICE"
    
    if [ ! -b "$DEVICE" ]; then
        error "$(get_message "Le périphérique $DEVICE n'existe pas" "Device $DEVICE does not exist")"
        return 1
    fi

    # Démontage du disque s'il est déjà monté
    if mount | grep -q "$DEVICE"; then
        sudo umount "$DEVICE" 2>/dev/null
    fi

    # Création et montage du point de montage
    sudo mkdir -p "$EXTERNAL_DRIVE"
    if ! sudo mount "$DEVICE" "$EXTERNAL_DRIVE"; then
        error "$(get_message "Échec du montage" "Mount failed")"
        return 1
    fi
    
    # Création du dossier blockchain et configuration des permissions
    sudo mkdir -p "$BLOCKCHAIN_PATH"
    sudo chown -R "$USERNAME:$USERNAME" "$EXTERNAL_DRIVE"
    sudo chmod -R u+rw "$EXTERNAL_DRIVE"

    # Sauvegarde de la configuration actuelle si elle existe
    CONFIG_FILE="/home/$USERNAME/.bitmonero/bitmonero.conf"
    if [ -f "$CONFIG_FILE" ]; then
        sudo cp "$CONFIG_FILE" "${CONFIG_FILE}.backup"
    fi

    # S'assurer que le répertoire de configuration existe
    sudo mkdir -p "$(dirname "$CONFIG_FILE")"

    # Créer une configuration temporaire
    TMP_CONFIG=$(mktemp)
    
    # Écrire la nouvelle configuration
    {
        echo "# Configuration Monero"
        echo "no-igd=1"
        echo "no-zmq=1"
        echo "rpc-bind-ip=0.0.0.0"
        echo "rpc-bind-port=18089"
        echo "p2p-bind-port=18080"
        echo "in-peers=64"
        echo "out-peers=32"
        echo "limit-rate-up=1048576"
        echo "limit-rate-down=8388608"
        echo "confirm-external-bind=1"
        echo "data-dir=$BLOCKCHAIN_PATH"
        if [ "$BLOCKCHAIN_TYPE" = "pruned" ]; then
            echo "prune-blockchain=1"
        fi
    } > "$TMP_CONFIG"

    # Vérifier que le fichier temporaire a été créé correctement
    if [ -s "$TMP_CONFIG" ]; then
        # Copier le fichier temporaire vers l'emplacement final
        sudo cp "$TMP_CONFIG" "$CONFIG_FILE"
        rm "$TMP_CONFIG"
        
        # Vérifier que la ligne data-dir est présente
        if ! grep -q "^data-dir=" "$CONFIG_FILE"; then
            echo "data-dir=$BLOCKCHAIN_PATH" | sudo tee -a "$CONFIG_FILE"
        fi
    else
        error "$(get_message "Erreur lors de la création de la configuration" "Error creating configuration")"
        rm -f "$TMP_CONFIG"
        return 1
    fi

    # Configuration des permissions du fichier de configuration
    sudo chown "$USERNAME:$USERNAME" "$CONFIG_FILE"
    sudo chmod 644 "$CONFIG_FILE"

    # Ajout de l'entrée dans fstab pour le montage automatique
    if ! grep -q "$DEVICE.*$EXTERNAL_DRIVE" /etc/fstab; then
        DEVICE_UUID=$(sudo blkid -s UUID -o value "$DEVICE")
        echo "UUID=$DEVICE_UUID $EXTERNAL_DRIVE auto defaults,nofail 0 0" | sudo tee -a /etc/fstab
        success "$(get_message "Configuration du montage automatique ajoutée" "Automatic mount configuration added")"
    fi

    success "$(get_message "Blockchain configurée dans: $BLOCKCHAIN_PATH" "Blockchain configured in: $BLOCKCHAIN_PATH")"
    info "$(get_message "Le disque sera monté automatiquement au démarrage" "The disk will be automatically mounted at boot")"
    read -p "$(print_styled "PRIMARY" "$(get_message "Appuyez sur Entrée pour continuer..." "Press Enter to continue...")")"
}
#demarrage de la blockchain
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
            sleep 4  # Délai pour s'assurer que tout est terminé
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
# Affichage des notes et informations
show_notes() {
          clear
                setup_terminal
                echo -e "\n\n\n\n\n\n\n\n"  # Espace pour la bannière 
                

                print_header "$(get_message "NOTES" "READ")"
                
                print_styled "MONERO" "$(get_message "- Pour arrêter la blockchain : CTRL + C" "- To stop the blockchain: CTRL + C")"
                echo
                print_styled "MONERO" "$(get_message "- Votre nom d'utilisateur est: ${COLORS[SUCCESS]}$SUDO_USER${COLORS[INFO]}" "- Your username is: ${COLORS[SUCCESS]}$SUDO_USER${COLORS[INFO]}")"
                echo
                #print_styled "INFO" "$(get_message "- Votre nom d'utilisateur est: $USERNAME" "- Your username is: $USERNAME")"
                #print_styled "INFO" "$(get_message "- Le nom utilisateur se trouve apres /home/.." "- username is after /home/..")"
                print_styled "MONERO" "$(get_message "- Vérification de l'adresse IP Tor..." "- Checking Tor IP address...")"
    TOR_IP=$(torsocks curl -s https://check.torproject.org/api/ip 2>/dev/null)
    if [ $? -eq 0 ] && [ -n "$TOR_IP" ]; then
        print_styled "SUCCESS" "$(get_message "- Adresse IP TOR: ${COLORS[SUCCESS]}$TOR_IP${COLORS[SUCCESS]}" "- TOR IP address: ${COLORS[SUCCESS]}$TOR_IP${COLORS[SUCCESS]}")"
    else
        print_styled "ERROR" "$(get_message "- Impossible de récupérer l'adresse IP Tor" "- Unable to retrieve Tor IP address")"
    fi
    echo
                print_styled "PRIMARY" "$(get_message "- Configuration réseau requise :" "- Required network configuration:")"
    print_styled "PRIMARY" "$(get_message "⚠️ REDIRIGER le port 22 et 18080 de votre Box internet" "⚠️ Open port 22 and 18080 of your internet router")"
    print_styled "PRIMARY" "$(get_message "  vers l'IP de votre PC." "  to your PC's IP address.")"
                echo
    print_styled "MONERO" "$(get_message "- Installer MONERO GUI pour la gestion du wallet" "- Install MONERO GUI for wallet management")"
                print_styled "MONERO" "$(get_message "  MONERO GUI se synchronisera sur ce noeud" "  MONERO GUI will synch on this node")"
                
                print_styled "MONERO" "$(get_message "  https://www.getmonero.org/downloads/" "  https://www.getmonero.org/downloads/")"
                echo
                print_styled "MONERO" "\e]8;;https://mega.nz/file/gjNWgL5B#itd6yCJJk_-1QbP2NbGWIm5DI1CC_MbTr8L6TeDqESI\e\\  PDF Documentations point 5 (CTRL+click)\e]8;;\e\\"
                echo
    print_styled "MONERO" "$(get_message "- Questions: kerlann.xmr@ud.me" "- Questions: kerlann.xmr@ud.me")"
    echo
    print_styled "PRIMARY" "$(get_message "-🙏 Gacieux Dons MONERO(Xmr) pour le dur labeur: " "-🙏 Send MONERO(Xmr) donation for hard work")" 
    print_styled "PRIMARY" "$(get_message "    avec 'cake wallet' à:    kerlann.xmr" "    with 'cake wallet' to:   kerlann.xmr")"
    echo
    print_styled "MONERO" "$(get_message "- Code source:" "- Source Code:")"
    print_styled "MONERO" "$(get_message "  https://github.com/kerlannXmr" "  https://github.com/kerlannXmr")"
                
                read -p "$(print_styled "PRIMARY" "$(get_message "Appuyez sur Entrée pour continuer..❤️." "Press Enter to continue..❤️.")")"
}
# Affichage des scripts disponibles
show_scripts() {
       clear
       setup_terminal
       echo -e "\n\n\n\n\n\n"  # Espace pour la bannière
       print_header "$(get_message "INFOS" "FEATURES")"
  
  print_styled "MONERO" "1) $(get_message "Mise à jour système et installation des paquets" "System update and package installation")"
    print_styled "PRIMARY" "   $(get_message "- Configuration du firewall activé avec ouverture des ports :" "- Firewall configuration Actived with ports opening:")"
    echo -e "${COLORS[GRIS]}    $(get_message "-Ports system: 22(SSH), 80(HTTP), 443(HTTPS), 9050(Tor), 4200(SHELL IN BOX), 4444(i2p-http), 4447(i2p-socks), 53317(localsend)" "-System ports: 22(SSH), 80(HTTP), 443(HTTPS), 9050(Tor), 4200(SHELL IN BOX), 4444(i2p-http), 4447(i2p-socks), 53317(localsend)")${COLORS[RESET]}"
    echo -e "${COLORS[GRIS]}    $(get_message "-Ports Monero: 18080(P2P), 18081(Public), 18083(ZMQ), 18084(Tor), 18085(I2P), 18086(LWS), 18089(RPC)" "-Monero ports: 18080(P2P), 18081(Public), 18083(ZMQ), 18084(Tor), 18085(I2P), 18086(LWS), 18089(RPC)")${COLORS[RESET]}"
    echo
    print_styled "MONERO" "2) $(get_message "Installation de Monero CLI" "Monero CLI Installation")"
    print_styled "PRIMARY" "   $(get_message "- Installation des fichiers Monero" "- Installing Monero files")"
    print_styled "PRIMARY" "   $(get_message "- Configuration des permissions" "- Setting up permissions")"
    echo
    print_styled "MONERO" "3) $(get_message "Installation et configuration de TOR" "TOR Installation and configuration")"
           
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
   print_styled "WARNING" "   $(get_message " Les adresses Tor sont créées uniquement lors de votre installation" "  Tor addresses are only created during installation")"
    echo
    print_styled "MONERO" "4) $(get_message "Configuration de bitmonero.conf" "bitmonero.conf configuration")"
    print_styled "PRIMARY" "   $(get_message "- Configuration du fichier de démarrage" "- Configuring startup file")"
    print_styled "PRIMARY" "   $(get_message "- Configuration des ports" "- Setting up ports")"
    print_styled "SUCCESS" "$(get_message "    -rpc-bind-port=18089" "     rpc-bind-port=18089")"
    print_styled "PRIMARY" "   $(get_message "- Configuration des chemins" "- Setting up paths")"
    echo
    print_styled "MONERO" "5) $(get_message "Configuration DNS Anonyme" "Anonymous DNS Configuration")"
    print_styled "PRIMARY" "   $(get_message "- Installation des DNS sécurisés" "- Installing secure DNS")"
    print_styled "PRIMARY" "   $(get_message "- Configuration des serveurs DNS" "- Configuring DNS servers")"
    echo
    print_styled "MONERO" "6)$(get_message " Démarrage Blockchain et Bloquage 'IP Bans list':" "Start & Block 'IP bans list':")"
    print_styled "PRIMARY" "   $(get_message "- https://github.com/monero-project/meta/issues/1124" "- https://github.com/monero-project/meta/issues/1124")"
    print_styled "PRIMARY" "   $(get_message "- https://github.com/Boog900/monero-ban-list/blob/main/ban_list.txt" "- https://github.com/Boog900/monero-ban-list/blob/main/ban_list.txt")"
    echo
    print_styled "WARNING" "$(get_message " ⚠️  Configurer votre router/Box internet pour REDIRIGER le port 22 et 18080" " ⚠️   Configure your router/internet box to REDIRECT port 22 and 18080")"
   print_styled "WARNING" "$(get_message "    vers l'ADRESSE IP de votre PC" "    to your PC's IP ADDRESS")"
                echo

                read -p "$(print_styled "PRIMARY" "$(get_message "Appuyez sur Entrée pour continuer..." "Press Enter to continue...")")"
}
show_menu() {
    while true; do
        setup_terminal
        echo -e "\n\n\n\n\n\n\n\n"  # Espace pour la bannière
        
         
        print_styled "PRIMARY" "0) $(get_message "GUIDE" "HOW TO")"
        
        echo -e "\033[38;5;208m$(get_message "Menu Principal:" "Main Menu:")${COLORS[RESET]}"
        print_styled "PRIMARY" "1) $(get_message "Mise à jour système" "Update system")"
        print_styled "PRIMARY" "2) $(get_message "Installer Monero CLI" "Install Monero CLI")"
        print_styled "PRIMARY" "3) $(get_message "Installer service Tor" "Install configure Tor")"
        print_styled "PRIMARY" "4) $(get_message "Configurer bitmonero" "Configure bitmonero")"
        print_styled "PRIMARY" "5) $(get_message "Configurer DNS anonymes" "Configure anonymous DNS")"
        
        echo -e "\033[38;5;208m$(get_message "BLOCKCHAIN" "BLOCKCHAIN")${COLORS[RESET]}"
        print_styled "PRIMARY" "6) $(get_message "MARCHE" "START")"
        print_styled "PRIMARY" "7) $(get_message "ARRET= ctrl+c" "STOP= ctrl+c")"
        
        echo -e "\033[38;5;208m$(get_message "Option du Noeud sur Disque:" "Node Option on DISK:")${COLORS[RESET]}"
        
        print_styled "PRIMARY" "8) $(get_message "Blockchain sur DISQUE EXTERNE" "Blockchain on EXTERNAL DISK")"
        print_styled "PRIMARY" "9) $(get_message "Blockchain sur DISQUE INTERNE" "Blockchain on INTERNAL DISK")"
        
        echo -e "\033[38;5;208m$(get_message "AUTRES OPTIONS" "OTHER OPTIONS")${COLORS[RESET]}"
        print_styled "PRIMARY" "10) $(get_message "Changer language" "Change language")"
        print_styled "PRIMARY" "11) $(get_message "INFOS" "FEATURES")"
        print_styled "PRIMARY" "12) $(get_message "NOTES" "READ")"
        
        echo -e "\033[38;5;208m$(get_message "FIN" "END")${COLORS[RESET]}"
        print_styled "PRIMARY" "13) $(get_message "QUITTER" "EXIT")"
                
        echo -n "$(print_styled "INFO" "$(get_message "Choix (1-13): " "Choice (1-13): ")")"
        read -r choice

        case $choice in
              
            0) 
                Manuel
                ;;
            1) 
                update_system 
                ;;
            2)  
                if ! ask_username; then
                    continue
                fi
                if ! select_blockchain_type; then
                    continue
                fi
                install_monero_cli
                read -p "$(print_styled "PRIMARY" "$(get_message "Appuyez sur Entrée pour continuer..." "Press Enter to continue...")")"
                ;;
            3)  
                if ! ask_username; then
                    continue
                fi
                install_tor
                ;;
            4)  
                if ! ask_username; then
                    continue
                fi
                configure_monero
                ;;
            5) 
                configure_dns 
                ;;
            6)
                if ! ask_username; then
                    continue
                fi
                start_blockchain
                ;;
            7) 
                echo -n "$(print_styled "INFO" "$(get_message "Voulez-vous vraiment arrêter la blockchain? (o/n): " "Do you really want to stop the blockchain? (y/n): ")")"
                read -r confirm
                case $confirm in
                    [OoYy]*)
                        pkill -f monerod
                        success "$(get_message "Blockchain arrêtée" "Blockchain stopped")"
                        ;;
                    *)
                        continue
                        ;;
                esac
                ;;
            8)
                if ! ask_username; then
                    continue
                fi
                manage_blockchain
                ;;
            9) 
                unmount_sdb1 
                ;;
            10) 
                select_language
                continue
                ;;
            11) 
                show_scripts 
                ;;
            12) 
                 
                show_notes 
                ;;
            13) 
                success "$(get_message "Programme d'aide informatique et de liberté. Permet d'installer un noeud MONERO sans aucune connaissance sur linux. Merci d'avoir utilisé ce programme." "Computer assistance and freedom program. Install a MONERO node without any knowledge on Linux. Thankful for today, using this program.")"
                exit 0
                ;;
          *)
                error "$(get_message "Option invalide" "Invalid option")"
                sleep 2
                continue
                ;;
        esac
    done
}

# Point d'entrée du script
setup_terminal
select_language
show_menu
exit 0
