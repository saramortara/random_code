#santos dumont bash script
ssh sara.mortara@login.sdumont.lncc.br

squeue -p cpu_small
squeue -p cpu
squeue -p cpu_dev
squeue -p mesca2
squeue -u sara.mortara

#una sesion interactiva para rodar el clean - debe demorarse un minuto
salloc --nodes=1 -p cpu_dev -J bigBAF --exclusive --time=00:20:00
squeue -u sara.mortara
ssh sdumont1058


$ # Carregue módulos necessários, dispare o R etc
module load R/3.5.2_openmpi_2.0_gnu
export R_LIBS_USER='/scratch/modler/sara.mortara/R_gnu'

module load gcc/6.5
module load openmpi/gnu/2.0.4.2
module load proj/6.0
module load gdal/2.4

#java
module load java/jdk-8u201
export JAVA_HOME="/scratch/app/java/jdk1.8.0_201/jre"
export JAVA="/scratch/app/java/jdk1.8.0_201/jre/bin/java"
export JAVAC="/scratch/app/java/jdk1.8.0_201/bin/javac"
export JAVAH="/scratch/app/java/jdk1.8.0_201/bin/javah"
export JAR="/scratch/app/java/jdk1.8.0_201/bin/jar"
export JAVA_INCLUDE_DIR=/scratch/app/java/jdk1.8.0_201/include
export JAVA_LD_LIBRARY_PATH=/scratch/app/java/jdk1.8.0_201/lib
export JAVA_CPPFLAGS="-I/scratch/app/java/jdk1.8.0_201/include -I/scratch/app/java/jdk1.8.0_201/include/linux"
export JAVA_LIBS="-L/scratch/app/java/jdk1.8.0_201/jre/lib/amd64/server -ljvm -L/scratch/app/xz-utils/5.2.2_intel/lib"
export PATH=/scratch/app/java/jdk1.8.0_201/bin:$PATH
export LD_LIBRARY_PATH=/scratch/app/java/jdk1.8.0_201/jre/lib/amd64:/scratch/app/java/jdk1.8.0_201/jre/lib/amd64/server:$LD_LIBRARY_PATH

#geos
export LD_LIBRARY_PATH="/scratch/modler/sara.mortara/geos/lib:$LD_LIBRARY_PATH"
export PATH="/scratch/modler/sara.mortara/geos/bin:$PATH"

#proj
export PROJ_LIB="/scratch/app/proj/5.2/bin"
export OMPI_MCA_mpi_warn_on_fork=0
pwd
cd /scratch/modler/sara.mortara/Bignonieae_JPN
#cd /scratch/modler/diogo.rocha2/IIS_modelos_2019
#cd $SCRATCH
#cd Bignonieae_JPN

R --no-save --no-restore
library(parallel)
 library(doParallel)
 library(foreach)
 detectCores()
 getDoParWorkers()
 getDoParRegistered()

 cl <- parallel::makeCluster(96, type = 'FORK', outfile = "./ensemble_generalistas.log")
cl
 registerDoParallel(cl)
getDoParWorkers()
stopCluster(cl)
cluster
#max <- list.files("./flora_ameacada", pattern = "^evaluate.+maxent.csv$", recursive = T)
evalbio5 <- list.files("./models_bio_5", pattern = "^evaluate", recursive = T, full.names = T)
evalbio10 <- list.files("./models_bio_10", pattern = "^evaluate", recursive = T, full.names = T)
evaleig10 <- list.files("./models_eigen_10", pattern = "^evaluate", recursive = T, full.names = T)
evaleig5 <- list.files("./models_eigen_5", pattern = "^evaluate", recursive = T, full.names = T)
length(evalbio5)#7212
length(evalbio10)#3944
length(evaleig5)#1621
length(evaleig10)#7660

evalbio5 <- purrr::map(evalbio5, read.csv)
allbio5 <- dplyr::bind_rows(evalbio5)
head(allbio5)
write.csv(allbio5, "evalbio5.csv")

length(evalbio10)
evalbio10 <- purrr::map(evalbio10, read.csv)
allbio10 <- dplyr::bind_rows(evalbio10)
head(allbio10)
write.csv(allbio10, "evalbio10.csv")

evaleig10 <- purrr::map(evaleig10, read.csv)

alleig10 <- dplyr::bind_rows(evaleig10)
head(alleig10)
write.csv(alleig10, "evaleig10.csv")

evaleig5 <- purrr::map(evaleig5, read.csv)
alleig5 <- dplyr::bind_rows(evaleig5)
head(alleig5)
write.csv(alleig5, "evaleig5.csv")

sdm <- list.files("./flora_ameacada/", recursive = T, "sdmdata.txt", full.names = T)
sdm_list <- purrr::map(sdm, read.table)
sdm_all <- dplyr::bind_rows(sdm_list)
write.csv(sdm_all, "../../sara.mortara/sdmdata_ameacadas.csv")


meta <- list.files("./flora_ameacada", recursive = T, "metadata.txt", full.names = T)
meta_list <- purrr::map(meta, read.table)
meta_all <- dplyr::bind_rows(meta_list)
#dataframe de teste para ver o que dá errado

write.csv(meta_all, "../../sara.mortara/runresults.csv")

max <- list.files("./models_bio_5", pattern = "^evaluate.+maxent.csv$", recursive = T)
eval <- list.files("./models_bio_5", pattern = "^evaluate", recursive = T, full.names = T)
length(max)#1475eigen10
length(eval)#7660eigen10
eval2 <- purrr::map(eval, read.csv)
all <- dplyr::bind_rows(eval2)
write.csv(all, "todo_run_bio5test.csv")

library(dplyr)
names(all)
a <- all %>% count(X, algoritmo)
write.csv(a, "count_bio5test.csv")
q()
exit
#la sesion interactiva para rodar setup
ssh sara.mortara@login.sdumont.lncc.br

squeue -p cpu_small
squeue -p cpu_dev

squeue -u sara.mortara
salloc --nodes=1 -p cpu_dev -J baf --exclusive --time=00:20:00
squeue -u sara.mortara
ssh sdumont5044


$ # Carregue módulos necessários, dispare o R etc
module load R/3.5.2_openmpi_2.0_gnu
export R_LIBS_USER='/scratch/modler/sara.mortara/R_gnu'

module load gcc/6.5
module load openmpi/gnu/2.0.4.2
module load proj/6.0
module load gdal/2.4

#java
module load java/jdk-8u201
export JAVA_HOME="/scratch/app/java/jdk1.8.0_201/jre"
export JAVA="/scratch/app/java/jdk1.8.0_201/jre/bin/java"
export JAVAC="/scratch/app/java/jdk1.8.0_201/bin/javac"
export JAVAH="/scratch/app/java/jdk1.8.0_201/bin/javah"
export JAR="/scratch/app/java/jdk1.8.0_201/bin/jar"
export JAVA_INCLUDE_DIR=/scratch/app/java/jdk1.8.0_201/include
export JAVA_LD_LIBRARY_PATH=/scratch/app/java/jdk1.8.0_201/lib
export JAVA_CPPFLAGS="-I/scratch/app/java/jdk1.8.0_201/include -I/scratch/app/java/jdk1.8.0_201/include/linux"
export JAVA_LIBS="-L/scratch/app/java/jdk1.8.0_201/jre/lib/amd64/server -ljvm -L/scratch/app/xz-utils/5.2.2_intel/lib"
export PATH=/scratch/app/java/jdk1.8.0_201/bin:$PATH
export LD_LIBRARY_PATH=/scratch/app/java/jdk1.8.0_201/jre/lib/amd64:/scratch/app/java/jdk1.8.0_201/jre/lib/amd64/server:$LD_LIBRARY_PATH

#geos
export LD_LIBRARY_PATH="/scratch/modler/sara.mortara/geos/lib:$LD_LIBRARY_PATH"
export PATH="/scratch/modler/sara.mortara/geos/bin:$PATH"

#proj
export PROJ_LIB="/scratch/app/proj/5.2/bin"
export OMPI_MCA_mpi_warn_on_fork=0

cd /scratch/modler/sara.mortara/Bignonieae_JPN
ls
R -e "source('./R/07_enm.R')"

#segunda rodada pero con sbatch
cd /scratch/modler/sara.mortara/Bignonieae_JPN
ls -all R
ls
chmod +x R/07_do_many_10_bio.R
chmod +x R/07_do_many_10_eigen.R
chmod +x R/07_do_many_5_eigen.R
sbatch 07_10bio_mesca.sbatch
sbatch 07_5eig_mesca.sbatch
sbatch 07_5bio_mesca.sbatch
#sbatch 07_10bio_mesca.sbatch
watch squeue -u sara.mortara
squeue -u sara.mortara --start

squeue -p mesca2
squeue -p cpu_small
squeue -p cpu_dev
scancel 288696
#modelos con sbatch