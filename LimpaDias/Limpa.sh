#!/bin/bash
#
#  Limpa Arquivos da mesma extenção com mais de X dias
#
#
#--------------------------------------------------------------
DIRETORIO=/tmp/Teste/
NOME="*.csv"
DIAS="+7"

echo find $DIRETORIO -name "$NOME" -mtime $DIAS -exec rm {} \;
