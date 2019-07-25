for i in `find . | grep "gvcf_combine_portion"`
do
    cat gatk_comb_base.sh $i > gvcf_submit_script_$(echo $i | grep -o "[0-9]\{4\}").sh && \
    sed -i "s/PHOLD/$(echo $i | grep -o "[0-9]\{4\}")/g" gvcf_submit_script_$(echo $i | grep -o "[0-9]\{4\}").sh && \
    chmod 777 gvcf_submit_script_$(echo $i | grep -o "[0-9]\{4\}").sh
done
