#!/bin/bash

###########################################################################################
# longstat.sh
# Cr�ation : 28/04/2016
# Ce script bash fournit des statistiques sur l'utilisation des lettres dans une langue
# Param�tres :
#			(1) nom du fichier  : obligatoire
#			(2) 				: Facultatif
###########################################################################################

#Fonction de triage
#Param�tre : tableau � trier


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
				# Cr�er un tableau qui recevera le resultat des statistiques
				stats=()
				#Lire fichier et charger chaque mots dans le tableau
				# le -r permet de ne pas interpreter les blancs
				filename="$1"
				while IFS= read -r line
				do
					mots+=("$line")
				done < "$filename"

				# pour chaque lettre dans l'alphabet
				for lettre in {A..Z}
					do
				    	#Initialisation de la variable occurence
			        	declare -i occurence=0
						# pour chaque entr�e dans le tableau
							for mot in "${mots[@]}"
						    	do
    							    if [[ $mot =~ .*$lettre.* ]]
    								   then
    										let "occurence=occurence+1"
    								fi
								done
						stats+=("$occurence - $lettre \n")
			    	done
			    	
			    #Tri des stats
			    stats_triees=( $(
                for el in "${stats[@]}"
                do
                    echo "$el"
                done | sort) )
                
                #Affichage du r�sultat
			    for stat in ${stats_triees[@]}; do printf $stat; done
			    
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