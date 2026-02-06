# Variant Calling Pipeline

## Overview
This project implements a basic Nextflow pipeline for the analysis of
single-end DNA sequencing data. The pipeline performs quality control,
read trimming, alignment to a reference genome, and variant calling.

---

## Pipeline Workflow

Raw FASTQ  
↓  
FastQC (Raw Reads)  
↓  
Read Trimming  
↓  
FastQC (Trimmed Reads)  
↓  
Read Alignment  
↓  
Variant Calling  

---

## Pipeline Steps

### Step 1: Raw Read Quality Control
Quality assessment of raw FASTQ reads is performed using FastQC.
This step generates reports for base quality, GC content, and adapter contamination.

**Tool:** FastQC

---

### Step 2: Read Trimming
Low-quality bases and adapter sequences are removed from the reads
to improve downstream analysis.

**Tool:** Cutadapt (Single-end)

---

### Step 3: Quality Control After Trimming
FastQC is run again on the trimmed reads to confirm improvement
in read quality after trimming.

**Tool:** FastQC

---

### Step 4: Read Alignment
Trimmed reads are aligned to the reference genome (chr22).
The aligned reads are sorted and indexed to generate BAM files.

**Tools:** BWA, Samtools

---

### Step 5: Variant Calling
Variants are identified from the processed BAM files and written
to a VCF file.

**Tool:** BCFtools

---

## Input Data

- Single-end FASTQ file  
/data/Sample.fastq.gz
- Reference genome  
/reference/chr22.fa

Input data is not included in the GitHub repository.

---

## Output Data

- FastQC reports (raw and trimmed)
- Trimmed FASTQ file
- Sorted and indexed BAM files
- VCF file containing variants

All outputs are generated inside the Nextflow `work/` directory.

---

## Project Structure

```bash
nf_pipeline/
├── main.nf
├── nextflow.config
├── environment.yml
├── README.md
│
├── modules/
│   ├── fastqc.nf
│   ├── cutadapt.nf
│   ├── alignment.nf
│   └── variant_calling.nf
│
└── workflows/
  └── workflow.nf

```
### Create and Activate Conda Environment

 ```bash
conda env create -f environment.yml
conda activate bnf
```

### How to Run the Pipeline
```bash
nextflow run main.nf
nextflow run main.nf -resume
```
### How to Clone the Repository
```bash
git clone https://github.com/PallaviiPatle/Nextflow_Pipeline.git
cd nf_pipeline
```
