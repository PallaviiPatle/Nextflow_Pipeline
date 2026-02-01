process FASTQC {

    input:
    file reads

    output:
    file "*_fastqc.html"
    file "*_fastqc.zip"

   script:
"""
${params.fastqc_bin} ${reads}
"""

}


 
