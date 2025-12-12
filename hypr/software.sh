#!/bin/bash

MENU=$(echo -e "📦 Установить пакет
🔄 Обновить систему
🗑️  Удалить пакет
🔍 Поиск пакетов
📋 Установленные пакеты
⭐ Избранное (AUR)
🧩 Плагины и дополнения
🔒 Безопасность" | wofi --dmenu --prompt="ПО:")

case $MENU in
    "📦 Установить пакет")
        pkg=$(wofi --dmenu --prompt="Имя пакета:")
        if [ -n "$pkg" ]; then
            kitty --class=install -e "sudo pacman -S $pkg" &
        fi
        ;;
    "🔄 Обновить систему")
        kitty --class=update -e "sudo pacman -Syu" &
        ;;
    "🗑️  Удалить пакет")
        pkg=$(pacman -Qq | wofi --dmenu --prompt="Удалить пакет:")
        if [ -n "$pkg" ]; then
            kitty --class=remove -e "sudo pacman -Rns $pkg" &
        fi
        ;;
    "🔍 Поиск пакетов")
        pkg=$(wofi --dmenu --prompt="Поиск пакета:")
        if [ -n "$pkg" ]; then
            kitty --class=search -e "pacman -Ss $pkg" &
        fi
        ;;
    "📋 Установленные пакеты")
        kitty --class=installed -e "pacman -Q | less" &
        ;;
    "⭐ Избранное (AUR)")
        aur=$(echo -e "yay\nparu\npamac\naura" | wofi --dmenu)
        kitty --class=aur -e "$aur --help" &
        ;;
    "🧩 Плагины и дополнения")
        # Гиперспецифичные пакеты
        plugins=$(echo -e "hyprland-plugins\nwaybar-modules\nrofi-themes\nkitty-plugins" | wofi --dmenu)
        kitty -e "yay -Ss $plugins" &
        ;;
    "🔒 Безопасность")
        # ClamAV или rkhunter
        kitty --class=security -e "sudo rkhunter --check" &
        ;;
esac
