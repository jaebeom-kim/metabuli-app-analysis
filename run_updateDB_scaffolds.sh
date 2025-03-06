#!/bin/bash 
METABULI_PATH=$1
NEW_DBDIR=$2
NEW_GENOMES=$3
OLD_DBDIR=$4
GTDB_TAXDUMP=$5
THREADS=$6
MAXRAM=$7

if [ -z "$NEW_DBDIR" ] || [ -z "$NEW_GENOMES" ] || [ -z "$OLD_DBDIR" ] || [ -z "$THREADS" ] || [ -z "$METABULI_PATH" ] || [ -z "$MAXRAM" ]; then
    echo "Usage: $0 <METABULI_PATH> <NEW_DBDIR> <NEW_GENOMES> <OLD_DBDIR> <THREADS> <MAXRAM>"
    exit 1
fi

mkdir -p $NEW_DBDIR/512
mkdir -p $NEW_DBDIR/1024
mkdir -p $NEW_DBDIR/1536
mkdir -p $NEW_DBDIR/2048

head -n 512 $NEW_GENOMES > $NEW_DBDIR/512/genomes.txt
head -n 1024 $NEW_GENOMES > $NEW_DBDIR/1024/genomes.txt
head -n 1536 $NEW_GENOMES > $NEW_DBDIR/1536/genomes.txt
head -n 2048 $NEW_GENOMES > $NEW_DBDIR/2048/genomes.txt

$METABULI_PATH accession2taxid $NEW_DBDIR/512/genomes.txt $GTDB_TAXDUMP/taxid.map
cp $GTDB_TAXDUMP/taxid.accession2taxid $NEW_DBDIR/512/taxid.accession2taxid

$METABULI_PATH accession2taxid $NEW_DBDIR/1024/genomes.txt $GTDB_TAXDUMP/taxid.map
cp $GTDB_TAXDUMP/taxid.accession2taxid $NEW_DBDIR/1024/taxid.accession2taxid

$METABULI_PATH accession2taxid $NEW_DBDIR/1536/genomes.txt $GTDB_TAXDUMP/taxid.map
cp $GTDB_TAXDUMP/taxid.accession2taxid $NEW_DBDIR/1536/taxid.accession2taxid

$METABULI_PATH accession2taxid $NEW_DBDIR/2048/genomes.txt $GTDB_TAXDUMP/taxid.map
cp $GTDB_TAXDUMP/taxid.accession2taxid $NEW_DBDIR/2048/taxid.accession2taxid

# 512 5 times
$METABULI_PATH updateDB $NEW_DBDIR/512 $NEW_DBDIR/512/genomes.txt $NEW_DBDIR/512/taxid.accession2taxid $OLD_DBDIR --threads $THREADS --max-ram $MAXRAM --make-library 0 >  $NEW_DBDIR/512/updateDB1.log 2>  $NEW_DBDIR/512/updateDB1.err
$METABULI_PATH updateDB $NEW_DBDIR/512 $NEW_DBDIR/512/genomes.txt $NEW_DBDIR/512/taxid.accession2taxid $OLD_DBDIR --threads $THREADS --max-ram $MAXRAM --make-library 0 >  $NEW_DBDIR/512/updateDB2.log 2>  $NEW_DBDIR/512/updateDB2.err
$METABULI_PATH updateDB $NEW_DBDIR/512 $NEW_DBDIR/512/genomes.txt $NEW_DBDIR/512/taxid.accession2taxid $OLD_DBDIR --threads $THREADS --max-ram $MAXRAM --make-library 0 >  $NEW_DBDIR/512/updateDB3.log 2>  $NEW_DBDIR/512/updateDB3.err
$METABULI_PATH updateDB $NEW_DBDIR/512 $NEW_DBDIR/512/genomes.txt $NEW_DBDIR/512/taxid.accession2taxid $OLD_DBDIR --threads $THREADS --max-ram $MAXRAM --make-library 0 >  $NEW_DBDIR/512/updateDB4.log 2>  $NEW_DBDIR/512/updateDB4.err
$METABULI_PATH updateDB $NEW_DBDIR/512 $NEW_DBDIR/512/genomes.txt $NEW_DBDIR/512/taxid.accession2taxid $OLD_DBDIR --threads $THREADS --max-ram $MAXRAM --make-library 0 >  $NEW_DBDIR/512/updateDB5.log 2>  $NEW_DBDIR/512/updateDB5.err

# 1024 5 times
$METABULI_PATH updateDB $NEW_DBDIR/1024 $NEW_DBDIR/1024/genomes.txt $NEW_DBDIR/1024/taxid.accession2taxid $OLD_DBDIR --threads $THREADS --max-ram $MAXRAM --make-library 0 > $NEW_DBDIR/1024/updateDB1.log 2> $NEW_DBDIR/1024/updateDB1.err
$METABULI_PATH updateDB $NEW_DBDIR/1024 $NEW_DBDIR/1024/genomes.txt $NEW_DBDIR/1024/taxid.accession2taxid $OLD_DBDIR --threads $THREADS --max-ram $MAXRAM --make-library 0 > $NEW_DBDIR/1024/updateDB2.log 2> $NEW_DBDIR/1024/updateDB2.err
$METABULI_PATH updateDB $NEW_DBDIR/1024 $NEW_DBDIR/1024/genomes.txt $NEW_DBDIR/1024/taxid.accession2taxid $OLD_DBDIR --threads $THREADS --max-ram $MAXRAM --make-library 0 > $NEW_DBDIR/1024/updateDB3.log 2> $NEW_DBDIR/1024/updateDB3.err
$METABULI_PATH updateDB $NEW_DBDIR/1024 $NEW_DBDIR/1024/genomes.txt $NEW_DBDIR/1024/taxid.accession2taxid $OLD_DBDIR --threads $THREADS --max-ram $MAXRAM --make-library 0 > $NEW_DBDIR/1024/updateDB4.log 2> $NEW_DBDIR/1024/updateDB4.err
$METABULI_PATH updateDB $NEW_DBDIR/1024 $NEW_DBDIR/1024/genomes.txt $NEW_DBDIR/1024/taxid.accession2taxid $OLD_DBDIR --threads $THREADS --max-ram $MAXRAM --make-library 0 > $NEW_DBDIR/1024/updateDB5.log 2> $NEW_DBDIR/1024/updateDB5.err

# 1536 5 times
$METABULI_PATH updateDB $NEW_DBDIR/1536 $NEW_DBDIR/1536/genomes.txt $NEW_DBDIR/1536/taxid.accession2taxid $OLD_DBDIR --threads $THREADS --max-ram $MAXRAM --make-library 0 > $NEW_DBDIR/1536/updateDB1.log 2> $NEW_DBDIR/1536/updateDB1.err
$METABULI_PATH updateDB $NEW_DBDIR/1536 $NEW_DBDIR/1536/genomes.txt $NEW_DBDIR/1536/taxid.accession2taxid $OLD_DBDIR --threads $THREADS --max-ram $MAXRAM --make-library 0 > $NEW_DBDIR/1536/updateDB2.log 2> $NEW_DBDIR/1536/updateDB2.err
$METABULI_PATH updateDB $NEW_DBDIR/1536 $NEW_DBDIR/1536/genomes.txt $NEW_DBDIR/1536/taxid.accession2taxid $OLD_DBDIR --threads $THREADS --max-ram $MAXRAM --make-library 0 > $NEW_DBDIR/1536/updateDB3.log 2> $NEW_DBDIR/1536/updateDB3.err
$METABULI_PATH updateDB $NEW_DBDIR/1536 $NEW_DBDIR/1536/genomes.txt $NEW_DBDIR/1536/taxid.accession2taxid $OLD_DBDIR --threads $THREADS --max-ram $MAXRAM --make-library 0 > $NEW_DBDIR/1536/updateDB4.log 2> $NEW_DBDIR/1536/updateDB4.err
$METABULI_PATH updateDB $NEW_DBDIR/1536 $NEW_DBDIR/1536/genomes.txt $NEW_DBDIR/1536/taxid.accession2taxid $OLD_DBDIR --threads $THREADS --max-ram $MAXRAM --make-library 0 > $NEW_DBDIR/1536/updateDB5.log 2> $NEW_DBDIR/1536/updateDB5.err

# 2048 5 times
$METABULI_PATH updateDB $NEW_DBDIR/2048 $NEW_DBDIR/2048/genomes.txt $NEW_DBDIR/2048/taxid.accession2taxid $OLD_DBDIR --threads $THREADS --max-ram $MAXRAM --make-library 0 > $NEW_DBDIR/2048/updateDB1.log 2> $NEW_DBDIR/2048/updateDB1.err
$METABULI_PATH updateDB $NEW_DBDIR/2048 $NEW_DBDIR/2048/genomes.txt $NEW_DBDIR/2048/taxid.accession2taxid $OLD_DBDIR --threads $THREADS --max-ram $MAXRAM --make-library 0 > $NEW_DBDIR/2048/updateDB2.log 2> $NEW_DBDIR/2048/updateDB2.err
$METABULI_PATH updateDB $NEW_DBDIR/2048 $NEW_DBDIR/2048/genomes.txt $NEW_DBDIR/2048/taxid.accession2taxid $OLD_DBDIR --threads $THREADS --max-ram $MAXRAM --make-library 0 > $NEW_DBDIR/2048/updateDB3.log 2> $NEW_DBDIR/2048/updateDB3.err
$METABULI_PATH updateDB $NEW_DBDIR/2048 $NEW_DBDIR/2048/genomes.txt $NEW_DBDIR/2048/taxid.accession2taxid $OLD_DBDIR --threads $THREADS --max-ram $MAXRAM --make-library 0 > $NEW_DBDIR/2048/updateDB4.log 2> $NEW_DBDIR/2048/updateDB4.err
$METABULI_PATH updateDB $NEW_DBDIR/2048 $NEW_DBDIR/2048/genomes.txt $NEW_DBDIR/2048/taxid.accession2taxid $OLD_DBDIR --threads $THREADS --max-ram $MAXRAM --make-library 0 > $NEW_DBDIR/2048/updateDB5.log 2> $NEW_DBDIR/2048/updateDB5.err
