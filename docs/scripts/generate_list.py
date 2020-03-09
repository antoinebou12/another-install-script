#!/usr/bin/env python3

# import
import yaml

#W.I.P

class GeneratorAIS(object):
    def __init__(self, output_fname: str, config_fname: str, config_type="yaml", config_obj=None):
        self.output_fname = output_fname
        self.config_fname = config_fname
        self.config_type = config_type
        self.config_obj = None
        self.md_buffer = ''

        if config_obj is not None:
            self.config_obj = config_obj

        if config_type == "yaml" or config_type == "yml":
            self.config_obj = GeneratorAIS.read_yml(config_fname)

    @staticmethod
    def read_yml(configfile: str):
        with open(configfile, 'r') as f:
            return yaml.load(f, Loader=yaml.FullLoader)

    def generate_containers_list(self):
        containers_list = []
        for i, container in self.config_obj['services']['containers'].items():
            print(i)
            containers_list.append({'name': container['name'],'desc': container['short_description']})
        return containers_list

    def write_containers_list_text(self, output=None):
        containers_list = self.generate_containers_list()
        with open(output, 'w') as f:
            for i in containers_list:
                f.write(f"{i['name']},{i['desc']}\n")

if __name__ == "__main__":
    generator = GeneratorAIS(output_fname="", config_fname="/home/antoine/Code/another-install-script/src/config.yml", config_type="yaml")
    generator.write_containers_list_text('../../src/containers/containers.txt')

