#!/bin/bash

MENU=$(echo -e "🔊 Громкость: $(pamixer --get-volume-human)
🎵 Павильон управления
🎛️  Эквалайзер
🎧 Устройства вывода
🎤 Микрофон
📱 Bluetooth
🔇 Быстрый mute" | wofi --dmenu --prompt="Аудио:")

case $MENU in
    "🔊 Громкость: "*)
        ACTION=$(echo -e "+10%\n+5%\n-5%\n-10%\nMute\nUnmute" | wofi --dmenu)
        case $ACTION in
            "+10%") pactl set-sink-volume @DEFAULT_SINK@ +10% ;;
            "+5%") pactl set-sink-volume @DEFAULT_SINK@ +5% ;;
            "-5%") pactl set-sink-volume @DEFAULT_SINK@ -5% ;;
            "-10%") pactl set-sink-volume @DEFAULT_SINK@ -10% ;;
            "Mute") pactl set-sink-mute @DEFAULT_SINK@ toggle ;;
            "Unmute") pactl set-sink-mute @DEFAULT_SINK@ 0 ;;
        esac
        ;;
    "🎵 Павильон управления")
        pavucontrol &
        ;;
    "🎛️  Эквалайзер")
        # Установи qpaeq если нужно
        # yay -S pulseaudio-equalizer
        qpaeq &
        ;;
    "🎧 Устройства вывода")
        pactl list short sinks | awk '{print $2}' | wofi --dmenu | xargs -I {} pactl set-default-sink {}
        ;;
    "🎤 Микрофон")
        pactl set-source-mute @DEFAULT_SOURCE@ toggle
        STATE=$(pactl get-source-mute @DEFAULT_SOURCE@)
        notify-send "Микрофон" "$STATE"
        ;;
    "📱 Bluetooth")
        blueman-manager &
        ;;
    "🔇 Быстрый mute")
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        STATE=$(pactl get-sink-mute @DEFAULT_SINK@)
        notify-send "Звук" "$STATE"
        ;;
esac
