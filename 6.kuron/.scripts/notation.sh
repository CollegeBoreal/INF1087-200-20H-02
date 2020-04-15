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
echo "## Fichier kuron-deployment-service.yaml pour kubectl"
echo " "
echo "|:hash:| Boréal :id:                | Présence         |"
echo "|------|----------------------------|------------------|"

i=1


for id in "${ETUDIANTS[@]}"
do
   REP=${id}
   FILE=${REP}/kuron-deployment-service.yaml
   OK="| ${i} | [${id}](../${FILE}) | [:heavy_check_mark:] |"
   KO="| ${i} | [${id}](../${REP}) | [:x:]                |"
   if [ -f "$FILE" ]; then
       echo ${OK}
   else
       echo ${KO}
   fi
   let "i++"
done
