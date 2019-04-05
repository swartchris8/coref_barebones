import argparse
import apache_beam as beam
from apache_beam.io import WriteToText, ReadFromText
from apache_beam.options.pipeline_options import PipelineOptions
from apache_beam.options.pipeline_options import SetupOptions
from entity.extract_entities import EntityExtraction

def run(argv=None):
    """Main entry point; defines and runs the entity extraction pipeline."""
    parser = argparse.ArgumentParser()
    parser.add_argument('--input',
                        required=True,
                        help='Input JSON to read')
    parser.add_argument('--output',
                        required=True,
                        help='Output file to write results to')

    known_args, pipeline_args = parser.parse_known_args(argv)

    pipeline_options = PipelineOptions(pipeline_args)
    pipeline_options.view_as(SetupOptions).save_main_session = True
    with beam.Pipeline(options=pipeline_options) as p:
        records = p | 'ReadRecords' >> ReadFromText(known_args.input)
        entities = records | 'ExtractEntities' >> beam.ParDo(EntityExtraction())
        entities | 'WriteEntities' >> WriteToText(known_args.output, file_name_suffix='entities.json.gz')


if __name__ == '__main__':
    run()