#!/bin/bash

# --------------------------------------
#
#
#
# --------------------------------------

source ../.scripts/students.sh --source-only

   
echo "# Participation au `date +"%d-%m-%Y %H:%M"` UTC"
echo " "
echo "## Légende"
echo " "

echo "| Signe              | Signification                 |"
echo "|--------------------|-------------------------------|"
echo "| :heavy_check_mark: | Prêt à être corrigé           |"
echo "| :x:                | Projet inexistant             |"


echo " "
echo "## Résultat"
echo " "
echo "|:hash:| Boréal :id:                | Présence         |"
echo "|------|----------------------------|------------------|"

i=1


for id in "${ETUDIANTS[@]}"
do
   FILE=${id}/README.md
   OK="| ${i} | [${id}](../${FILE}) | [:heavy_check_mark:] |"
   KO="| ${i} | [${id}](../${FILE}) | [:x:]                |"
   if [ -f "$FILE" ]; then
       echo ${OK}
   else
       echo ${KO}
   fi
   let "i++"
done
