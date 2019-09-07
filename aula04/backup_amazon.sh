#!/bin/bash 
CAMINHO_AMAZON=/home/alego/backup_amazon
data=$(date +%F)
cd $CAMINHO_AMAZON

if [ ! -d $data ]
then
	mkdir $data
fi

tabelas=$(mysql -uroot -p$MYSQL_PASS mutillidae -e "show tables;" | grep -v Tables)

for tabela in $tabelas
do
	mysqldump -uroot -p$MYSQL_PASS mutillidae $tabela > $CAMINHO_AMAZON/$data/$tabela.sql
done

aws s3 sync $CAMINHO_AMAZON s3://curso-alurarodrigo-s3

