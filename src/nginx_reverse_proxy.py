#!/usr/bin/env python3

# import
import yaml
import os
from string import Template


class ReverseProxy():

    @staticmethod
    def read_yml(configfile: str):
        with open(configfile, 'r') as f:
            return yaml.load(f, Loader=yaml.FullLoader)

    @staticmethod
    def generate_nginx_conf(file: str, output: str, opt=None):
        config_obj = ReverseProxy.read_yml('../config.yml')
        reverse_proxy_config = ''

        opt = {
            'local': False,
            'containers': True
        }

        ip = config_obj['system']['ip']
        domain = config_obj['system']['domain']
        incoming_port = config_obj['system']['reverseproxy']['incoming_port']


        if opt.get('local'):
            for i, container in config_obj['services']['local'].items():
                if len(container['webport']) > 0:
                    web_port = str(container['webport'][0]).replace(':', '')
                    subdomain = container['name']
                    reverse_proxy_config += ReverseProxy.generate_server_block(ip=ip, incoming_port=incoming_port, domain=domain, subdomain=subdomain, app_port=web_port)

        if opt.get('containers'):
            for i, container in config_obj['services']['containers'].items():
                print(container['name'])
                if len(container['webport']) > 0:
                    web_port = str(container['webport'][0]).replace(':', '')
                    subdomain = container['name']
                    reverse_proxy_config += ReverseProxy.generate_server_block(ip=ip, incoming_port=incoming_port, domain=domain, subdomain=subdomain, app_port=web_port)

        with open(output, 'w') as f:
            f.write(reverse_proxy_config)
        
        return reverse_proxy_config

    @staticmethod
    def generate_server_block(ip, incoming_port, domain, subdomain, app_port, default=False):
        block_template = Template(
            "server {\n"
            "    listen $ip:$incoming_port$default_server;\n"
            "    server_name $subdomain.$domain;\n"
            "    access_log /var/log/nginx/$subdomain.log;\n"
            "    location / {\n"
            "        proxy_pass http://$ip:$app_port;\n"
            "    }\n"
            "}\n"
        )
        default_server = ''
        if default:
            default_server = ' default'
        block = block_template.substitute(
            ip=ip, incoming_port=incoming_port, domain=domain, subdomain=subdomain, app_port=app_port, default_server=default_server)

        return block


if __name__ == "__main__":
    ReverseProxy.generate_nginx_conf("../config.yml", "test.txt")
