#!/bin/bash 
estado_conexao=$(curl --silent --write-out %{http_code} --output /dev/null http://localhost)
if [ $estado_conexao -eq 200 ]
then
    echo "está tudo ok com o servidor"
else
    echo "houve um problema com o servidor. tentando reinicializar"
    sudo systemctl start httpd
    echo "...servidor reinicializado"
fi

