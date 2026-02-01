include { FASTQC as FASTQC_RAW }     from '../modules/fastqc.nf'
include { FASTQC as FASTQC_TRIMMED } from '../modules/fastqc.nf'
include { CUTADAPT } from '../modules/cutadapt.nf'
include { BWA_ALIGN } from '../modules/alignment.nf'
include { VARIANT_CALLING } from '../modules/variant_calling.nf'

workflow QC_PIPELINE {

    channel
        .fromPath("${params.fastq_dir}/*.fastq.gz")
        .set { reads_ch }

    FASTQC_RAW(reads_ch)

    trimmed_ch = CUTADAPT(reads_ch)

    FASTQC_TRIMMED(trimmed_ch)

    bam_ch = BWA_ALIGN(trimmed_ch, params.ref_genome)

    VARIANT_CALLING(bam_ch, params.ref_genome)
}
