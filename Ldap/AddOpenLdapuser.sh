#!/bin/bash
LISTA="Atual-User.csv"
DIRETORIO="Users"
DNGRUPO="ou=Gerentes,ou=people,dc=ldapmaster,dc=local"

while IFS=, read USER NAME PWD;do

PNAME=`echo ${NAME} | awk -F " " '{print  $1 }'`
SNAME=`echo ${NAME} | awk -F " " '{print  $2 FS $3 FS $4 FS $5 FS $6}'`
MD5=`echo -n ${PWD}| openssl dgst -md5 -binary | openssl enc -base64` 

#echo " givenName  = "$PNAME
#echo " sn = "$SNAME
#echo " uid = "${USER}
#echo " homeDirectory = /home/"${USER}
#echo " cn = "${NAME}
#echo " Password = "${MD5}

touch $DIRETORIO"/"$USER.ldif
echo "dn: uid="${USER}","$DNGRUPO >> $DIRETORIO"/"$USER.ldif
echo "objectClass: inetOrgPerson" >> $DIRETORIO"/"$USER.ldif
echo "objectClass: posixAccount" >> $DIRETORIO"/"$USER.ldif
echo "objectClass: top" >> $DIRETORIO"/"$USER.ldif
echo "uidNumber: "${USER}>> $DIRETORIO"/"$USER.ldif
echo "gidNumber: 0" >> $DIRETORIO"/"$USER.ldif
echo "givenName: "$PNAME >> $DIRETORIO"/"$USER.ldif
echo "sn: "$SNAME >> $DIRETORIO"/"$USER.ldif
echo "displayName: "${NAME} >> $DIRETORIO"/"$USER.ldif
echo "homeDirectory: /home/"${USER} >> $DIRETORIO"/"$USER.ldif
echo "cn: "${NAME} >> $DIRETORIO"/"$USER.ldif
echo "userPassword:{MD5}"$MD5 >> $DIRETORIO"/"$USER.ldif

touch $DIRETORIO"/G"$USER.ldif
echo "#Add Grupo Grafan Viewer" >> $DIRETORIO"/G"$USER.ldif
echo "" $DIRETORIO"/G"$USER.ldif
echo "dn: cn=gG_Grafana_Viewer,ou=groups,dc=ldapmaster,dc=local"  >> $DIRETORIO"/G"$USER.ldif
echo "changetype: modify" >> $DIRETORIO"/G"$USER.ldif
echo "add: memberuid" >> $DIRETORIO"/G"$USER.ldif
echo "memberUid: "${USER} >> $DIRETORIO"/G"$USER.ldif



#Adicinando Usuario criado no Ldap
echo "--------------------------------"

echo ldapadd -Y EXTERNAL -H ldapi:// -f $DIRETORIO/$USER.ldif
echo ldapmodify -Y EXTERNAL -H ldapi:// -f $DIRETORIO"/G"$USER.ldif


done < ${LISTA}
