#!/bin/bash

REFERENCE=/data/DCEG_CCSSExome/refs/Homo_sapiens_assembly19.fasta
DBSNP=/data/DCEG_CCSSExome/refs/dbsnp_134_b37.leftAligned.vcf
gvcf_feed=$1

java -Xmx64G -Djava.io.tmpdir=/lscratch/${SLURM_JOBID}/ \
    -XX:ParallelGCThreads=4 -jar \
    ${GATK_JAR} \
    -T CombineGVCFS \
    -R ${REFERENCE} \
    --dbsnp ${DBSNP} \
    $(echo -n "$(cat ${gvcf_feed} )")
    -nct 8 \
    -o "/data/DCEG_CCSSExome/combined_rebc.${SLURM_JOBID}.g.vcf"
