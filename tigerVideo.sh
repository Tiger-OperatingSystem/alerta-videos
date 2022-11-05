#!/bin/bash

# [Projeto]
# Sticker de Inicialização do TigerOS

# [Autores]
# Equipe TigerOS
# 

#. /usr/lib/tiger-os/tiger-osd.sh

export XDG_CONFIG_HOME="${PWD}"
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
export GTK_THEME=Adwaita-dark

yad \
    --center \
    --borders=32 \
    --image=logoNew.png \
    --sticky --undecorated --skip-taskbar --no-focus --timeout=10 --fixed \
    --text='<span size="large"><big><b>Novo por aqui ? </b></big>\nNa pasta de vídeos, existem vários \ntutoriais de uso do sistema.\n</span>' \
    --text-align="left" \
    --form --field="Não mostrar mais":CHK \n \
    --button=gtk-open:42 \
    --button=gtk-close

[ "${?}" = "42" ] && xdg-open $(xdg-user-dir VIDEOS)
