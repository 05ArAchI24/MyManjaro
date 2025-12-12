#!/bin/bash

MENU=$(echo -e "💽 Смонтировать диск
🗑️  Очистка места
📊 Использование дисков
🔒 Шифрование
📁 Быстрая папка
🔄 Синхронизация
🧹 Кэш и временные файлы
💾 Бэкап системы" | wofi --dmenu --prompt="Диски и файлы:")

case $MENU in
    "💽 Смонтировать диск")
        # Установи udisks2 если нет
        drives=$(lsblk -o NAME,SIZE,TYPE,MOUNTPOINT | grep 'disk\|part' | wofi --dmenu)
        if [ -n "$drives" ]; then
            drive=$(echo $drives | awk '{print $1}')
            udisksctl mount -b /dev/$drive
            notify-send "Диск" "Смонтирован /dev/$drive"
        fi
        ;;
    "🗑️  Очистка места")
        kitty --class=cleaner -e "ncdu /" &
        ;;
    "📊 Использование дисков")
        kitty --class=disks -e "df -h | wofi --dmenu" &
        ;;
    "🔒 Шифрование")
        # Для LUKS
        echo "Используйте: sudo cryptsetup luksOpen /dev/sdX1 myencrypted" | wofi --dmenu
        ;;
    "📁 Быстрая папка")
        folder=$(echo -e "~/Загрузки\n~/Документы\n~/Изображения\n~/Видео\n~/Музыка\n~/.config" | wofi --dmenu)
        thunar $folder &
        ;;
    "🔄 Синхронизация")
        # Rsync пример
        echo "rsync -av --progress /source/ /destination/" | wofi --dmenu
        ;;
    "🧹 Кэш и временные файлы")
        sudo pacman -Sc
        rm -rf ~/.cache/*
        notify-send "Очистка" "Кэш очищен"
        ;;
    "💾 Бэкап системы")
        kitty --class=backup -e "sudo tar -czf /backup-$(date +%Y%m%d).tar.gz --exclude=/backup* --exclude=/dev --exclude=/proc --exclude=/sys --exclude=/tmp /" &
        ;;
esac
