process VARIANT_CALLING {

    input:
    path bam
    path ref

    output:
    path "${bam.simpleName}.vcf.gz"
    path "${bam.simpleName}.vcf.gz.tbi"

    script:
    """
    ${params.bcftools_bin} mpileup -f ${ref} ${bam} | \
    ${params.bcftools_bin} call -mv -Oz -o ${bam.simpleName}.vcf.gz

    ${params.bcftools_bin} index ${bam.simpleName}.vcf.gz
    """
}
