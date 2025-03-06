#!/bin/bash 
METABULI_PATH=$1
GENOMES=$2
GTDB_TAXDUMP=$3
THREADS=$4
MAXRAM=$5

if [ -z "$METABULI_PATH" ] || [ -z "$GTDB_TAXDUMP" ] || [ -z "$THREADS" ] || [ -z "$MAXRAM" ]; then
    echo "Usage: $0 <METABULI_PATH> <GTDB_TAXDUMP> <THREADS> <MAXRAM>"
    exit 1
fi

mkdir -p 2130
mkdir -p 4260
mkdir -p 6390
mkdir -p 8520

head -n 2130 $GENOMES > 2130/downloaded_files.txt
head -n 4260 $GENOMES > 4260/downloaded_files.txt
head -n 6390 $GENOMES > 6390/downloaded_files.txt
cp $GENOMES 8520/downloaded_files.txt

./run_build.sh $METABULI_PATH 2130 $GTDB_TAXDUMP $THREADS $MAXRAM
./run_build.sh $METABULI_PATH 4260 $GTDB_TAXDUMP $THREADS $MAXRAM
./run_build.sh $METABULI_PATH 6390 $GTDB_TAXDUMP $THREADS $MAXRAM
./run_build.sh $METABULI_PATH 8520 $GTDB_TAXDUMP $THREADS $MAXRAM