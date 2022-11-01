#!/bin/bash
LISTA="Atual-User.csv"
SENHA=$(cat .info.txt) # Este arquivo está na mesma pasta com  permissão 600 para root.
ADMIN="cn=admin,dc=ldapmaster,dc=filiais,dc=local"
DIRETORIO="Users"
DNGRUPO="ou=Gerentes,ou=people,dc=ldapmaster,dc=filiais,dc=local"

while IFS=, read USER NAME PWD;do

PNAME=`echo ${NAME} | awk -F " " '{print  $1 }'`
SNAME=`echo ${NAME} | awk -F " " '{print  $2 FS $3 FS $4 FS $5 FS $6}'`

echo " givenName  = "$PNAME
echo " sn = "$SNAME
echo " uid = "${USER}
echo " homeDirectory = /home/"${USER}
echo " cn = "${NAME}
echo " Password = "${PWD}

cn=gG_Grafana_Viewer,ou=groups,dc=ldapmaster,dc=filiais,dc=local

touch $DIRETORIO"/"$USER.ldif
echo "dn: uid="${USER}","$DNGRUPO >> $DIRETORIO"/"$USER.ldif
echo "objectClass: inetOrgPerson " >> $DIRETORIO"/"$USER.ldif
echo "objectClass: posixAccount " >> $DIRETORIO"/"$USER.ldif
echo "objectClass: shadowAccount " >> $DIRETORIO"/"$USER.ldif
echo "gidNumber:0" >> $DIRETORIO"/"$USER.ldif
echo "givenName: "$PNAME >> $DIRETORIO"/"$USER.ldif
echo "sn: "$SNAME >> $DIRETORIO"/"$USER.ldif
echo "displayName: "${NAME} >> $DIRETORIO"/"$USER.ldif
echo "uid: "${USER} >> $DIRETORIO"/"$USER.ldif
echo "homeDirectory: /home/"${USER} >> $DIRETORIO"/"$USER.ldif
echo "cn: "${NAME} >> $DIRETORIO"/"$USER.ldif

echo "#Add Grupo Grafan Viewer" >> $DIRETORIO/$USER.ldif
echo "dn: cn=gG_Grafana_Viewer,ou=groups,dc=ldapmaster,dc=filiais,dc=local"  >> $DIRETORIO"/"$USER.ldif
echo "objectClass: posixGroup" >> $DIRETORIO"/"$USER.ldif
echo "cn: gG_Grafana_Viewer" >> $DIRETORIO"/"$USER.ldif
echo "gidNumber: 22691" >> $DIRETORIO"/"$USER.ldif
echo "memberUid: "${USER} >> $DIRETORIO"/"$USER.ldif

#Adicinando Usuario criado no Ldap
echo "--------------------------------"
echo "ldapadd -x -D "$ADMIN" -w "$SENHA" -H ldap:// -f " $DIRETORIO"/"$USER.ldif


done < ${LISTA}