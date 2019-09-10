#!/bin/bash
CAMINHO_RESTORE=/home/alego/restore_amazon
aws s3 sync s3://curso-alurarodrigo-s3/$(date +%F) $CAMINHO_RESTORE
cd $CAMINHO_RESTORE

if [ -f $1.sql ]
then
    mysql -uroot -p$MYSQL_PASS mutillidae < $1.sql
    if [ $? -eq 0 ]
    then
        echo "o restore foi realizado com sucesso"
    fi
else
    echo "o arquivo não foi restaurado"
fi