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

# 4. Make a database
## Let GTDB_TAXDUMP be the unzipped directory of file you downloaded in step 3

metabuli build DBDIR DBDIR/downloaded_files.txt GTDB_TAXDUMP/taxid.map --taxonomy-path GTDB_TAXDUMP --gtdb 1
```

## Database update
```
# 1. Download a human genome
aria2c -x 16 -s 16 -d DBDIR/genomes https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/009/914/755/GCF_009914755.1_T2T-CHM13v2.0/GCF_009914755.1_T2T-CHM13v2.0_genomic.fna.gz


```
