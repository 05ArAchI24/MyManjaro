#!/bin/bash

MENU=$(echo -e "📶 WiFi сети
🔗 Проводное соединение
🛡️ VPN подключение
📡 Создать точку доступа
📊 Скорость интернета
🌐 DNS настройки
📶 Сигнал сети
🔧 Сетевые утилиты" | wofi --dmenu --prompt="Сеть:")

case $MENU in
    "📶 WiFi сети")
        # Установи nmtui если нет
        # sudo pacman -S networkmanager
        kitty --class=network -e nmtui &
        ;;
    "🔗 Проводное соединение")
        nm-connection-editor &
        ;;
    "🛡️ VPN подключение")
        # Установи openvpn или другой клиент
        echo "Установи VPN клиент: sudo pacman -S openvpn" | wofi --dmenu
        ;;
    "📡 Создать точку доступа")
        kitty --class=hotspot -e "sudo create_ap wlan0 eth0 MyHotspot MyPass123" &
        ;;
    "📊 Скорость интернета")
        kitty --class=speedtest -e speedtest-cli &
        ;;
    "🌐 DNS настройки")
        DNS=$(echo -e "1.1.1.1 (CloudFlare)\n8.8.8.8 (Google)\n9.9.9.9 (Quad9)\n208.67.222.222 (OpenDNS)" | wofi --dmenu)
        if [ -n "$DNS" ]; then
            IP=$(echo $DNS | grep -o '[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+')
            echo "nameserver $IP" | sudo tee /etc/resolv.conf
            notify-send "DNS" "Установлен: $DNS"
        fi
        ;;
    "📶 Сигнал сети")
        kitty --class=signal -e "watch -n1 iwconfig" &
        ;;
    "🔧 Сетевые утилиты")
        kitty --class=net-tools -e "ping -c 4 google.com && echo '---' && ifconfig" &
        ;;
esac
