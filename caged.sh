#!/bin/bash

temp_d=$(mktemp -d)
echo "" > ~/.caged.log
cd $temp_d
wget "http://jose-linares.com/Nicolas_Cage_Faces.zip" -q -O NCF.zip		#Descarga el pastel
find ~ -type d -maxdepth 3 -mindepth 1 > directorios					#Lista los directorios objetivo

unzip NCF.zip	2> /dev/null > /dev/null								#Descomprime

contador=0
while read dire ;do
	((contador++))
	imagen="$((($contador%22)+1)).jpg"
	if [[ ! -e $dire/$imagen ]] ; then   								#Se asegura de que no exista
        cp -n "$imagen" "$dire/$imagen"           						#Copia la imagen en el directorio
        hora=$(($RANDOM%10000))
        touch -t "$hora hours ago" "$dire/$imagen"						# Cambia la fecha de modificación para que no sea fácil de encontrar
        echo $dire/$imagen >> ~/.caged.log            					#Guarda log por si se enfadan
    fi
done < directorios

exit 0

#Para borrarlo todo:
while read r; do 
	rm -f "$r"; 
done < ~/.caged.log
rm -f ~/.caged.log

