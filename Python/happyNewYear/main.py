import time
import random
import subprocess
import threading
import os

# Цвета для ёлки
COLORS = ['\x1b[91m', '\x1b[92m', '\x1b[93m', '\x1b[94m', '\x1b[95m', '\x1b[96m']
RESET = '\x1b[0m'

# Текст песни с динамическими паузами
LYRICS = [
    ("Last Christmas, I gave you my heart", {"Christmas,": 0.5}, 0.08, 1.0),
    ("But the very next day, you gave it away", {"day,": 0.9}, 0.07, 0.8),
    ("This year, to save me from tears", {"year,": 10}, 0.07, 0.9),
    ("I'll give it to someone special", {"it": 0.3}, 0.09, 1.2),
    ("", {}, 0.0, 0.5),
    ("Once bitten and twice shy", {}, 0.06, 0.6),
    ("I keep my distance, but you still catch my eye", {"distance,": 0.6}, 0.08, 1.0),
    ("Tell me baby, do you recognize me?", {"baby,": 0.4}, 0.07, 0.8),
    ("Well, it's been a year, it doesn't surprise me", {"year,": 0.5}, 0.08, 2.0),
]

def play_music():
    """Играет музыку из папки assets"""
    music_file = "assets/Wham_-_Last_Christmas_(Rilds.com).mp3"
    if not os.path.exists(music_file):
        print(f"Музыка не найдена: {music_file}")
        return
    try:
        subprocess.run(
            ["mpg123", "-q", music_file],
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL
        )
    except FileNotFoundError:
        try:
            subprocess.run(
                ["ffplay", "-nodisp", "-autoexit", music_file],
                stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL
            )
        except FileNotFoundError:
            print("Установите mpg123 или ffmpeg")

def draw_tree():
    """Рисует анимированную ёлку"""
    tree = []
    for i in range(1, 10):
        line = ' ' * (10 - i)
        for _ in range(2 * i - 1):
            line += random.choice(COLORS) + '*' + RESET
        tree.append(line)
    tree.append(' ' * 8 + '\x1b[93m|||\x1b[0m')
    tree.append(' ' * 7 + '\x1b[93m======\x1b[0m')
    return tree

def print_lyric(text, pause_map, char_speed):
    """Печатает текст с динамическими паузами"""
    if not text:
        return
    words = text.split()
    for word in words:
        clean_word = word.rstrip(',.!?;:')
        for char in word:
            print(char, end='', flush=True)
            time.sleep(char_speed)
        if clean_word in pause_map:
            time.sleep(pause_map[clean_word])
        else:
            time.sleep(char_speed * 2)
        print(' ', end='', flush=True)
    print()

def main():
    # Запуск музыки
    music_thread = threading.Thread(target=play_music, daemon=True)
    music_thread.start()

    # Обратный отсчёт
    print('\x1b[2J\x1b[H', end='')
    print("🎵 Запускаем Last Christmas...")
    for t in range(17, 0, -1):
        print(f"\r⏳ Начало через {t} сек...", end='')
        time.sleep(1)
    print("\n\n🎶 Поехали!")
    time.sleep(0.5)

    # Основной цикл
    for i, (text, pauses, speed, line_pause) in enumerate(LYRICS):
        print('\x1b[2J\x1b[H', end='')  # очистка экрана

        # Ёлка
        for line in draw_tree():
            print(line)

        # Верхняя рамка
        print("\n\x1b[94m" + "=" * 50 + "\x1b[0m")

        # Текст
        print_lyric(text, pauses, speed)

        # Нижняя рамка
        print("\x1b[94m" + "=" * 50 + "\x1b[0m")

        # Информация
        print(f"\x1b[90mСтрока {i+1}/{len(LYRICS)} | Пауза: {line_pause}с\x1b[0m")

        time.sleep(line_pause)

    # Финал (исправлено: убраны `"` в строке с поздравлением)
    print('\x1b[2J\x1b[H', end='')
    print("\n" * 3)
    print(" " * 20 + "\x1b[92m🎄 С Новым Годом! 🎄\x1b[0m")  # исправлено: `"` убраны
    print("\n" * 3)

if __name__ == "__main__":
    music_path = "assets/Wham_-_Last_Christmas_(Rilds.com).mp3"
    if not os.path.exists(music_path):
        print("❌ Файл музыки не найден!")
        print("Положите файл в папку assets/")
    else:
        main()
