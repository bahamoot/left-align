#!/bin/bash -l
#SBATCH -A b2011026
#SBATCH -p node
#SBATCH -n 32
#SBATCH -t 1:00:00
#SBATCH -J coca_la200

start_time=$(date +%s)
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#script_dir="/bubo/home/h10/jessada/private/hbvdb/testcase/performance"
data_dir="/home/jessada/development/scilifelab/master_data"
vcf_dir="$data_dir/200danes/vcf"
out_dir=$script_dir/../out

gatk="/home/jessada/development/scilifelab/tools/GenomeAnalysisTK-1.4-13-gef50e77/GenomeAnalysisTK.jar"
output_file=$out_dir/la.log
#for i in {8812..8831}
for i in {8812..8813}
do
    echo "SRR02$i.var.flt.la.vcf"

    java -Xmx2g -jar $gatk -R $data_dir/reference/Homo_sapiens.GRCh37.57.dna.concat.fa -T LeftAlignVariants --variant $vcf_dir/SRR02$i.var.flt.vcf -o $out_dir/SRR02$i.var.flt.la.vcf > la.log 

    end_time=$(date +%s)
    time_diff=$((end_time-start_time))

    echo total excutetime so far $time_diff seconds
done

