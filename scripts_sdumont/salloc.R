squeue -p cpu_small
squeue -p cpu_dev
squeue -u sara.mortara
sinfo -p cpu_small -s
salloc --nodes=1 -p cpu_dev -J baf --exclusive --time=00:20:00
squeue -u sara.mortara

ssh sdumont1002


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


cd $SCRATCH
ls
cd baf_environmental_data
R --no-save --no-restore

q()

 exit
 exit
salloc: Relinquishing job allocation 207701

No 1º comando solicitei a alocação de um job em um único nó. No 2º,
verifiquei que o nó alocado foi o sdumont5044 (coluna NODELIST). Depois,
fiz SSH pro sdumont5044 e trabalhei de lá.

Depois que saio o SLURM informa que a alocação foi liberada (última linha).
