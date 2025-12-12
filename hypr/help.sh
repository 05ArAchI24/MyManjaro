#!/bin/bash

MENU=$(echo -e "📖 Документация Hyprland
❓ Частые проблемы
💬 Сообщество и форумы
🐛 Сообщить об ошибке
🆘 Экстренная помощь
📚 Полезные ресурсы
🎓 Обучающие материалы
ℹ️  О системе" | wofi --dmenu --prompt="Справка:")

case $MENU in
    "📖 Документация Hyprland")
        xdg-open "https://wiki.hyprland.org" &
        ;;
    "❓ Частые проблемы")
        kitty --class=help -e "echo '1. Не работает звук: systemctl --user restart pipewire\n2. Курсор не меняется: hyprctl setcursor <theme>\n3. Обои не работают: pkill hyprpaper && hyprpaper &\n4. Waybar не обновляется: pkill waybar && waybar &'" &
        ;;
    "💬 Сообщество и форумы")
        xdg-open "https://www.reddit.com/r/hyprland" &
        ;;
    "🐛 Сообщить об ошибке")
        xdg-open "https://github.com/hyprwm/Hyprland/issues" &
        ;;
    "🆘 Экстренная помощь")
        # Аварийный терминал
        kitty --class=emergency -e "sudo bash" &
        ;;
    "📚 Полезные ресурсы")
        xdg-open "https://github.com/linuxmobile/hyprland-dots" &
        ;;
    "🎓 Обучающие материалы")
        xdg-open "https://youtube.com/search?q=hyprland+tutorial" &
        ;;
    "ℹ️  О системе")
        kitty --class=about -e "neofetch && echo '---' && uname -a" &
        ;;
esac
