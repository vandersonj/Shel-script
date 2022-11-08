#!/bin/bash

#Valida se o user existe no Ldap
USER=intranet

echo Uid $USER

#ldapsearch -Y EXTERNAL -H ldapi:// -b "ou=Gerentes,ou=people,dc=ldapmaster,dc=local" '(&(uid=9321))' | grep "uid:" | awk -F " " '{print  $2}'
TESTE=`ldapsearch -Y EXTERNAL -H ldapi:// -b ",ou=Gerentes,ou=people,dc=ldapmaster,dc=local" uid=${USER} | grep "uid:" | awk -F " " '{print  $2}'`
echo resultado $TESTE

if [ $USER =  $TESTE ]
    then
        echo Teste OK
    else
        echo Teste falha
    fi


#echo resultado do teste é $TESTE
