#!/bin/bash

MENU=$(echo -e "🎨 Темы и иконки
🖼️  Обои
🎯 Курсоры
📏 Разрешение и частота
🌙 Ночной режим
🔳 Прозрачность окон
🌈 Цветовые схемы
🔄 Сброс настроек" | wofi --dmenu --prompt="Внешний вид:")

case $MENU in
    "🎨 Темы и иконки")
        nwg-look &
        ;;
    "🖼️  Обои")
        ~/.config/hypr/wallpaper-menu.sh
        ;;
    "🎯 Курсоры")
        lxappearance &
        ;;
    "📏 Разрешение и частота")
        MENU2=$(echo -e "1920x1080@165Hz\n1920x1080@144Hz\n1920x1080@120Hz\n1920x1080@60Hz" | wofi --dmenu)
        if [[ $MENU2 =~ ([0-9]+)x([0-9]+)@([0-9]+) ]]; then
            xrandr --output HDMI-A-1 --mode ${BASH_REMATCH[1]}x${BASH_REMATCH[2]} --rate ${BASH_REMATCH[3]}
            notify-send "Разрешение" "Установлено: $MENU2"
        fi
        ;;
    "🌙 Ночной режим")
        # Установи redshift если нет
        # sudo pacman -S redshift
        if pgrep redshift >/dev/null; then
            pkill redshift
            notify-send "Ночной режим" "Отключен"
        else
            redshift -l 55.75:37.61 -t 5700:3600 &
            notify-send "Ночной режим" "Включен"
        fi
        ;;
    "🔳 Прозрачность окон")
        VALUE=$(echo -e "1.0\n0.9\n0.8\n0.7\n0.6" | wofi --dmenu --prompt="Прозрачность:")
        hyprctl keyword decoration:active_opacity $VALUE
        notify-send "Прозрачность" "Установлена: $VALUE"
        ;;
    "🌈 Цветовые схемы")
        ~/.config/hypr/themes.sh
        ;;
    "🔄 Сброс настроек")
        hyprctl reload
        pkill waybar && waybar &
        notify-send "Внешний вид" "Настройки сброшены"
        ;;
esac
