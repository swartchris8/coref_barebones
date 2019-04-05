# import en_core_web_lg
import en_coref_lg
import apache_beam as beam
import ujson as json
import logging


def extract_entities(nlp, text):
    doc = nlp(text)
    entities = [{"entity_text": entity.text, "label": entity.label} for entity in doc.ents]
    entity_dict = {u"entities": entities, u"text": text}
    return entity_dict


class EntityExtraction(beam.DoFn):

    def __init__(self):
        self.nlp = en_coref_lg.load()

    def process(self, element, *args, **kwargs):
        if element and isinstance(element, basestring):
            element = json.loads(element)
        try:
            entity_dict = extract_entities(self.nlp, element["text"])
            yield json.dumps(entity_dict)
        except Exception as e:
            logging.error("Can not extract entities from {}".format(element["text"]) + str(e))


if __name__ == '__main__':
    nlp = en_coref_lg.load()
    with open("test.json", "r") as f:
        content = f.readlines()
    for line in content:
        input_dict = json.loads(line)
        print(input_dict, type(input_dict))
        entity_dict = extract_entities(nlp, input_dict["text"])
        print(entity_dict)
