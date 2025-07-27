#!/bin/bash

OUTPUT_DIR="${PWD}/quickstart-output"
mkdir -p "${OUTPUT_DIR}"

INPUT_DIR="$PWD/quickstart-testdata"

docker run --gpus 1 \
  -v "${INPUT_DIR}":"/input" \
  -v "${OUTPUT_DIR}":"/output" \
  google/deepvariant:1.9.0 \
  /opt/deepvariant/bin/run_deepvariant \
  --model_type=WGS \
  --vcf_stats_report=true \
  --ref=/input/ucsc.hg19.chr20.unittest.fasta \
  --reads=/input/NA12878_S1.chr20.10_10p1mb.bam \
  --regions "chr20:10,000,000-10,010,000" \
  --output_vcf=/output/output.vcf.gz \
  --output_gvcf=/output/output.g.vcf.gz \
  --intermediate_results_dir /output/intermediate_results_dir \
  --num_shards=1
