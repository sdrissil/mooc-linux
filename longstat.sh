#!/bin/bash

###########################################################################################
# longstat.sh
# Création : 28/04/2016
# Ce script bash fournit des statistiques sur l'utilisation des lettres dans une langue
# Paramètres :
#			(1) nom du fichier  : obligatoire
#			(2) 				: Facultatif
###########################################################################################

#Fonction de triage
#Paramètre : tableau à trier


# Vérifier les paramètres d'entrée
	if [ $# -eq 1 ]
	#Si le premier paramètre existe, on suppose que c'est le nom du fichier
	then
		echo "Vous avez saisi un seul paramètre : $1"
		#Vérfier l'existence du fichier
			if [ -e "$1" ]
			then
				# Créer un tableau qui recevera la liste des mots du dictionnaire
				mots=()
				# Créer un tableau qui recevera le resultat des statistiques
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
						# pour chaque entrée dans le tableau
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
                
                #Affichage du résultat
			    for stat in ${stats_triees[@]}; do printf $stat; done
			    
			else	
				echo "Une erreur est survenue. Le fichier mentionné n'existe pas"
			fi
	elif [ $# -eq 2 ]
	then 
		#Si deux paramètres
		echo "Deux param $1 $2"
	elif [ $# -eq 0 ]
	then 
		#Si daucun param
		echo "Un erreur est survenue. Aucun fichier n'a été fourni en entrée"
	else
	    #Si plus de deux paramètres
		echo "Un erreur est survenue. le nombre de paramètres fourni est erroné. Merci de fournir entre un et deux paramètres."
	fi						