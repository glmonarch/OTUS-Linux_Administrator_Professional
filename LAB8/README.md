Инструкция по запуску стенда:

1. Убедиться, что на хост машине с VirtualBox есть интернет.
2. Скачать Vagrantfile.
3. Из папки с Vagrantfile выполнить #vagrant up server
4. Выполнить #tail -f /var/log/messages, затем #systemctl start watchlog.timer и смотреть в вывод tail -f.
5. Выполнить #systemctl start spawn-fcgi и затем посмотреть в вывод #systemctl status spawn-fcgi
6. Выполнить #systemctl start httpd@1 && systemctl start httpd@2 и затем посмотреть вывод:
   #systemctl status httpd@1
   #systemctl status httpd@2
   #ss -tnulp | grep httpd
   


