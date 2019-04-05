Basic entity extraction pipeline using Hugging Face's neural coreference spacy model https://github.com/huggingface/neuralcoref

### Installation

Run `pip install -e .` in a virtualenv 

All requirements are listed within `setup.py`

### Create dataset

```python
python create_data.py
```

### To run the piplline:

Set your env variables in `example_env`

Load all the env variables:
```bash
source example_env
```
Run pipeline locally:
```bash
./launch_local.sh
```
Run pipeline on Google Cloud Dataflow:

### To debug installation

Download Hugging Face's large neural coref model https://github.com/huggingface/neuralcoref-models/releases/download/en_coref_lg-3.0.0/en_coref_lg-3.0.0.tar.gz into this folder.

Comment out the `wget` `CustomCommand` from setup.py this way the neural coreference libary will be installed locally.

