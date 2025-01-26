#!/bin/bash 

METABULI_PATH=$1
QUERY=$2
DBDIR=$3
OUTDIR=$4
JOBNAME=$5
THREADS=$6
MAXRAM=$7
if [ -z "$METABULI_PATH" ] || [ -z "$QUERY" ] || [ -z "$DBDIR" ] || [ -z "$OUTDIR" ] || [ -z "$JOBNAME" ] || [ -z "$THREADS" ] || [ -z "$MAXRAM" ]; then
    echo "Usage: $0 <METABULI_PATH> <QUERY> <DBDIR> <OUTDIR> <JOBNAME> <THREADS> <MAXRAM>"
    exit 1
fi

mkdir -p $OUTDIR

$METABULI_PATH classify --seq-mode 3 $QUERY $DBDIR $OUTDIR $JOBNAME --threads $THREADS --max-ram $MAXRAM > "$OUTDIR/${JOBNAME}-1.log" 2> "$OUTDIR/${JOBNAME}-1.err"
$METABULI_PATH classify --seq-mode 3 $QUERY $DBDIR $OUTDIR $JOBNAME --threads $THREADS --max-ram $MAXRAM > "$OUTDIR/${JOBNAME}-2.log" 2> "$OUTDIR/${JOBNAME}-2.err"
$METABULI_PATH classify --seq-mode 3 $QUERY $DBDIR $OUTDIR $JOBNAME --threads $THREADS --max-ram $MAXRAM > "$OUTDIR/${JOBNAME}-3.log" 2> "$OUTDIR/${JOBNAME}-3.err"
$METABULI_PATH classify --seq-mode 3 $QUERY $DBDIR $OUTDIR $JOBNAME --threads $THREADS --max-ram $MAXRAM > "$OUTDIR/${JOBNAME}-4.log" 2> "$OUTDIR/${JOBNAME}-4.err"
$METABULI_PATH classify --seq-mode 3 $QUERY $DBDIR $OUTDIR $JOBNAME --threads $THREADS --max-ram $MAXRAM > "$OUTDIR/${JOBNAME}-5.log" 2> "$OUTDIR/${JOBNAME}-5.err"