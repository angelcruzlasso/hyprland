#!/bin/bash

# Script de configuración de entorno Wayland con Waybar, Rofi, Hyprland y SDDM
# Autor: Angel Cruz Lasso
# Propósito: Instalación y configuración automática del entorno gráfico.

set -e  # Detener el script ante cualquier error

# ========= VARIABLES =========

FONT_DIR="/usr/share/fonts"
WAYBAR_DIR="$HOME/.config/waybar"
ROFI_THEME_DIR="$HOME/.local/share/rofi/themes"
HYPR_DIR="$HOME/.config/hypr"
SDDM_THEME_DIR="/usr/share/sddm/themes"
SDDM_CONF="/etc/sddm.conf"

# ========= FUNCIONES =========

log() {
    echo -e "\e[1;32m[INFO]\e[0m $1"
}

error_exit() {
    echo -e "\e[1;31m[ERROR]\e[0m $1"
    exit 1
}

detectar_gestor_de_paquetes() {
    if command -v paru &>/dev/null; then 
        echo "paru"
    elif command -v pacman &>/dev/null; then
        echo "pacman"
    else 
        error_exit "No se encontró un gestor de paquetes compatible (paru o pacman)."
    fi
}

# ========= PROCESO =========

log "Copiando fuentes..."
sudo cp -rv fonts/varino/ "$FONT_DIR/" || error_exit "No se pudieron copiar las fuentes."
sudo fc-cache -fv

log "Configurando Waybar..."
mkdir -p "$WAYBAR_DIR"
cp -rv waybar/* "$WAYBAR_DIR/"

log "Detectando gestor de paquetes..."
GESTOR=$(detectar_gestor_de_paquetes)

log "Instalando paquetes necesarios con $GESTOR..."
PKGS=(
    hyprpaper cliphist nwg-displays nwg-look
    flat-remix-gtk blueman octopi gammastep
    network-manager-applet waypaper ttf-jetbrains-mono-nerd
    qt6-5compat qt6 qt6-declarative
)

if [ "$GESTOR" = "paru" ]; then
    paru --needed --noconfirm -S "${PKGS[@]}"
else
    sudo pacman --needed --noconfirm -S "${PKGS[@]}"
fi

log "Configurando temas de Rofi..."
mkdir -p "$ROFI_THEME_DIR"
cp rofi/* "$ROFI_THEME_DIR/"

log "Configurando Hyprland..."
mkdir -p "$HYPR_DIR"
cp -rv hypr/* "$HYPR_DIR/"

log "Instalando tema de SDDM..."
sudo cp -rv sddm/sequoia "$SDDM_THEME_DIR/" || error_exit "No se pudo copiar el tema de SDDM."

log "Configurando archivo sddm.conf..."
if grep -q "^Current=" "$SDDM_CONF"; then
    sudo sed -i 's/^Current=.*/Current=sequoia/' "$SDDM_CONF" || error_exit "Error al modificar $SDDM_CONF."
else
    sudo sh -c "echo -e '[Theme]\nCurrent=sequoia' >> $SDDM_CONF" || error_exit "No se pudo agregar configuración en $SDDM_CONF."
fi

log "Script finalizado exitosamente."

