# metabuli-app-analysis

## Database creation
```
# 1. Download GTDB metadata
./download_gtdb_metadata.sh DBDIR

# 2. Download high quality GTDB representative genomes
## 90% complete and 5% contamination
./download_gtdb_hq_genomes.sh DBDIR 90 5

# 3. Download GTDB taxonomy
https://github.com/shenwei356/gtdb-taxdump/releases

# 4. Make a database 5 times
## Let GTDB_TAXDUMP be the unzipped directory of file you downloaded in step 3

./run_build.sh METABULI_PATH DBDIR GTDB_TAXDUMP THREADS MAXRAM
## It runs the command below 5 times
## metabuli build DBDIR DBDIR/downloaded_files.txt GTDB_TAXDUMP/taxid.map --taxonomy-path GTDB_TAXDUMP --gtdb 1 --threads TRHEADS --max-ram MAXRAM --make-library 0
```

## Database update
```
# 1. Download genbank viral genomes
Dependencies: wget, awk, aria2c

./download_genbank_viral_genomes.sh VIRAL_GENOMES_DIR

# 2. Prepare ICTV taxonomy dump files and accession2taxid mapping
Dependencies: wget, awk, csvtk, taxonkit

./prepare-ictv-taxdump.sh ICTV_TAXONOMY_DIR
./prepare-accession2taxid.sh ICTV_TAXONOMY_DIR

# 3. Creat a new taxa list
## DBDIR is the directory used in "Database creation" section.
find viral_genbank -name "*.fna.gz" -print0 | xargs -0 realpath > viral_genomes.txt
metabuli createnewtaxalist DBDIR viral_genomes.txt ICTV_TAXONOMY_DIR ICTV_TAXONOMY_DIR/ictv.accession2taxid NEW_DBDIR

# 4. Update the database
metabuli updateDB NEW_DBDIR genomes.txt NEW_DBDIR/newtaxa.accession2taxid DBDIR --new-taxa NEW_DBDIR/newtaxa.tsv --make-library 0

```

## Classify

```
# 1. classify human gut short reads
## Sample data: SRR24315757

./run_classify_short.sh METABULI_PATH SRR24315757_1.fastq SRR24315757_2.fastq DBDIR OUTDIR short MAXRAM THREADS

# 2. classify human gut long reads
## Sample data: SRR15489014
./run_classify_long.sh METABULI_PATH SRR15489014.fastq DBDIR OUTDIR long MAXRAM THREADS
```
