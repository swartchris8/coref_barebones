#!/usr/bin/env bash
python -m main \
  --input test.json \
  --output output.json \
  --temp_location $TEMP_LOCATION
  --job_name entitydataflowrun \
  --project $PROJECT_NAME  \
  --runner DataflowRunner \
  --setup_file ./setup.py \
  --num_workers 1 \
  --max_num_workers 4 \
  --disk_size_gb 250 \
  --worker_machine_type n1-highmem-16 \
  --zone europe-west1-d \
