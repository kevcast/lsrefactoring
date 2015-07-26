#!/bin/bash

#defecto

lista_plato='plato.txt'
tamano_plato_principal='407x272'
tamano_plato_destacado='215x155'
tamano_plato_general='145x112'
tamano_restaurante_principal='240x143'
#plato
cd plato   
for file in $(find . -name "*jpg")
do
    if [[ -f $file ]]; then
        echo $file
        substr=${file:2:3}
        case $substr in
        'des')         
            convert -resize $tamano_plato_destacado $file $file;;
        'gen')
            convert -resize $tamano_plato_general $file $file;;
        'pri')
            convert -resize $tamano_plato_principal $file $file;;
        esac

    fi
done

cd ../restaurante
for file in $(find . -name "*jpg")
do
    if [[ -f $file ]]; then
        echo $file
        substr=${file:2:3}
        case $substr in
        'pri')
            convert -resize $tamano_restaurante_principal $file $file;;
        esac
    fi
done
