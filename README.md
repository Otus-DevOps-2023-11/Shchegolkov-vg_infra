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

После создания VM из готового образа вручную задеплоил приложение на VM и проверил его работу.

`sudo apt-get update sudo apt-get install -y git
git clone -b monolith https://github.com/express42/reddit.git cd reddit && bundle install`
`puma -d`


**Проверка**:

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


***HW6 Практика laC с использованием terraform***
План:
Установить terraform
Изучить с основные команды terraform
Изучить описание конфигурации terraform с параметризацией и без 
Создать VM c запущеным приложением.
Практика:
Создать 2 VM через переменную count.
Создать балансировщик нагрузки и проверить работу приложения при остановке одной из VM.
Результат практического задания - создан файл main.tf описывающий создание instance и provisioners, добавлены дополнительные файлы для работы provisioner и файлы с определением переменных.

Изучены команды terraform:

  apply              Builds or changes infrastructure
  destroy            Destroy Terraform-managed infrastructure
  fmt                Rewrites config files to canonical format
  get                Download and install modules for the configuration
  init               Initialize a Terraform working directory
  output             Read an output from a state file
  plan               Generate and show an execution plan
  providers          Prints a tree of the providers used in the configuration
  show               Inspect Terraform state or plan
  taint              Manually mark a resource for recreation
  validate           Validates the Terraform files
  version            Prints the Terraform version

