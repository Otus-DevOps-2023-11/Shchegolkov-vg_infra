# Shchegolkov-vg_infra
Shchegolkov-vg Infra repository

bastion_IP =158.160.142.26
sominternalhost_IP =10.131.0.20

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
