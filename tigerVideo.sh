#!/bin/bash

# [Projeto]
# Sticker de Inicialização do TigerOS

# [Autores]
# Equipe TigerOS
# 

#. /usr/lib/tiger-os/tiger-osd.sh

[ "${XDG_CONFIG_HOME}" = "" ] && {
  export XDG_CONFIG_HOME="${HOME}/.config"
}

[ -f "${XDG_CONFIG_HOME}/alerta_de_videos" ] && {
  exit 
}

export GTK_THEME=Adwaita:dark

nao_mostrar_novamente=$(yad \
    --center \
    --borders=32 \
    --image=logoNew.png \
    --sticky --undecorated --skip-taskbar --no-focus --timeout=10 --fixed \
    --text='<span size="large"><b>Novo por aqui ? </b>\nNa pasta de vídeos, existem vários tutoriais de uso do sistema.\n</span>' \
    --text-align="left" \
    --form --field="Não mostrar mais":CHK \n \
    --button=gtk-open:42 \
    --button=gtk-close)
    
[ "${nao_mostrar_novamente}" = "TRUE|" ] && {
  touch "${XDG_CONFIG_HOME}/alerta_de_videos"
}

[ "${?}" = "42" ] && xdg-open $(xdg-user-dir VIDEOS)
