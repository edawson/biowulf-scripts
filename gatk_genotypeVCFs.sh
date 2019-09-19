#!/bin/bash

module load GATK

REFERENCE=/data/DCEG_CCSSExome/refs/Homo_sapiens_assembly19.fasta
DBSNP=/data/DCEG_CCSSExome/refs/dbsnp_134_b37.leftAligned.vcf

ddir=/data/DCEG_CCSSExome/rebc_norms_jul2019/
CHROM=$1

java -Xmx64G -Djava.io.tmpdir=/lscratch/${SLURM_JOBID}/ \
    -XX:ParallelGCThreads=4 -jar \
    ${GATK_JAR} \
    -T GenotypeGVCFs \
    -L ${CHROM} \
    -R ${REFERENCE} \
    --dbsnp ${DBSNP} \
    --variant ${ddir}/combined_rebc.0000.${CHROM}.g.vcf.gz \
    --variant ${ddir}/combined_rebc.0001.${CHROM}.g.vcf.gz \
    --variant ${ddir}/combined_rebc.0002.${CHROM}.g.vcf.gz \
    --variant ${ddir}/combined_rebc.0003.${CHROM}.g.vcf.gz \
    --variant ${ddir}/combined_rebc.0004.${CHROM}.g.vcf.gz \
    --variant ${ddir}/combined_rebc.0005.${CHROM}.g.vcf.gz \
    --variant ${ddir}/combined_rebc.0006.${CHROM}.g.vcf.gz \
    --variant ${ddir}/combined_rebc.0007.${CHROM}.g.vcf.gz \
    --variant ${ddir}/combined_rebc.0008.${CHROM}.g.vcf.gz \
    --variant ${ddir}/combined_rebc.0009.${CHROM}.g.vcf.gz \
    --variant ${ddir}/combined_rebc.0010.${CHROM}.g.vcf.gz \
    --variant ${ddir}/combined_rebc.0011.${CHROM}.g.vcf.gz \
    --variant ${ddir}/combined_rebc.0012.${CHROM}.g.vcf.gz \
    --variant ${ddir}/combined_rebc.0013.${CHROM}.g.vcf.gz \
    --variant ${ddir}/combined_rebc.0014.${CHROM}.g.vcf.gz \
    --variant ${ddir}/combined_rebc.0015.${CHROM}.g.vcf.gz \
    --variant ${ddir}/combined_rebc.0016.${CHROM}.g.vcf.gz \
    --variant ${ddir}/combined_rebc.0017.${CHROM}.g.vcf.gz \
    --variant ${ddir}/combined_rebc.0018.${CHROM}.g.vcf.gz \
    --variant ${ddir}/combined_rebc.0019.${CHROM}.g.vcf.gz \
    -nt 8 \
    -o "/data/DCEG_CCSSExome/all.genotyped.combined_rebc.${CHROM}.g.vcf.gz"
