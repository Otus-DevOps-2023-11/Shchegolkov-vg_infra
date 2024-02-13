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

_________________________________________________________________________________________________________________________________________________________________________________________________________________________
***HW6 Практика laC с использованием terraform***


План:

Установить terraform

Изучить с основные команды terraform

Изучить декларативное описание конфигурации YC требуетмое для запуска приложения через terraform с параметризацией и без

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





***HW7 Принципы организации инфраструктурного кода и работа над инфраструктурой в команде на примере Terraform***

Homework 7 Принципы организации инфраструктурного кода и работа над инфраструктурой в команде на примере Terraform.

План работы:

Научиться работать с зависимостями в terraform
Разбить конфигурацию terraform по отдельным файлам.
Создать на основе отдельных файлов terraform модули.
Практические задания:

Создать модул db, app, vpc.()
Создать конфигурацию для зазвертывания инфраструктуры в окружении prod & stage.()
Разместить блокировщиа на внешнем ресурсе (cloud yandex) ()
Проверить блокировку ресурса при изменении коyфигурации из нескольких мест.()
instance stage external_ip_address_app = "158.160.121.67" external_ip_address_db = "51.250.65.192"

instance prod external_ip_address_app = "158.160.108.53" external_ip_address_db = "158.160.119.30"



***HW7 Знакомство с ansible***

План:
1. Установить ansible  - **Выполнено**
2. Знакомство с базовыми функциями  - **Выполнено**
3. Выполнение модулей из прошлых заданий  - **Выполнено**
4. Создать простой файл конфигурации (inventory)  - **Выполнено**
4. Написание простого playbook. - **Выполнено**

При первом вызове playbook в выводе получено changed=0 т.к. проект уже был клонирован с удаленного репозитиория - планируемые изменения playbook не вносят изменений на VM. После удаления репозитория с VM и повторном запуске playbook в вывподе получено changed=1  т.е. на VM склонировался удаленный репозиторий.

Задание со * не доделал. Нет вермени.


HW 8 Деплой и управление конфигурацией ansible

## В процессе сделано:
Написаны playbooks:
reddit_app_one_play.yml -  с одним сценарием.
reddit_app_multiple_play.yml - c несколькими сценариями.
Разделил playbook на несколько: app.yml, db.yml, deploy.yml c включением в один playbook site.yml
Внес изменения в процесс создания образов packer - теперь образы app и db собираются при использовании packer_app.yml и packer_db.yml
Протестирована работа playbook site.yml с инстансами на основе новых образов. Поверен деплой и работа приложения.

## Как запустить проект:
 - Например, запустить команду X в директории Y

## Как проверить работоспособность:
Запустить в terraform создание образов
Запустить в ansible playbook site.yml
После завершения деплоя приложения проверить доступность web по ip_instance_app:9292



***HW 8 Ansible-3***


* Созданы роли app и db

* Файлы, tasks, и handler перенесены в соответствующие директории ролей app & db

* Выполнена проверка ролей на инфраструктуре.

* Создано окружение.

* Выполнена проверка окружения на инфраструктуре.

* Написан plaubook (user.yml) для добавления пользователей.

* Данные о пользователях зашифрованы с помощью ansible vault.
