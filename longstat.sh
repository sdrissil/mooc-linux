#!/bin/bash

###########################################################################################
# longstat.sh
# Création : 27/04/2016
# Ce script bash fournit des statistiques sur l'utilisation des lettres dans une langue
# Paramètres :
#			(1) nom du fichier  : obligatoire
#			(2) 				: Facultatif
###########################################################################################




# Vérifier les paramètres d'entrée
	#Si le premier paramètre existe, on suppose que c'est le nom du fichier
	if [ -z $1 ]
	then
		#Vérfier l'existence du fichier
			if [ -e $1 ]
			then
				# Créer un tableau qui recevera la liste des mots du dictionnaire
				mots=()
				#Lire fichier et charger chaque mots dans le tableau
				# le -r permet de ne pas interpreter les blancs
				while IFS='' read -r line || [[ -n "$line" ]]; do
					echo "Text read from file: $line"
					mots+=("$line")
				done < "$1"
				
				 # pour chaque lettre dans l'alphabet
				for lettre in {a..z}
					do
						let "occurence = 0"
						# pour chaque entrée dans le tableau
							for mot in "${mots[@]}"
								do
								   echo "$mot"
								   # calculer occurence lettre
								   occurence $lettre $mot
								   
								done
				done
			else	
				echo "Une erreur est survenue. Le fichier mentionné n/'existe pas"
			fi
	elif [ -z $2 ]
	then 
		#Si deux paramètres
		echo "Deux param"
	else
		echo "Un erreur est survenue. Aucun fichier n/'a été fourni en entrée"
	fi						
					
					
