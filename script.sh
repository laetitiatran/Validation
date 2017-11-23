#!/bin/bash

#Installation complète de Vagrant puis Virtualbox

if [ ! -f Vagrantfile ];
	then vagrant init;
else echo "Le fichier existe déjà.";
fi

sudo apt-get update;
sudo apt-get install virtualbox;

echo "Que voulez-vous créer? 1: xenial64 2:trusty64"

read numero;
if [ $numero = 1 ] ;
	then box="ubuntu\/xenial64";
 	sed -ie "s/ config.vm.box = \"base\"/config.vm.box = \"$box\" /g" Vagrantfile;
elif [ $numero = 2 ] ;
	then box="ubuntu\/trusty64" ;
	sed -ie "s/ config.vm.box = \"base\"/config.vm.box = \"$box\" /g" Vagrantfile;
else [[ $numero != 1 || $numero != 2 ]] ;
	echo "Je n'ai pas compris." ;
fi

sed -ie "s= config.vm.synced_folder \"..\/data\", \"\/vagrant_data\"=config.vm.synced_folder \"data\", \"/var\/www\/html\" =g" Vagrantfile;
