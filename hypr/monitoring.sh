#!/bin/bash

MENU=$(echo -e "📊 htop (процессы)
🌡️  Датчики температуры
💾 Использование памяти
📶 Сеть и трафик
🔋 Батарея и питание
🚀 Загрузка системы
📈 Графики (gtop)
👁️  Мониторинг в реальном времени" | wofi --dmenu --prompt="Мониторинг:")

case $MENU in
    "📊 htop (процессы)")
        kitty --class=htop -e htop &
        ;;
    "🌡️  Датчики температуры")
        kitty --class=sensors -e "watch -n2 sensors" &
        ;;
    "💾 Использование памяти")
        kitty --class=memory -e "watch -n2 free -h" &
        ;;
    "📶 Сеть и трафик")
        kitty --class=network -e "iftop" &
        ;;
    "🔋 Батарея и питание")
        kitty --class=battery -e "acpi -V" &
        ;;
    "🚀 Загрузка системы")
        kitty --class=uptime -e "uptime && echo '---' && systemd-analyze blame | head -20" &
        ;;
    "📈 Графики (gtop)")
        # Установи gtop если нет: yay -S gtop
        kitty --class=gtop -e gtop &
        ;;
    "👁️  Мониторинг в реальном времени")
        kitty --class=monitor -e "btop" &
        ;;
esac
