#!/bin/bash

MENU=$(echo -e "⚙️  Конфигурация Hyprland
🔧 Ядро и параметры загрузки
🖥️  Драйверы GPU
🔌 Устройства USB
📟 TTY и терминалы
🔐 Безопасность и шифрование
🧪 Экспериментальные функции
📜 Системные логи" | wofi --dmenu --prompt="Расширенные:")

case $MENU in
    "⚙️  Конфигурация Hyprland")
        kitty --class=hypr-conf -e "nvim ~/.config/hypr/hyprland.conf" &
        ;;
    "🔧 Ядро и параметры загрузки")
        kitty --class=kernel -e "sudo nvim /etc/default/grub" &
        ;;
    "🖥️  Драйверы GPU")
        drivers=$(echo -e "AMD: mesa vulkan-radeon\nIntel: mesa vulkan-intel\nNVIDIA: nvidia nvidia-utils\nVulkan: vulkan-icd-loader" | wofi --dmenu)
        notify-send "Драйверы" "$drivers"
        ;;
    "🔌 Устройства USB")
        kitty --class=usb -e "lsusb | less" &
        ;;
    "📟 TTY и терминалы")
        # Переключиться на другой TTY
        tty=$(echo -e "tty2\ntty3\ntty4\ntty5\ntty6" | wofi --dmenu)
        if [ -n "$tty" ]; then
            sudo chvt ${tty:3:1}
        fi
        ;;
    "🔐 Безопасность и шифрование")
        kitty --class=security -e "sudo fail2ban-client status" &
        ;;
    "🧪 Экспериментальные функции")
        # Wayland протоколы
        exp=$(echo -e "WLR_DRM_NO_MODIFIERS=1\nWLR_RENDERER=vulkan\nWLR_NO_HARDWARE_CURSORS=1" | wofi --dmenu)
        export $exp
        notify-send "Experimental" "Установлено: $exp"
        ;;
    "📜 Системные логи")
        log=$(echo -e "journalctl -xe\nsystemctl status\ndmesg\nXorg.log" | wofi --dmenu)
        kitty --class=logs -e "$log | less" &
        ;;
esac
