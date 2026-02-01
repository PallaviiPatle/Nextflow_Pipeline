

process CUTADAPT {

    input:
    path reads

    output:
    path "${reads.simpleName}.trimmed.fastq.gz"

    
script:
"""
${params.cutadapt_bin} \
-o ${reads.simpleName}.trimmed.fastq.gz \
${reads}
"""
}
