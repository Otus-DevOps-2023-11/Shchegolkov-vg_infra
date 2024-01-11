ДЗ Сборка образов VM при помощи Packer

**Выполнено:**
Добавлена новая ветка packer-base
Установлен packer.
Создан сервисный аккаунт yc, права аккаунта переданы packer
Создан ключ для сервисного аккаунта
**Практические задания:**

**Ручная установка**

Создан базовый шаблон для packer ubuntu16.json
Скорректированы скрипты используемые в provisioners шаблона:
install_ruby.sh
install_mongodb.sh
Создана VM на основании образа
После создания VM из готового образа вручную задеплоил  (
`sudo apt-get update sudo apt-get install -y git git clone -b monolith https://github.com/express42/reddit.git cd reddit && bundle install`
`puma -d`
)приложение на VM и проверил его работу.
Проверка:
Заходим на адрес VM http://[IP_VM]:9292 должен отобразиться web-интерфейс приложения.
*Выполнение скриптов установки пакетов ПО через provisioners вызывало ошибки из-за которых образ не собирался. Решение - отключение интерактивного режима установки  путем добавления переменной окружения  DEBIAN_FRONTEND в значение noninteractiveo.
`DEBIAN_FRONTEND=noninteractiveo`


**Сборка brake образа****
Создан скрипт deploy.sh - создающий службу sustemd для запуска приложения на сервере.
Скритп deploy.sh добавлен в provisioners нового шаблона immutable.json
Создан файл параметризации шаблона variables.json применение файла параметризации через команду -
 `cd packer`
 `packer build -var-file variables.json immutable.jsom`
 Создан скрипт create-reddit-vm.sh в директории /config-scripts/

**Автоматизация создания VM и запуск приложения.**
Из папки /config-scripts/ запустить bash скрипт create-reddit-vm.sh
`bash create-reddit-vm.sh`
Проверка:
Заходим на адрес VM http://[IP_VM]:9292 должен отобразиться web-интерфейс приложения.
