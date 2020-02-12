#!/usr/bin/env python3

# import
import yaml

#W.I.P

class MdTableGenerator(object):

    md_char = {
        'vbar': '|',
        'hbar': '-',
        'checkmark_emoji': '✔️',
        'X_emoji': '❌',
        'checkmark_fill': '[X]',
        'checkmark_empty': '[]',

    }

    def __init__(self, output_fname: str, config_fname: str, config_type="yaml", config_obj=None):
        self.output_fname = output_fname
        self.config_fname = config_fname
        self.config_type = config_type
        self.config_obj = None
        self.md_buffer = ''

        if config_obj is not None:
            self.config_obj = config_obj

        if config_type == "yaml" or config_type == "yml":
            self.config_obj = MdTableGenerator.read_yml(config_fname)

    @staticmethod
    def read_yml(configfile: str):
        with open(configfile, 'r') as f:
            try:
                return yaml.safe_load(f)
            except yaml.YAMLError as exc:
                print(exc)

    @staticmethod
    def generate_md_link(title: str, link: str):
        return f'[{title}]({link})'

    def generator_md_table(self, col_titles: list, row_values=None):

        table_str = ''
        links_str = []

        if row_values is None:
            row_values = self.config_obj

        for row_value in row_values['services']['containers'].values():
            print('/home/udocker/' + row_value['name'])
            links_str.append(
                f"{self.generate_md_link(str(row_value['name']), str(row_value['source-link']))}")
        
        len_large_link = len(max(links_str, key=len))

        for i, link in enumerate(links_str):
            if len(link) < len_large_link:
               links_str[i] = links_str[i] + (' ' * (len_large_link - len(link)))
            print(links_str[i])
               

        for title in col_titles:
            if title == 'Name':
                table_str += f"{self.md_char['vbar']} {title}" + \
                    (' ' * (len_large_link - len(title) + 2))
            else:
                table_str += f"{self.md_char['vbar']} {title} "

        table_str = table_str + f"{self.md_char['vbar']}"
        print(table_str)

    def generate_md_file(self):
        with open(self.output_fname, 'w') as f:
            f.write(str(self.md_buffer))


if __name__ == "__main__":

    mdtable = MdTableGenerator(
        "SERVER_LIST.md", "../../src/config.yml", "yaml")

    col_titles_list = ['Name', 'Docker', 'Ports',
                       'Volumes', 'Web server', 'Implemented']

    mdtable.generator_md_table(col_titles_list)
