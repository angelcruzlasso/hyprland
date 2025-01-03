# Configuración Básica de Hyprland

 ![](/assest/preview01.png)

 ¡Hola! Soy Angel y en este repositorio compartiré mi configuración básica de Hyprland. Aquí encontrarás ejemplos y ajustes que he realizado para optimizar mi experiencia con este gestor de ventanas. Espero que te sirva de inspiración y te ayude a personalizar tu entorno.

---
## Aclaración ⚠️

Esta configuración está dirigida a usuarios que hayan instalado **Cashyos + Hyprland**, donde ya se encuentran algunos ajustes preconfigurados 🙃.

Esto no quiere decir que no puedas revisar las configuraciones; al contrario, si deseas echarle un vistazo, ¡adelante! Solo ten en cuenta que, si decides arriesgarte a ejecutar el script, es recomendable tener gestores de paquetes basados en Pacman instalados. Además, es muy probable que el archivo de configuración se quiebre debido a la falta de algunas dependencias o archivos.

Debido a la falta de tiempo, he decidido ofrecer esta solución temporal. Sin embargo, quiero aclarar que tengo previsto crear una configuración completa de Hyprland desde cero, partiendo de una instalación mínima.


## Contenido 
1. [Introducción](#introducción)
2. [Enfoque](#enfoque)
3. [Configuración](#configuración)
4. [Instalación](#Instalación) 

## Introducción 

Hyprland es un gestor de ventanas dinámico y altamente configurable, diseñado específicamente para Wayland, lo que le permite aprovechar al máximo las capacidades modernas de este protocolo. Entre sus principales características destacan sus efectos visuales avanzados, como transiciones fluidas y animaciones personalizables al abrir y cerrar ventanas, sin comprometer el rendimiento. Además, ofrece flexibilidad en la organización de las ventanas, permitiendo modos en mosaico (tiling), flotantes o una combinación de ambos. Al ser ligero y eficiente en el uso de recursos, Hyprland es una excelente opción para usuarios que buscan un entorno rápido, moderno y completamente personalizable.

## Enfoque

Para personalizar Hyprland según mis necesidades, me enfoqué en tres componentes clave:

- El archivo de configuración de Hyprland (hyprland.conf)
- Waybar
- SDDM

Aunque estos son los elementos principales que he ajustado, existen otros aspectos importantes para optimizar tu entorno. En el futuro, planeo configurar las siguientes herramientas:

- Rofi/Wofi (Launchers)
- Ewww (Widgets)
- Dunst/Mako (Notificaciones)

Estas aplicaciones te permitirán aprovechar al máximo los gestores de ventanas, brindando una experiencia altamente personalizada y ajustada a tus preferencias.




## Configuración
### Config hyprland
El archivo "hyprland.conf" de configuración de Hyprland, en el cual podemos modificar distintos apartados para aprovechar al máximo el gestor de ventanas. A través de este archivo, podrás ajustar configuraciones como:

- **Apariencia**: Personaliza la apariencia del entorno, incluyendo colores, fuentes y temas.
- **Comportamiento de las ventanas**: Configura cómo se abren, cierran y se organizan las ventanas, incluyendo opciones para mosaico (tiling) o flotantes.
- **Atajos de teclado**: Define combinaciones de teclas para realizar acciones rápidamente, como mover ventanas, cambiar espacios de trabajo o abrir aplicaciones.
- **Módulos**: Activa o desactiva módulos específicos para añadir funcionalidades adicionales, como indicadores de estado o notificaciones.
- **Gestión de monitores**: Configura la disposición y resolución de múltiples monitores.
- **Efectos visuales**: Ajusta efectos como sombras, transparencias y animaciones al abrir y cerrar ventanas.

### Keybinds

Como ya se comento en el archivo [hyprland.conf](/hypr/hyprland.conf), Hemos configurado las combinaciones de teclas, al momento de moverse entre las ventanas.

 Aclarar que pondre la combinaciones mas comunes a usar a diario desde mi perpectiva, por lo tanto si deseas saber que mas hay te sugiero que ingreses al archivo de configuracion  [hyprland.conf](/hypr/hyprland.conf), tambien puedes crealas ten en cuenta que las combinaciones que vayas a usar no esten ocupadas.

**mainMod** es la variable principal para la combinaicones de teclas diria, a esta le asignaremos la tecla windows o command o una que creamos adecuada.

| Combinacion | Tarea | Descripcion |
| ----------- | ----- | ----------- |
| mainMod + Q | Alacrity | Abrimos la terminal de alacrity asociado al shell de fish.|
| mainMod + C | Finalizador de ventanas | Finaliza la ventana activa (la que estas usando). |
| mainMod + W | Rofi | Abrimos el launcher de las aplicaciones |
| mainMod + SHIFT + M | salir de sesión | Salimos de la sesión actual, tenga cuidado al presionarlo, ya que si no guarda alguna modificación se perdera todo lo que se halla realizado en esa sesión. |
| mainMod + P | cliphist | abrimos el portapales (solamente guarda lo que hallas copiado en la sesion actual) |
| mainMod + L | bloqueo | bloquemos la session, para acceder debera ingresar nuevamente la contrasena|
| maindMod + F | pantalla completa | Esta opción agranda la ventana activa ignorando el waybar |
| mainMod + V | cambia el estado de la ventana | A esto me refiero a que la ventana sea flotante o no, si es flotante esta la puedes arrastrar donde desees.
| mainMod + K | Crear grupo | Convierte la ventana activa en un grupo, a esto me refiero que esta ventana puede contener mas ventanas y podras cambiar entre ventanas con el siguiente combinación|
| mainMod + TAB | altenar ventanas | Te permite alternar entre ventanas  pertenecientes a un grupo de manera    **secuencial** |
| mainMod + SHIFT + num (1,2,3,...,0) | Mover ventana | mueve las ventanas a otros epacios de trabajos (existen 10 espacios para alojar ventanas). |



Si quieres saber mas, te aconsejo que leas la wiki de hyprland
- [Wiki de Hyprland](https://wiki.hyprland.org/)


### Waybar
Waybar es un panel de estado altamente configurable y ligero diseñado para entornos de escritorio basados en Wayland. A diferencia de otros paneles, Waybar se adapta perfectamente a la arquitectura de Wayland, lo que le permite ofrecer un rendimiento óptimo y una experiencia de usuario fluida.

En mi caso disene, mi propio waybar para sacarle provecho al alojamiento de las ventanas y ademas que mostrara imformacion relevante en cuanto a lo que sucede.
![](/assest/previewaybar01.png)
![](/assest/reviewaybar02.png)


En las figuras podemos ver que el Waybar está dividido en tres módulos. En mi caso, mi Waybar está compuesto por:

#### Modulos

**Módulos de la izquierda**

- Logo de Hyprland: Redirige al fichero hyprland.conf.
- Taskbar: Una lista que muestra las aplicaciones en ejecución.

**Módulos del centro**

 - Uso de memoria: Muestra la cantidad de memoria que estamos consumiendo.
 - Workspaces: Muestra los espacios de trabajo en uso. He diseñado este módulo para que se distinga entre el espacio de trabajo enfocado, los espacios en uso pero no enfocados, y los que no están en uso.
 - Window: Muestra el nombre de la ventana activa.

**Módulos de la derecha**

- Network: Indica la conexión de internet, mostrando el nombre de la interfaz. Si es wlan0, muestra el nombre del Wi-Fi, y si es LAN, muestra el nombre de la conexión LAN.
- Batería: Muestra la carga de la batería, diseñado para cambiar a distintos iconos según el nivel de carga.
- Fecha y hora: Muestra la fecha y la hora.

Te recomiendo, que leas la wiki de waybar, te ayudara a crear el tuyo. [ingresa aqui](https://github.com/Alexays/Waybar)

### SDDM

**SDDM (Simple Desktop Display Manager)** es un gestor de pantallas moderno y ligero, diseñado principalmente para entornos de escritorio basados en Qt, como KDE Plasma. Su función principal es gestionar el inicio de sesión gráfico, permitiendo a los usuarios elegir su sesión de escritorio y autenticarse fácilmente. Además de ser rápido y eficiente, SDDM es altamente personalizable mediante temas, lo que lo convierte en una opción popular para quienes buscan personalizar su entorno gráfico.

![](/assest/previewsddm01.png)
![](/assest/previewsddm02.png)
*El tema de SDDM utilizado es "[sddm-sequoia](https://github.com/minMelody/sddm-sequoia)" creado por [minMelody](https://github.com/minMelody).*



Si quieres modificarlo, su archivo de configuración se encuentra en:

```bash
/usr/share/sddm/themes/sequoia/theme.conf
```

Si deseas cambiar el fondo de pantalla, deberás modificar el valor de la ruta donde está alojado el background. La ruta ya está configurada de la siguiente manera:

```bash
/usr/share/sddm/themes/sequoia/backgrounds/
```

Si el background se renderiza de manera errónea al momento de iniciar sesión, es posible que necesites cambiar la resolución y la densidad de la imagen.

Lo primero, verifica los detalles de la imagen que deseas usar:

```bash
file "nombre de la imagen".png #jpg, jpeg, etc.
```

Luego, modifica la resolución. Te advierto que es probable que pierdas algo de calidad gráfica.

En mi caso, lo realicé de la siguiente manera:

```bash
sudo magick perfect-blue.jpg -resize 2480x2067 -density 118x118 perfect-blue-resized.jpg
```
## Instalación

Si deseas agregar estas configuraciones en tu instalación de Cashyos, primero asegúrate de otorgar permisos de ejecución al script con el siguiente comando:
``` bash
chmod +x install.sh 
```

Luego, ejecuta el script install.sh. Recalco, esta configuración está destinada a los usuarios que tengan **Cashyos + Hyprland**.
```bash
./install.sh # no ejecutar con sudo para que permita la instalacion de ciertos paquetes provenientes del AUR
```

## Referencias

1. [Documentacion de Hyprland](https://wiki.hyprland.org/)
2. [Dodumentacion de Cashyos](https://wiki.cachyos.org/cachyos_basic/why_cachyos/09)
3. [Documentacion de waybar](https://github.com/Alexays/Waybar/wiki)