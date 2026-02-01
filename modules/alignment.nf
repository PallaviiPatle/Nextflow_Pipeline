
process BWA_ALIGN {

    input:
    path reads
    path ref

    output:
    path "${reads.simpleName}.sorted.bam"
    path "${reads.simpleName}.sorted.bam.bai"

    script:
    """
    ${params.bwa_bin} mem ${ref} ${reads} | \
    ${params.samtools_bin} view -Sb - | \
    ${params.samtools_bin} sort -o ${reads.simpleName}.sorted.bam

    ${params.samtools_bin} index ${reads.simpleName}.sorted.bam
    """
}
