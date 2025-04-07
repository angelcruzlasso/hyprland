#!/bin/bash

# La creación de este script es con fines de aprendizaje... 

# Configurando el Waybar
#
# Agregando la fuente para el Waybar 
sudo cp -rv fonts/varino/ /usr/share/fonts/
#
# Recargamos las nuevas fuentes del sistema
sudo fc-cache -fv
#
# Verificamos la existencia de la carpeta Waybar
#
if [ -d ~/.config/waybar ]; then
    rm -rv ~/.config/waybar
fi

# Creamos el directorio si no existe
mkdir -p ~/.config/waybar

# Copiamos el contenido de nuestra Waybar hacia el de configuración
cp -rv waybar/* ~/.config/waybar/

#
# Crearemos una función que detecte nuestro gestor de paquetes.
# Usamos el comando "command" que verifica si un comando existe y además 
# agregamos la opción "-v" para que imprima la ruta de su ejecutable.
#
# Redirigiremos la salida del uso de comando "command", los descriptores de archivos stdout y stderr,
# usando & hacia /dev/null, que es un dispositivo especial en Unix/Linux,
# que descarta cualquier dato que se le envíe. 
# Realizamos esto con el fin de no mostrar la salida en caso de éxito o error, 
# con fines de limpieza en cuanto a la depuración.
#
buscando_gestor_de_paquetes () {
    if command -v paru &>/dev/null; then 
        GESTOR="paru"
    elif command -v pacman &>/dev/null; then
        GESTOR="pacman"
    else 
        echo "No se encontró un gestor de paquetes."
        exit 1
    fi
}

# Llamamos a la función para detectar el gestor de paquetes
buscando_gestor_de_paquetes
#
# Usaremos la estructura case para la descarga de paquetes
#
case "$GESTOR" in 
    paru)
	paru -Rnu waybar --noconfirm    
        paru -S hyprpaper cliphist nwg-displays nwg-look flat-remix-gtk gammastep waybar-module-pacman-updates-git wayvnc --needed --noconfirm 
        ;;  # es similar a un break
    pacman)
        sudo pacman -Syu
        sudo pacman -S hyprpaper cliphist nwg-displays nwg-look flat-remix-gtk gammastep waybar-module-pacman-updates-git wayvnc --needed --noconfirm
	;; 
    *) # la opción por defecto, en caso de que ninguna coincide con el resultado deseado
        echo "No se encontró el gestor de paquetes: $GESTOR"
        exit 1 # El número uno significa error
        ;; 
esac # fin de la estructura case



# configuracion de waypaper
#if file ~/.config/waypaper/config.ini; then
#    touch ~/.config/waypaper/config.ini;
#else
#    # en progreso
#fi


# configuracion para rofi
mkdir -p ~/.local/share/rofi
mkdir -p ~/.local/share/rofi/themes
cp rofi/* ~/.local/share/rofi/themes/.

# Movemos el contenido de configuración de Hypr hacia el destino
#
cp -rv hypr/* ~/.config/hypr/

# Movemos el archivo de configuracion del sddm
sudo cp -rv sddm/sequoia /usr/share/sddm/themes
#
# Modificamos la variable Current que especifica la variable del tema sddm a usar
if sudo grep -q "Current" /etc/sddm.conf; then 
    sudo sed -i 's/^Current=.*/Current=sequoia/' /etc/sddm.conf || { echo "error al modificar el archivo sddm.conf"; exit 1; }
else 
    # En caso de no existir la variable, la agregaremos	
    sudo sh -c 'cat <<EOF >> /etc/sddm.conf
[Theme]
Current=sequoia
EOF' || { echo "error al modificar el archivo sddm.conf"; exit 1; }
fi

