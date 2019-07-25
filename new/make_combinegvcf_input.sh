find /data/DCEG_CCSSExome/JUL19_rebc_gvcfs/ | grep "vcf.gz$" | split -l 36 -a 4 -d - gvcf_combine_portion_ && \
    for i in `find . | grep "gvcf_combine_portion_"`
    do
        sed -i "s/^/\-\-variant /g" $i && \
        sed -i "s/$/ \\\/g" $i && \
        sed -i "$ s/.$//" $i
    done
