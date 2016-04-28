#!/bin/bash

###########################################################################################
# longstat.sh
# Cr�ation : 27/04/2016
# Ce script bash fournit des statistiques sur l'utilisation des lettres dans une langue
# Param�tres :
#			(1) nom du fichier  : obligatoire
#			(2) 				: Facultatif
###########################################################################################




# V�rifier les param�tres d'entr�e
	#Si le premier param�tre existe, on suppose que c'est le nom du fichier
	if [ -z $1 ]
	then
		#V�rfier l'existence du fichier
			if [ -e $1 ]
			then
				# Cr�er un tableau qui recevera la liste des mots du dictionnaire
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
						# pour chaque entr�e dans le tableau
							for mot in "${mots[@]}"
								do
								   echo "$mot"
								   # calculer occurence lettre
								   occurence $lettre $mot
								   
								done
				done
			else	
				echo "Une erreur est survenue. Le fichier mentionn� n/'existe pas"
			fi
	elif [ -z $2 ]
	then 
		#Si deux param�tres
		echo "Deux param"
	else
		echo "Un erreur est survenue. Aucun fichier n/'a �t� fourni en entr�e"
	fi						
					
					
