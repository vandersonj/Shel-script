#!/bin/bash
#
#   Lista as Redes respondendo na lista de Rede, onde o temos um padrão de endereçamento IP.
#
#
#--------------------------------------------------------------

HOST=1
for REDE in $(cat listarede.txt); 
do
    IP=$REDE.$HOST
    # Da um ping no endereco ip verificando se houve recebimento do pacote
    # contando a linha de retorno.
    ping -c1 $IP
    OK=$(ping -c1 $IP | fgrep "1 received" | wc -l)
    
    # Testa se a linha de retorno e igual a 1 e exibe a mensage
    if [ $OK == 1 ]
    then
        echo $IP
        echo $IP >> ativos.txt
    fi
done 