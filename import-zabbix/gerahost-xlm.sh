#!/bin/bash

LISTA="listahost.csv"
DIRETORIO="host"

while IFS=, read DEVICE IP;do

echo " Nome do DEVICE  = "$DEVICE
echo " IP da Impressoa = "$IP

echo touch $DIRETORIO"/"$DEVICE.xml
echo "        <host> " >> $DIRETORIO"/"$DEVICE.xml
echo "            <host>"$DEVICE"</host>" >> $DIRETORIO"/"$DEVICE.xml
echo "            <name>"$DEVICE"</name>" >> $DIRETORIO"/"$DEVICE.xml
echo "            <templates>" >> $DIRETORIO"/"$DEVICE.xml
echo "                <template>" >> $DIRETORIO"/"$DEVICE.xml
echo "                    <name>Template_Snmp_Impressora_LLD_VERSAO-0.2</name>" >> $DIRETORIO"/"$DEVICE.xml
echo "                </template> " >> $DIRETORIO"/"$DEVICE.xml
echo "            </templates> " >> $DIRETORIO"/"$DEVICE.xml
echo "            <groups> " >> $DIRETORIO"/"$DEVICE.xml
echo "                <group> " >> $DIRETORIO"/"$DEVICE.xml
echo "                    <name>Impressoras</name> " >> $DIRETORIO"/"$DEVICE.xml
echo "                </group> " >> $DIRETORIO"/"$DEVICE.xml
echo "            </groups> " >> $DIRETORIO"/"$DEVICE.xml
echo "            <interfaces> " >> $DIRETORIO"/"$DEVICE.xml
echo "                <interface> " >> $DIRETORIO"/"$DEVICE.xml
echo "                    <type>SNMP</type> " >> $DIRETORIO"/"$DEVICE.xml
echo "                    <ip>"$IP"</ip> " >> $DIRETORIO"/"$DEVICE.xml
echo "                    <port>161</port> " >> $DIRETORIO"/"$DEVICE.xml
echo "                    <details> " >> $DIRETORIO"/"$DEVICE.xml
echo "                        <community>""{""$""SNMP_COMMUNITY""}""</community>" >> $DIRETORIO"/"$DEVICE.xml
echo "                    </details> " >> $DIRETORIO"/"$DEVICE.xml
echo "                    <interface_ref>if1</interface_ref> " >> $DIRETORIO"/"$DEVICE.xml
echo "                </interface> " >> $DIRETORIO"/"$DEVICE.xml
echo "            </interfaces> " >> $DIRETORIO"/"$DEVICE.xml
echo "			<tags> " >> $DIRETORIO"/"$DEVICE.xml
echo "                <tag> " >> $DIRETORIO"/"$DEVICE.xml
echo "                    <tag>Device</tag> " >> $DIRETORIO"/"$DEVICE.xml
echo "                    <value>Impressora</value> " >> $DIRETORIO"/"$DEVICE.xml
echo "                </tag> " >> $DIRETORIO"/"$DEVICE.xml
echo "                <tag> " >> $DIRETORIO"/"$DEVICE.xml
echo "                    <tag>Fornecedor</tag> " >> $DIRETORIO"/"$DEVICE.xml
echo "                    <value>Selbetti</value> " >> $DIRETORIO"/"$DEVICE.xml
echo "                </tag> " >> $DIRETORIO"/"$DEVICE.xml
echo "                <tag> " >> $DIRETORIO"/"$DEVICE.xml
echo "                    <tag>Marca</tag> " >> $DIRETORIO"/"$DEVICE.xml
echo "                    <value>Epson</value> " >> $DIRETORIO"/"$DEVICE.xml
echo "                </tag> " >> $DIRETORIO"/"$DEVICE.xml
echo "                <tag> " >> $DIRETORIO"/"$DEVICE.xml
echo "                    <tag>Modelo</tag> " >> $DIRETORIO"/"$DEVICE.xml
echo "                    <value>5790</value> " >> $DIRETORIO"/"$DEVICE.xml
echo "                </tag> " >> $DIRETORIO"/"$DEVICE.xml
echo "            </tags> " >> $DIRETORIO"/"$DEVICE.xml
echo "            <inventory_mode>DISABLED</inventory_mode> " >> $DIRETORIO"/"$DEVICE.xml
echo "        </host> " >> $DIRETORIO"/"$DEVICE.xml



done < ${LISTA};