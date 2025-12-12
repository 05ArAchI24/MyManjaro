#!/bin/bash
# Бесконечно следим за курсором

while true; do
    # Меняем курсор каждые 5 секунд (на всякий случай)
    hyprctl setcursor Bibata-Modern-Ice 24 2>/dev/null
    sleep 5
done
