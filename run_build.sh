#!/bin/bash 
DBDIR=$1
GTDB_TAXDUMP=$2
THREADS=$3
if [ -z "$DBDIR" ] || [ -z "$GTDB_TAXDUMP" ] || [ -z "$THREADS" ]; then
    echo "Usage: $0 <DBDIR> <GTDB_TAXDUMP> <THREADS>"
    exit 1
fi


# Run build five time and redirect stdout and stderr of each run to separate files
metabuli build $DBDIR $DBDIR/downloaded_files.txt $GTDB_TAXDUMP/taxid.map --taxonomy-path $GTDB_TAXDUMP --gtdb 1 --threads $THREADS > $DBDIR/build1.log 2> $DBDIR/build1.err
metabuli build $DBDIR $DBDIR/downloaded_files.txt $GTDB_TAXDUMP/taxid.map --taxonomy-path $GTDB_TAXDUMP --gtdb 1 --threads $THREADS > $DBDIR/build2.log 2> $DBDIR/build2.err
metabuli build $DBDIR $DBDIR/downloaded_files.txt $GTDB_TAXDUMP/taxid.map --taxonomy-path $GTDB_TAXDUMP --gtdb 1 --threads $THREADS > $DBDIR/build3.log 2> $DBDIR/build3.err
metabuli build $DBDIR $DBDIR/downloaded_files.txt $GTDB_TAXDUMP/taxid.map --taxonomy-path $GTDB_TAXDUMP --gtdb 1 --threads $THREADS > $DBDIR/build4.log 2> $DBDIR/build4.err
metabuli build $DBDIR $DBDIR/downloaded_files.txt $GTDB_TAXDUMP/taxid.map --taxonomy-path $GTDB_TAXDUMP --gtdb 1 --threads $THREADS > $DBDIR/build5.log 2> $DBDIR/build5.err
