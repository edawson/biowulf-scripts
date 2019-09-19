#!/bin/bash

module load GATK

REFERENCE=/data/DCEG_CCSSExome/refs/Homo_sapiens_assembly19.fasta
DBSNP=/data/DCEG_CCSSExome/refs/dbsnp_134_b37.leftAligned.vcf

java -Xmx64G -Djava.io.tmpdir=/lscratch/${SLURM_JOBID}/ \
    -XX:ParallelGCThreads=4 -jar \
    ${GATK_JAR} \
    -T CombineGVCFs \
    -R ${REFERENCE} \
    --dbsnp ${DBSNP} \
    -o "/data/DCEG_CCSSExome/rebc_norms_jul2019/combined_rebc.PHOLD.g.vcf.gz" \
