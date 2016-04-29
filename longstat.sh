#!/bin/bash

###########################################################################################
# longstat.sh
# Cr�ation : 28/04/2016
# Ce script bash fournit des statistiques sur l'utilisation des lettres dans une langue
# Param�tres :
#			(1) nom du fichier  : obligatoire
#			(2) 				: Facultatif
###########################################################################################




# V�rifier les param�tres d'entr�e
	if [ $# -eq 1 ]
	#Si le premier param�tre existe, on suppose que c'est le nom du fichier
	then
		echo "Vous avez saisi un seul param�tre : $1"
		#V�rfier l'existence du fichier
			if [ -e "$1" ]
			then
				# Cr�er un tableau qui recevera la liste des mots du dictionnaire
				mots=()
				#Lire fichier et charger chaque mots dans le tableau
				# le -r permet de ne pas interpreter les blancs
				filename="$1"
				while read "line" 
				do
					#echo "Text read from file: $line"
					mots+=("$line")
				done < "$filename"
				
				 # pour chaque lettre dans l'alphabet
				for lettre in {A..Z}
					do
						let "occurence = 0"
						# pour chaque entr�e dans le tableau
							for mot in "${mots[@]}"
								do
								   if [[ $mot =~ .*$lettre.* ]]
								   then
										let "occurence=occurence+1"
									fi						   
								done
						#Printf permet de faire un meilleur formattage du texte
						printf "%-5s - $lettre \n" $occurence
						#echo "$occurence - $lettre"
			    	done
			else	
				echo "Une erreur est survenue. Le fichier mentionn� n'existe pas"
			fi
	elif [ $# -eq 2 ]
	then 
		#Si deux param�tres
		echo "Deux param $1 $2"
	elif [ $# -eq 0 ]
	then 
		#Si daucun param
		echo "Un erreur est survenue. Aucun fichier n'a �t� fourni en entr�e"
	else
	    #Si plus de deux param�tres
		echo "Un erreur est survenue. le nombre de param�tres fourni est erron�. Merci de fournir entre un et deux param�tres."
	fi						