#!/bin/bash 
mem_total=$(free | grep -i mem | awk '{ print $2 }')
mem_usada=$(free | grep -i mem | awk '{ print $3 }')
percent_usada=$(bc <<< "scale=2;$mem_usada/$mem_total *100" | awk -F. '{ print $1}')

if [ $percent_usada -gt 15 ]
then
	telegram-notify --error --title “Error” --text 'Consumo de memória alto, atualmente em '$(free -h | grep -i mem | awk '{ print 2}'')'

fi
