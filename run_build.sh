#!/bin/bash 
METABULI_PATH=$1
DBDIR=$2
GTDB_TAXDUMP=$3
THREADS=$4
MAXRAM=$5


if [ -z "$DBDIR" ] || [ -z "$GTDB_TAXDUMP" ] || [ -z "$THREADS" ] || [ -z "$METABULI_PATH" ] || [ -z "$MAXRAM" ]; then
    echo "Usage: $0 <METABULI_PATH> <DBDIR> <GTDB_TAXDUMP> <THREADS> <MAXRAM>"
    exit 1
fi

mkdir -p $DBDIR

echo $THREADS   

# Run build five time and redirect stdout and stderr of each run to separate files
$METABULI_PATH build $DBDIR $DBDIR/downloaded_files.txt $GTDB_TAXDUMP/taxid.map --taxonomy-path $GTDB_TAXDUMP --gtdb 1 --threads $THREADS --max-ram $MAXRAM --make-library 0 > $DBDIR/build1.log 2> $DBDIR/build1.err
$METABULI_PATH build $DBDIR $DBDIR/downloaded_files.txt $GTDB_TAXDUMP/taxid.map --taxonomy-path $GTDB_TAXDUMP --gtdb 1 --threads $THREADS --max-ram $MAXRAM --make-library 0 > $DBDIR/build2.log 2> $DBDIR/build2.err
$METABULI_PATH build $DBDIR $DBDIR/downloaded_files.txt $GTDB_TAXDUMP/taxid.map --taxonomy-path $GTDB_TAXDUMP --gtdb 1 --threads $THREADS --max-ram $MAXRAM --make-library 0 > $DBDIR/build3.log 2> $DBDIR/build3.err
$METABULI_PATH build $DBDIR $DBDIR/downloaded_files.txt $GTDB_TAXDUMP/taxid.map --taxonomy-path $GTDB_TAXDUMP --gtdb 1 --threads $THREADS --max-ram $MAXRAM --make-library 0 > $DBDIR/build4.log 2> $DBDIR/build4.err
$METABULI_PATH build $DBDIR $DBDIR/downloaded_files.txt $GTDB_TAXDUMP/taxid.map --taxonomy-path $GTDB_TAXDUMP --gtdb 1 --threads $THREADS --max-ram $MAXRAM --make-library 0 > $DBDIR/build5.log 2> $DBDIR/build5.err
