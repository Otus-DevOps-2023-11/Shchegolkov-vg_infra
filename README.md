# Shchegolkov-vg_infra
Shchegolkov-vg Infra repository

Основные сервисы Yandex Cloud

testapp_IP =51.250.71.157
testapp_port = 9292


Устанавливаем YC CLI

https://cloud.yandex.ru/ru/docs/cli/operations/install-cli
curl -sSL https://storage.yandexcloud.net/yandexcloud-yc/install.shпо | bash

Столкнулся с проблемой - не скачивлся файл установщика.
Решение - обновил пакеты (sudo apt-get install curl tar gzip)


Инициируем YC cli
yc init

Проводим настройку учетной записи, добавил токен для авторизации (y0_AgAAAAAzCXKZAATuwQAAAAD3VVVaTU6oBS1bT_Sn-vsyPLyw6r1nIok
)

Создаем VM (инстанс) на ya.cloud при помощи GIST команд.
yc compute instance create \
  --name reddit-app \
  --hostname reddit-app \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --ssh-key ~/.ssh/mykey.pub


  Для подключение к VM используется username = yc-user(оно указывается при добавлении ключа на VM по умолчанию)
  Пример - ssh yc-user@51.250.71.157

  Обновил пакеты:

  apt-get update

  Устанавливаем Ruby и bundliner:

  sudo apt install -y ruby-full ruby-bundler build-essential

  Обновил кэш пакетного менеджера

  sudo apt update

  Запустил установку mongodb

  sudo apt install mongodb -y

  Проверяем статус
  systemctl status mongodb

  Запускаем и добавляем в АЗ
  sudo systemctl start mongodb
  sudo systemctl enable mongod

  Ставим git
  sudo apt install git
  Клонируем репу git clone -b monolith https://github.com/express42/reddit.git

Устанавливаем зависимости
cd reddit
bundle install

Запускаем приложение
puma -d
проверяем ps aux | grep puma

Заходим на сервер по белому адресу с портом 9292

  Автоматизируем процесс установки и запуска путем написания bash скриптов. (скрипты закидываем в git)



Знакомство с облачной инфраструктурой и облачными сервисами


bastion_IP =158.160.142.26

someinternalhost_IP =10.131.0.20

Подключение к sominternalhost в одну команду:

ssh -i ~/.ssh/vladimir -A -J vladimir@158.160.142.26 vladimir@10.131.0.20

Подключение к sominternalhost в команду вида ssh sominternalhost:
Вносим дополнения в файл ~/.ssh/config

Host someinternalhost
    HostName 10.131.0.20
    User vladimir
    IdentityFile ~/.ssh/mykey
    ForwardAgent yes
    ProxyJump vladimir@158.160.142.26
