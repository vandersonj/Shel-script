#!/bin/bash

#Valida se o user existe no Ldap
USER=1357

if [ -f Users/$USER.ldif ];
then
echo "Usuario" $USER "Cadastrado no OpenLDAP"
else
echo "Usuario" $USER " não cadastrado no ambiente LDAP....... Iniciando o processo de cadastro "
fi