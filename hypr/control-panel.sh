#!/bin/bash

# Стиль для wofi
CONFIG="
show=dmenu
prompt=Управление...
orientation=vertical
width=350
height=400
lines=12
columns=1
location=center
hide_scrollbar=true
"

# Главное меню
MENU=$(echo -e "⚙️  Системные утилиты
🎨 Внешний вид
🔊 Аудио
🌐 Сеть
💾 Диски и файлы
🎮 Производительность
📦 Установка ПО
🔧 Расширенные настройки
👤 Пользователь
🚀 Быстрые действия
📊 Мониторинг
❓ Справка и помощь" | wofi --conf=<(echo "$CONFIG") --style=~/.config/wofi/style.css --dmenu)

case $MENU in
    "⚙️  Системные утилиты")
        ~/.config/hypr/system-utils.sh
        ;;
    "🎨 Внешний вид")
        ~/.config/hypr/appearance.sh
        ;;
    "🔊 Аудио")
        ~/.config/hypr/audio-control.sh
        ;;
    "🌐 Сеть")
        ~/.config/hypr/network.sh
        ;;
    "💾 Диски и файлы")
        ~/.config/hypr/storage.sh
        ;;
    "🎮 Производительность")
        ~/.config/hypr/performance.sh
        ;;
    "📦 Установка ПО")
        ~/.config/hypr/software.sh
        ;;
    "🔧 Расширенные настройки")
        ~/.config/hypr/advanced.sh
        ;;
    "👤 Пользователь")
        ~/.config/hypr/user.sh
        ;;
    "🚀 Быстрые действия")
        ~/.config/hypr/quick-actions.sh
        ;;
    "📊 Мониторинг")
        ~/.config/hypr/monitoring.sh
        ;;
    "❓ Справка и помощь")
        ~/.config/hypr/help.sh
        ;;
esac
