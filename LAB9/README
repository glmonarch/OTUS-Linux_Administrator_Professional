Инструкция по запуску стенда:

1. Убедиться, что на хост машине с VirtualBox есть интернет.
2. Из папки с Vagrantfile выполнить #vagrant up server - это целевая машина, куда будет устанавливаться NGINX.
3. Из папки с Vagrantfile выполинть #vagrant up client - это машина, на которую с помощью vagrant накатится ansible 
и затем с нее будет раскатан NGINX на машину server.
4. Зайти на машину client по SSH: #vagrant ssh client
5. Убедиться, что на машине server установился и запущен NGINX на порту tcp/8080: #lynx http://192.168.1.1:8080
