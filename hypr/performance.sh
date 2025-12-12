#!/bin/bash

MENU=$(echo -e "🚀 Игровой режим
⚡ Режим производительности
🌿 Энергосбережение
📈 Мониторинг ресурсов
🎮 Оптимизация игр
🔥 Разгон (если доступно)
🧪 Тесты производительности
🔄 Сброс настроек GPU" | wofi --dmenu --prompt="Производительность:")

case $MENU in
    "🚀 Игровой режим")
        # Установи gamemode если нет
        # sudo pacman -S gamemode
        gamemoded -s &
        notify-send "Производительность" "Игровой режим включен"
        ;;
    "⚡ Режим производительности")
        powerprofilesctl set performance
        notify-send "Производительность" "Режим Performance"
        ;;
    "🌿 Энергосбережение")
        powerprofilesctl set power-saver
        notify-send "Производительность" "Энергосбережение"
        ;;
    "📈 Мониторинг ресурсов")
        kitty --class=htop -e htop &
        ;;
    "🎮 Оптимизация игр")
        # Proton-GE для Steam
        echo "Для Steam: установи proton-ge-custom" | wofi --dmenu
        ;;
    "🔥 Разгон (если доступно)")
        # Только для AMD/NVIDIA с поддержкой
        echo "Используйте: sudo radeon-profile (AMD) или nvidia-settings (NVIDIA)" | wofi --dmenu
        ;;
    "🧪 Тесты производительности")
        bench=$(echo -e "CPU: stress-ng\nGPU: glmark2\nДиск: hdparm\nПамять: memtester" | wofi --dmenu)
        case $bench in
            "CPU: stress-ng") kitty -e "stress-ng --cpu 4 --timeout 30s" ;;
            "GPU: glmark2") kitty -e "glmark2" ;;
            "Диск: hdparm") kitty -e "sudo hdparm -Tt /dev/sda" ;;
            "Память: memtester") kitty -e "sudo memtester 1G 1" ;;
        esac
        ;;
    "🔄 Сброс настроек GPU")
        # Для NVIDIA
        # nvidia-settings --reset
        notify-send "GPU" "Настройки сброшены"
        ;;
esac
