#### Script to check how many species run ####

### Generalistas
sp_tif <- list.files(path="tif_files/bin/generalistas/", pattern = "*.tif")
sp_names <- sapply(strsplit(sp_tif, "_bin_"), function(x) x[1])

head(sp_names)

sp_dir <- list.files(path="/scratch/modler/diogo.rocha2/IIS_modelos_2019/flora_generalista/modelos_generalistas_5km/")

head(sp_dir)

length(sp_dir)
length(sp_names)

setdiff(sp_names, sp_dir) # raw_mean_ensemble
setdiff(sp_dir, sp_names) # "Schizophyllum commune"

### Ameacadas OK 

sp_tif <- list.files(path="tif_files/bin/ameacadas/", pattern = "*.tif")
sp_names <- sapply(strsplit(sp_tif, "_bin_"), function(x) x[1])

head(sp_names)

sp_dir <- list.files(path="/scratch/modler/diogo.rocha2/IIS_modelos_2019/flora_ameacada/modelos_ameacadas_5km_ok/")

head(sp_dir)

length(sp_dir)
length(sp_names)

setdiff(sp_names, sp_dir) # raw_mean_ensemble
setdiff(sp_dir, sp_names) # "Schizophyllum commune"



