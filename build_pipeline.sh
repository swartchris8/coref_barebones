#!/usr/bin/env bash
echo "Removing contents of dist"
rm -rf dist/
echo "Building source distribution tar in dist"
python setup.py sdist --formats=tar
pip install dist/entityextraction-0.0.1.tar
python entity/extract_entities.py

#echo "Running extraction code without pipeline"
#source .env
#echo "Running pipeline locally"
#/bin/bash launch_local.sh
#echo "Running pipeline on dataflow"
#/bin/bash launch_dataflow.sh