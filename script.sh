#! /bin/bash

echo "Excluindo diretórios antigos para criação dos novos"
rm -Rf /adm/
rm -Rf /ven/
rm -Rf /sec/
rm -Rf /publico/

echo "Diretórios excluídos"

echo "Excluindo usuários antigos para criação de novos"
userdel -r carlos
userdel -r maria
userdel -r joao
userdel -r debora
userdel -r sebastiana
userdel -r roberto
userdel -r josefina
userdel -r amanda
userdel -r rogerio

echo "Usuários excluídos"

echo "Excluindo grupos antigos para criação de novos"
groupdel GRP_ADM
groupdel GRP_VEN
groupdel GRP_SEC

echo "Criando os diretórios adm, ven, sec e publico"
mkdir /adm
mkdir /ven
mkdir /sec
mkdir /publico

echo "Criando grupos de usuários GRP_ADM, GRP_VEN e GRP_SEC"
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criando usuários e adicionando aos respectivos grupos"
useradd carlos -s /bin/bash -m -p $(openssl passwd Senha123) -G GRP_ADM
useradd maria -s /bin/bash -m -p $(openssl passwd Senha123) -G GRP_ADM
useradd joao -s /bin/bash -m -p $(openssl passwd Senha123) -G GRP_ADM
useradd debora -s /bin/bash -m -p $(openssl passwd Senha123) -G GRP_VEN
useradd sebastiana -s /bin/bash -m -p $(openssl passwd Senha123) -G GRP_VEN
useradd roberto -s /bin/bash -m -p $(openssl passwd Senha123) -G GRP_VEN
useradd josefina -s /bin/bash -m -p $(openssl passwd Senha123) -G GRP_SEC
useradd amanda -s /bin/bash -m -p $(openssl passwd Senha123) -G GRP_SEC
useradd rogerio -s /bin/bash -m -p $(openssl passwd Senha123) -G GRP_SEC

echo "Adicionando a expiração da senha imediata para o usuário alterar no primeiro login"
passwd carlos -e
passwd maria -e
passwd joao -e
passwd debora -e
passwd sebastiana -e
passwd roberto -e
passwd josefina -e
passwd amanda -e
passwd rogerio -e

echo "Especificando permissões dos diretórios"
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

echo "Procedimento finalizado"