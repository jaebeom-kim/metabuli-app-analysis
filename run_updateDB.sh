#!/bin/bash 
METABULI_PATH=$1
NEW_DBDIR=$2
VIRAL_GENOMES=$3
OLD_DBDIR=$4
THREADS=$5
MAXRAM=$6


if [ -z "$NEW_DBDIR" ] || [ -z "$VIRAL_GENOMES" ] || [ -z "$OLD_DBDIR" ] || [ -z "$THREADS" ] || [ -z "$METABULI_PATH" ] || [ -z "$MAXRAM" ]; then
    echo "Usage: $0 <METABULI_PATH> <NEW_DBDIR> <VIRAL_GENOMES> <OLD_DBDIR> <THREADS> <MAXRAM>"
    exit 1
fi


mkdir -p $NEW_DBDIR

# Run updateDB five time and redirect stdout and stderr of each run to separate files
$METABULI_PATH updateDB $NEW_DBDIR $VIRAL_GENOMES $NEW_DBDIR/newtaxa.accession2taxid $OLD_DBDIR --new-taxa $NEW_DBDIR/newtaxa.tsv --threads $THREADS --max-ram $MAXRAM --make-library 0 > $NEW_DBDIR/updateDB1.log 2> $NEW_DBDIR/updateDB1.err
$METABULI_PATH updateDB $NEW_DBDIR $VIRAL_GENOMES $NEW_DBDIR/newtaxa.accession2taxid $OLD_DBDIR --new-taxa $NEW_DBDIR/newtaxa.tsv --threads $THREADS --max-ram $MAXRAM --make-library 0 > $NEW_DBDIR/updateDB2.log 2> $NEW_DBDIR/updateDB2.err
$METABULI_PATH updateDB $NEW_DBDIR $VIRAL_GENOMES $NEW_DBDIR/newtaxa.accession2taxid $OLD_DBDIR --new-taxa $NEW_DBDIR/newtaxa.tsv --threads $THREADS --max-ram $MAXRAM --make-library 0 > $NEW_DBDIR/updateDB3.log 2> $NEW_DBDIR/updateDB3.err
$METABULI_PATH updateDB $NEW_DBDIR $VIRAL_GENOMES $NEW_DBDIR/newtaxa.accession2taxid $OLD_DBDIR --new-taxa $NEW_DBDIR/newtaxa.tsv --threads $THREADS --max-ram $MAXRAM --make-library 0 > $NEW_DBDIR/updateDB4.log 2> $NEW_DBDIR/updateDB4.err
$METABULI_PATH updateDB $NEW_DBDIR $VIRAL_GENOMES $NEW_DBDIR/newtaxa.accession2taxid $OLD_DBDIR --new-taxa $NEW_DBDIR/newtaxa.tsv --threads $THREADS --max-ram $MAXRAM --make-library 0 > $NEW_DBDIR/updateDB5.log 2> $NEW_DBDIR/updateDB5.err
