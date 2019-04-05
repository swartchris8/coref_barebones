#!/usr/bin/env bash
python -m main \
  --input test.json \
  --output output.json \
  --job_name entitylocalrun \
  --project $PROJECT_NAME  \
  --runner DirectRunner \
  --setup_file ./setup.py \
