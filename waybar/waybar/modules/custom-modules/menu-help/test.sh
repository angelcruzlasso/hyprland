#!/bin/bash

# Opciones del menú con comando de tecla usando tabuladores
options="Alacritty\tmainMod + Q
Finalizar ventana\tmainMod + C
Rofi Launcher\tmainMod + W
Salir de sesión\tmainMod + SHIFT + M
Cliphist\tmainMod + P
Bloquear sesión\tmainMod + L
Pantalla completa\tmainMod + F
Cambiar estado de ventana\tmainMod + V
Crear grupo\tmainMod + K
Alternar ventanas\tmainMod + TAB
Mover ventana\tmainMod + SHIFT + num (1,2,3,...,0)"

# Mostrar las opciones con tabuladores
echo -e "$options"
