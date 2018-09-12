#!/bin/bash

REFERENCE=
rbam=$1
obam_base=$(basename $rbam .bam)

#java -Xmx16G -Djava.io.tmpdir=/lscratch/${SLURM_JOBID} \
java -Xmx16G -Djava.io.tmpdir=/lscratch/${SLURM_JOBID} \
    -XX:ParallelGCThreads=8 -jar \
    ${GATK_JAR} \
    -T HalpotypeCaller \
    -R ${REFERENCE} \
    -I ${rbam} \
    -nct 8 \
    -o "${obam_base}.gatkhc.raw.snps.indels.g.vcf"
