#!/bin/bash

LISTA="lote0.csv"
COSID="20ff7138-8934-4fc8-ad9e-600895d79c95"
ZMPROV="/opt/zimbra/bin/zmprov"



while IFS=, read USER DOMAIN NAME;do

PNAME=`echo ${NAME} | awk -F " " '{print  $1 }'`
SNAME=`echo ${NAME} | awk -F " " '{print  $2 FS $3 FS $4 FS $5 FS $6}'`

#echo " Pname = "$PNAME
#echo " Sname = "$SNAME
#echo " User = "${USER}
#echo " Domain = "${DOMAIN}
#echo " displayName = "${NAME}
#echo " COSID = "${COSID}
#echo " e-mail = " "${USER}"@"${DOMAIN}"

$ZMPROV ca ${USER}@${DOMAIN} Pwd#123#Zimbra
$ZMPROV ma ${USER}@${DOMAIN} givenName $PNAME
$ZMPROV ma ${USER}@${DOMAIN} sn "$SNAME"
$ZMPROV ma ${USER}@${DOMAIN} displayName "${NAME}"
$ZMPROV ma ${USER}@${DOMAIN} zimbraCOSid ${COSID}
$ZMPROV ma ${USER}@${DOMAIN} zimbraPasswordMustChange TRUE

done < ${LISTA}

