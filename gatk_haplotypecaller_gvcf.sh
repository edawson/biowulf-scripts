#!/bin/bash

REFERENCE=/data/DCEG_CCSSExome/refs/Homo_sapiens_assembly19.fasta
DBSNP=/data/DCEG_CCSSExome/refs/dbsnp_134_b37.leftAligned.vcf
rbam=$1
obam_base=$(basename $rbam .bam)

java -Xmx32G -Djava.io.tmpdir=/lscratch/${SLURM_JOBID}/ \
    -XX:ParallelGCThreads=4 -jar \
    ${GATK_JAR} \
    -T HaplotypeCaller \
    -R ${REFERENCE} \
    -ERC GVCF \
    --dbsnp ${DBSNP} \
    -I ${rbam} \
    -nct 12 \
    -o "/data/DCEG_CCSSExome/rebc_gvcfs/${obam_base}.gatkhc.raw.snps.indels.g.vcf"
