## options to copy multiple files with space

### works only for a few files
# print-0 because of space in file names
find . -type f -name "*.txt" -print0 | xargs -n 1 --null cp -t para

### avoiding xargs: argument line too long
#find . -type f -name "*bin*ensemble*50.tif" | xargs cp -t /scratch/modler/sara.mortara/IIS_download/tif_files/generalistas/bin

# GENERALISTAS
# entra no dir do diogo
cd /scratch/modler/diogo.rocha2/IIS_modelos_2019/flora_generalista/modelos_generalistas_5km

# encontra e copia os arquivos
## bin
find . -type f -name "*bin*ensemble*50.tif" -exec cp -t /scratch/modler/sara.mortara/IIS_download/tif_files/bin/generalistas {} +
## range
find . -type f -name "*raw_mean_range*.tif" -exec cp -t /scratch/modler/sara.mortara/IIS_download/tif_files/range/generalistas/ {} +
## median
find . -type f -name "*raw_mean_median*.tif" -exec cp -t /scratch/modler/sara.mortara/IIS_download/tif_files/cont/generalistas/ {} +

# AMEACADAS
# entra no dir do diogo
cd /scratch/modler/diogo.rocha2/IIS_modelos_2019/flora_ameacada/modelos_ameacadas_5km_ok

# encontra e copia os arquivos
## bin
find . -type f -name "*bin*ensemble*50.tif" -exec cp -t /scratch/modler/sara.mortara/IIS_download/tif_files/bin/ameacadas/ {} +
## range
find . -type f -name "*raw_mean_range*.tif" -exec cp -t /scratch/modler/sara.mortara/IIS_download/tif_files/range/ameacadas/ {} +
## median
find . -type f -name "*raw_mean_median*.tif" -exec cp -t /scratch/modler/sara.mortara/IIS_download/tif_files/cont/ameacadas/ {} +


 # ENDEMICAS
# entra no dir do diogo
cd /scratch/modler/diogo.rocha2/IIS_modelos_2019/flora_endemica/modelos_ameacadas_5km

# encontra e copia os arquivos
## bin
find . -type f -name "*bin*ensemble*50.tif" -exec cp -t /scratch/modler/sara.mortara/IIS_download/tif_files/bin/endemicas/ {} +
## range
find . -type f -name "*raw_mean_range*.tif" -exec cp -t /scratch/modler/sara.mortara/IIS_download/tif_files/range/endemicas/ {} +
## median
find . -type f -name "*raw_mean_median*.tif" -exec cp -t /scratch/modler/sara.mortara/IIS_download/tif_files/cont/endemicas/ {} +

 # FAUNA
# entra no dir do diogo
cd /scratch/modler/diogo.rocha2/IIS_modelos_2019/fauna/modelos_ameacadas_5km

# encontra e copia os arquivos
## bin
find . -type f -name "*bin*ensemble*50.tif" -exec cp -t /scratch/modler/sara.mortara/IIS_download/tif_files/bin/fauna/ {} +
## range
find . -type f -name "*raw_mean_range*.tif" -exec cp -t /scratch/modler/sara.mortara/IIS_download/tif_files/range/fauna/ {} +
## median
find . -type f -name "*raw_mean_median*.tif" -exec cp -t /scratch/modler/sara.mortara/IIS_download/tif_files/cont/fauna/ {} +

