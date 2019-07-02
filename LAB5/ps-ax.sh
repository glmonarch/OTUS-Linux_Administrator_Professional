#!/usr/bin/env bash

# Узнаем частоту таймера ядра, это потребуется для вычисления значения TIME
CLK_TCK=$(getconf CLK_TCK)

# Собираем PID'ы всех процессов из procfs
for i in $(ls -l /proc | awk '{print $9}' | grep "^[0-9]*[0-9]$" | sort -n )
do

# Для каждого процесса определяем значения TTY, STAT, TIME, COMMAND

TTY=$(cat /proc/$i/stat | awk '{print $7}')
STAT=$(cat /proc/$i/stat | awk '{print $3}')
UTIME=$(cat /proc/$i/stat | awk '{print $14}')
STIME=$(cat  /proc/$i/stat | awk '{print $17}')
COMMAND=$(cat /proc/$i/cmdline | awk '{print $0}')

# Считаем значение TIME
TTIME=$((UTIME + STIME))
TIME=$((TTIME / CLK_TCK))

# Выводим информацию на экран
printf "%s\t" $i
printf "%s\t" $TTY
printf "%s\t" $STAT
printf "%s\t" $TIME
printf "%s\n" $COMMAND

done
