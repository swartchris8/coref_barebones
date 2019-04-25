#!/usr/bin/env bash
python -m main \
  --input gs://${BUCKET_NAME}/input/test.json \
  --output gs://${BUCKET_NAME}/output/entity \
  --temp_location gs://${BUCKET_NAME}/tmp \
  --job_name entitydataflowrun \
  --project $PROJECT_NAME  \
  --runner DataflowRunner \
  --setup_file ./setup.py \
  --num_workers 1 \
  --max_num_workers 1 \
  --disk_size_gb 250 \
  --worker_machine_type n1-standard-2 \
  --zone europe-west1-d \
