#!/bin/bash 
CAMINHO_DIRETORIO=/home/alego

cd $CAMINHO_DIRETORIO

if [ ! -d backup ]
then
	mkdir backup
fi

mysqldump -uroot -p$MYSQL_PASS $1 > $CAMINHO_DIRETORIO/backup/$1.sql

if [ $? -eq 0 ]
then
	echo "O Backup foi realizado com sucesso"
else
	echo "houve um problema com o Backup"
fi


