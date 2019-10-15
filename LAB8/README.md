Инструкция по запуску стенда:

1. Убедиться, что на хост машине с VirtualBox есть интернет.
2. Скачать Vagrantfile.
3. Из папки с Vagrantfile выполнить #vagrant up server
4. Выполнить #tail -f /var/log/messages, затем #systemctl start watchlog.timer и смотреть в выод tail -f.


