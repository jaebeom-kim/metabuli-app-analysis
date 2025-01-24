#!/bin/bash 

METABULI_PATH=$1
QUERY1=$2
QUERY2=$3
DBDIR=$4
OUTDIR=$5
JOBNAME=$6
THREADS=$7
MAXRAM=$8

if [ -z "$METABULI_PATH" ] || [ -z "$QUERY1" ] || [ -z "$QUERY2" ] || [ -z "$DBDIR" ] || [ -z "$OUTDIR" ] || [ -z "$JOBNAME" ] || [ -z "$THREADS" ] || [ -z "$MAXRAM" ]; then
    echo "Usage: $0 <METABULI_PATH> <QUERY1> <QUERY2> <DBDIR> <OUTDIR> <JOBNAME> <THREADS> <MAXRAM>"
    exit 1
fi

mkdir -p $OUTDIR

$METABULI_PATH classify $QUERY1 $QUERY2 $DBDIR $OUTDIR $JOBNAME --threads $THREADS --max-ram $MAXRAM > "$OUTDIR/${JOBNAME}-1.log" 2> "$OUTDIR/${JOBNAME}-1.err"
$METABULI_PATH classify $QUERY1 $QUERY2 $DBDIR $OUTDIR $JOBNAME --threads $THREADS --max-ram $MAXRAM > "$OUTDIR/${JOBNAME}-2.log" 2> "$OUTDIR/${JOBNAME}-2.err"
$METABULI_PATH classify $QUERY1 $QUERY2 $DBDIR $OUTDIR $JOBNAME --threads $THREADS --max-ram $MAXRAM > "$OUTDIR/${JOBNAME}-3.log" 2> "$OUTDIR/${JOBNAME}-3.err"
$METABULI_PATH classify $QUERY1 $QUERY2 $DBDIR $OUTDIR $JOBNAME --threads $THREADS --max-ram $MAXRAM > "$OUTDIR/${JOBNAME}-4.log" 2> "$OUTDIR/${JOBNAME}-4.err"
$METABULI_PATH classify $QUERY1 $QUERY2 $DBDIR $OUTDIR $JOBNAME --threads $THREADS --max-ram $MAXRAM > "$OUTDIR/${JOBNAME}-5.log" 2> "$OUTDIR/${JOBNAME}-5.err"