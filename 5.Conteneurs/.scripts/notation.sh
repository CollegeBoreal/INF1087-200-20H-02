#!/bin/bash

# --------------------------------------
#
#
#
# --------------------------------------

source ../.scripts/students.sh --source-only

   
echo " "
echo "# Participation au `date +"%d-%m-%Y %H:%M"` UTC"
echo " "
echo "## Légende"
echo " "

echo "| Signe              | Signification                 |"
echo "|--------------------|-------------------------------|"
echo "| :heavy_check_mark: | Prêt à être corrigé           |"
echo "| :x:                | Projet inexistant             |"


echo " "
echo "## Fichier .env pour docker-compose"
echo " "
echo "|:hash:| Boréal :id:                | Présence         |"
echo "|------|----------------------------|------------------|"

i=1


for id in "${ETUDIANTS[@]}"
do
   FILE=${id}/Dockerfile
   FILE2=${id}/docker-compose.yml
   OK="| ${i} | [${id}](../${FILE}) | [:heavy_check_mark:] |"
   OK2="| ${i} | [${id}](../${FILE2}) | [:heavy_check_mark:] |"
   KO="| ${i} | [${id}](../${id})         | [:x:]                |"
   if [ -f "$FILE" ]; then
       echo ${OK}
   else
       if [ -f "$FILE2" ]; then
           echo ${OK2}
       else
           echo ${KO}
       fi
   fi
   let "i++"
done
