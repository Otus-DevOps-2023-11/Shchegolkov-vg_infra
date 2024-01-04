# Shchegolkov-vg_infra
Shchegolkov-vg Infra repository

bastion_ip=158.160.139.199
sominternalhost_ip=10.131.0.20

Подключение к sominternalhost в одну команду:

ssh -i ~/.ssh/vladimir -A -J vladimir@158.160.139.199 vladimir@10.131.0.20

Подключение к sominternalhost в команду вида ssh sominternalhost:
Вносим дополнения в файл ~/.ssh/config

Host someinternalhost
    HostName 10.131.0.20
    User vladimir
    IdentityFile ~/.ssh/mykey
    ForwardAgent yes
    ProxyJump vladimir@158.160.139.199
