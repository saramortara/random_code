ssh sara.mortara@login.sdumont.lncc.br

cd /scratch/modler/sara.mortara
ls
#paraver o que esta carregado
#export -p
#para ver o que estádisponivel
#module avail
#carregue o moduloR
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

#R -e "install.pac(rgeos)"
#R -e "install.packages('rgeos', repos='https://cran.fiocruz.br', lib='/scratch/modler/sara.mortara/R_gnu')"
R -e "install.packages('tidyr', repos='https://cran.fiocruz.br', lib='/scratch/modler/sara.mortara/R_gnu')"
R -e "install.packages('textclean', repos='https://cran.fiocruz.br', lib='/scratch/modler/sara.mortara/R_gnu')"
R -e "install.packages('rgdal', repos='https://cran.fiocruz.br', lib='/scratch/modler/sara.mortara/R_gnu')"
R -e "install.packages('flora', repos='https://cran.fiocruz.br', lib='/scratch/modler/sara.mortara/R_gnu')"
R -e "install.packages('processx', repos='https://cran.fiocruz.br', lib='/scratch/modler/sara.mortara/R_gnu')"
R -e "install.packages('backports', repos='https://cran.fiocruz.br', lib='/scratch/modler/sara.mortara/R_gnu')"
R -e "install.packages('testthat', repos='https://cran.fiocruz.br', lib='/scratch/modler/sara.mortara/R_gnu')"
R -e "install.packages('devtools', repos='https://cran.fiocruz.br', lib='/scratch/modler/sara.mortara/R_gnu')"
R -e "install.packages('Rmpi', repos='https://cran.fiocruz.br', lib='/scratch/modler/sara.mortara/R_gnu')"
R -e "install.packages('raster', repos='https://cran.fiocruz.br', lib='/scratch/modler/sara.mortara/R_gnu')"
R -e "install.packages('doParallel', repos='https://cran.fiocruz.br', lib='/scratch/modler/sara.mortara/R_gnu')"
R -e "install.packages('XML', repos='https://cran.fiocruz.br', lib='/scratch/modler/sara.mortara/R_gnu')"
R -e "install.packages('remotes', repos='https://cran.fiocruz.br', lib='/scratch/modler/sara.mortara/R_gnu')"
R -e "install.packages('kernlab', repos='https://cran.fiocruz.br', lib='/scratch/modler/sara.mortara/R_gnu')"
R -e "install.packages('randomForest', repos='https://cran.fiocruz.br', lib='/scratch/modler/sara.mortara/R_gnu')"
R -e "install.packages('lazyeval', repos='https://cran.fiocruz.br', lib='/scratch/modler/sara.mortara/R_gnu')"
R -e "install.packages('plyr', repos='https://cran.fiocruz.br', lib='/scratch/modler/sara.mortara/R_gnu')"
R -e "install.packages('brt', repos='https://cran.fiocruz.br', lib='/scratch/modler/sara.mortara/R_gnu')"
R -e "install.packages('lubridate', repos='https://cran.fiocruz.br', lib='/scratch/modler/sara.mortara/R_gnu')"
R -e "install.packages('reshape2', repos='https://cran.fiocruz.br', lib='/scratch/modler/sara.mortara/R_gnu')"
R -e "install.packages('maxnet', repos='https://cran.fiocruz.br', lib='/scratch/modler/sara.mortara/R_gnu')"
R -e "install.packages('htmltools', repos='https://cran.fiocruz.br', lib='/scratch/modler/sara.mortara/R_gnu')"
R -e "install.packages('XML', repos='https://cran.fiocruz.br', lib='/scratch/modler/sara.mortara/R_gnu')"
R -e "install.packages('RCurl', repos='https://cran.fiocruz.br', lib='/scratch/modler/sara.mortara/R_gnu')"
R -e "install.packages('githubinstall', repos='https://cran.fiocruz.br', lib='/scratch/modler/sara.mortara/R_gnu')"
#####ESTA
#R -e "githubinstall::githubinstall("modelr_pkg", ref = 'master', lib='/scratch/modler/sara.mortara/R_gnu')"
#R -e "devtools::install_github("model-r/modelr_pkg", build_vignettes = TRUE, ref = "master")"
#####ESTA
R -e "library(rJava);devtools::install('modelr_pkg-master', lib='/scratch/modler/sara.mortara/R_gnu', dependencies = F)"
R -e "library(dplyr);citation('dplyr')"
R -e "library(modleR)"
R
R
library(modleR)

R -e "install.packages('rgdal', repos='http://cran.rstudio.com/', lib='/scratch/modler/sara.mortara/R_gnu', configure.args = c('--with-proj-include=/scratch/app/proj/6.0/include', '--with-proj-lib=/scratch/app/proj/6.0/lib'))"
#installgeos
# wget -c http://download.osgeo.org/geos/geos-3.6.2.tar.bz2
# tar xjvf geos-3.6.2.tar.bz2
# cd geos-3.6.2
# ./configure --prefix=$SCRATCH/geos
# make
# module load gcc/6.5
# make check
# make install

#R -e "install.packages('Rmpi', repos='http://cran.rstudio.com/', lib='/scratch/modler/sara.mortara/R_gnu')"
