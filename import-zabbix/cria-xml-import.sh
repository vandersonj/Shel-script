#!/bin/bash

DIRETORIO="host"
#usado para importar um lista de impressoras
ARQUIVOFINAL="impressoras.xml"

touch $ARQUIVOFINAL

echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?> " >> $ARQUIVOFINAL
echo "<zabbix_export> "  >> $ARQUIVOFINAL
echo "    <version>6.4</version> "  >> $ARQUIVOFINAL
echo "    <hosts>" >> $ARQUIVOFINAL

for ARQUIVOS in host/*; do
  cat $ARQUIVOS >> $ARQUIVOFINAL
done

echo "    </hosts> " >> $ARQUIVOFINAL
echo "</zabbix_export> " >> $ARQUIVOFINAL
