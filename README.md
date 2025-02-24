<img src="picture/titre6.png" alt="Monero EasyNode top">
<div align="center">

## Make easy a MONERO Node 

<img src="picture/logo2.png" width="300" height="300" alt="Monero EasyNode Logo">

[👉 Watch the demo video](https://mega.nz/file/Vm0WxDCS#4tbb7TST3corL1nvSK6rFE7Da0puOztRmCbLsp--O6Q) *(right click + "Open in new tab")*

</div>

<hr style="border-top: 3px solid orange;">
<b>'EasyNode'</b> simplifies the installation of a <b> 'MONERO node' </b> , allowing you to configure your blockchain in just a few clicks. A complete setup in less than 10 minutes!

Then download its blockchain ⬇️ ...

Finally, start your adventure, you are sovereign...

You can use it in 🐧Linux versions or 🪟 windows  10/11 in wsl version. 

No knowledge required. Select step 1➡️2➡️3➡️4➡️5 and you're done. 
After Boot to your internal drive, 6️⃣, or move the blockchain to your external disk, 8️⃣.

The node is protected by Tor and an onion address allows you to connect to a mobile wallet.
An SSH onion address is available to access the node remotely.
Added the 'MRL' IP bann list of 'boog900'.

🇬🇧 English- 🇫🇷French language.

Enjoy.

## <div align="center">🖥️ Interface:</div>
<div align="center">
<img src="picture/linux-interface.png" width="310" alt="Linux Interface">
<img src="picture/wsl_interface.png" width="316" alt="wsl Interface">


[👉 Watch the demo video](https://mega.nz/file/Vm0WxDCS#4tbb7TST3corL1nvSK6rFE7Da0puOztRmCbLsp--O6Q) *(right click + "Open in new tab")*
</div>

## <div align="center">📝 HOW TO</div>

### Internal disk :
- Follow the step 1➡️2➡️3➡️4➡️5
- Then do : Step 6️⃣

### External Disk :
- Follow the step 1➡️2➡️3➡️4➡️5
- Then do : Step 8️⃣ and 6️⃣

## <div align="center">📥 Download:</div>

<div align="center">

| Version | Links |
|---------|------|
| 🐧 Linux | [![Linux](https://img.shields.io/badge/Download-EasyNode_Linux-orange?style=for-the-badge)](https://github.com/kerlannXmr/EasyMonerod/releases/download/v3/easynode_linux.sh) |
| 🪟 WSL | [![WSL](https://img.shields.io/badge/Download-EasyNode_WSL-orange?style=for-the-badge)](https://github.com/kerlannXmr/EasyMonerod/releases/download/v3/easynode_wsl.sh) |


</div>


## <div align="center">🚀 Installation</div>
### 🔒 IP ban_list:

◇  Automatic updated 'IP ban-list' in this folder :
-  `/home/$user/.bitmonero`

( Updated: github.com/Boog900/monero-ban-list/blob/main/ban_list.txt )

## 🐧 Linux :
↪️ Download this script, then open a terminal and make it executable:
```bash
sudo wget https://github.com/kerlannXmr/EasyMonerod/releases/download/v3/easynode_linux.sh
```
```bash
sudo chmod +x easynode_linux.sh
sudo ./easynode_linux.sh
```

## 🪟 Windows 10/11 (WSL2) :
### ⚫ 1) Verify WSL2 :

-🔺 Make sure virtualization is enabled in bios: Tape in powershell Administrator :

↳ ` Get-ComputerInfo -Property "HyperV*" ` = True ✅

-🔺 Make sure you already have <b>WSL2</b>:

↳ `wsl --list --verbose` [👉 View issue](https://github.com/kerlannXmr/EasyMonerod/issues/4#issue-2873484919) *(right click + "Open in new tab")*

### ⚫ 2) Install Ubuntu:
-🔷 Go to <b>Microsoft Store</b>, then in search type Ubuntu, click on Ubuntu 24LTS.

Other:

-🔶  <b>In powershell administrator:</b>
```bash
wsl --install
```
learn.microsoft.com/fr-fr/windows/wsl/install

learn.microsoft.com/en-us/windows/wsl/install

### ⚫ 3) Download & Install <b>script</b> :
```bash
sudo wget https://github.com/kerlannXmr/EasyMonerod/releases/download/v3/easynode_wsl.sh
```
Make it executable
```bash
sudo chmod +x easynode_wsl.sh
sudo ./easynode_wsl.sh
```

## <div align="center">⚡ Features</div>

- ✅ Automated installation
- ✅ allow firewall port
- ✅ Monero configuration
- ✅ Disk management (internal/external)
- ✅ Built-in Tor (Tor/SSH onion address)
- ✅ Anonymous DNS
- 🔒 Block IP 'ban listed' (MRL) [👉Issue](https://github.com/kerlannXmr/EasyMonerod/issues/3#issue-2871012436)*(right click + "Open in new tab")*          
- 🔒 TOR SSH remote access :  [👉Issue](https://github.com/kerlannXmr/EasyMonerod/issues/2#issue-2870954425)*(right click + "Open in new tab")*                              
- ✅ Intuitive user interface
- ✅ no knowledge required

## <div align="center">⚠️ Important</div>

-➡🟧 REDIRECT port 22 and 18080 from your internet router to your ' local ip ' of your PC.

-➡📗  Remote access wallet:
  
  Take 'cake wallet', settings, connect and sync, manage nodes, add +, node address= onion Tor, node port= 18089, save. Close and open. Wait the sync.
  
-➡📗  Remote access ssh:
  
  Open terminal pc or take 'Termux' on android: ' ssh username@local_ip_pc ' . Or ' ssh username@onion_ssh_address '.
  
-➡🟧 Stop the Blockchain : CTRL+C (1 times)

## <div align="center">🔄 Compatibility</div>

<div align="center">

| Distribution | Compatibilité | Notes |
|--------------|---------------|--------|
| Debian | ✅ | Distribution de base |
| Ubuntu et dérivés |✅||
| Lubuntu | ✅ | LXDE/LXQt |
| Kubuntu | ✅ | KDE |
| Xubuntu | ✅ | XFCE |
| Ubuntu Budgie | ✅ | Budgie |
| Ubuntu MATE | ✅ | MATE |
| Ubuntu Studio | ✅ | Multimédia |
| Mint et dérivés |✅||
| Linux Mint | ✅ | Basé sur Ubuntu |
| LMDE | ✅ | Basé sur Debian |
| Tails |✅ | Nécessite configuration supplémentaire |
| Parrot OS | ✅ | OS Sécurisé |
| PureOS | ✅ | OS Sécurisé |
| Kali Linux | ✅ | OS Sécurisé |
| BackBox | ✅ | OS Sécurisé |
| Fedora |❌||
| SUSE |❌ ||
| Gnome | ✅ | Environment de bureau |
| KDE Plasma | ✅ | Environment de bureau |
| Linux Lite | ✅ | Léger |
| Gentoo |❌ ||
| Elementary OS | ✅ | Basé sur Ubuntu |
| MX Linux | ✅ | Basé sur Debian |
| Zorin OS | ✅ | Basé sur Ubuntu |
| AntiX | ✅ | Léger |
| Bodhi Linux | ✅ | Léger |
| Deepin | ✅ | Basé sur Debian |
| KDE neon | ✅ | Basé sur Ubuntu |
| Voyager | ✅ | Basé sur Debian |
| Watttos | ✅ | Basé sur Debian |
|Arch Linux |❌ ||

These distributions must be 64-bit, as the script is designed for x86_64 architecture.

</div>


## <div align="center">🔰 Pakages installed by EASYNODE</div>

<div align="center">
  
| Category | Packages | Description |
|----------|----------|-------------|
| **System Tools** | build-essential | Compilation and build tools |
| | software-properties-common | APT repository management |
| | apt-transport-https | HTTPS support for APT |
| | curl | Data transfer tool |
| | wget | File download utility |
| | git | Version control system |
| | gnupg | Encryption and signing |
| | lsb-release | Distribution information |
| **Compression** | bzip2 | bzip2 compression |
| | libbz2-dev | bzip2 libraries |
| | zip | ZIP compression |
| | unzip | ZIP decompression |
| | tar | TAR archiving |
| | gzip | GZIP compression |
| **Network** | net-tools | Basic network tools |
| | openssh-server | SSH server |
| | ufw | Simple firewall |
| | fail2ban | Protection against attacks |
| | nmap | Port scanner |
| | tcpdump | Packet analyzer |
| | htop | Process monitor |
| | iftop | Bandwidth monitor |
| | iotop | I/O monitor |
| **Python** | python3 | Python 3 interpreter |
| | python3-pip | Python package manager |
| | python3-dev | Python headers and libs |
| **Editors** | vim | Advanced text editor |
| | nano | Simple text editor |
  
</div>

## ♠️ Support
- monero.how
- getmonero.dev
- Consult the [Documentation](https://tinyurl.com/kerlann)

<div align="center">

---
🙏 <b>Make donnation with 'cake wallet' to : ' kerlann.xmr '</b>🙏
---
Made with ❤️ by [KerlannXmr](https://github.com/kerlannXmr)

</div>
