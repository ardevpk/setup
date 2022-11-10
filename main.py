import os
from requests import get


cwd = os.getcwd()
initial = os.path.join(cwd, 'setup/initial.sh')
os.system(f'sudo chmod +x {initial}')
os.system(f'sudo {initial}')

with open('/etc/nginx/nginx.conf', 'r') as f:
    lines = f.readlines()
    hash =  '# server_names_hash_bucket_size 64;'
    if lines[0] == 'user www-data;\n': lines[0] = 'user root;\n'
    for count, line in enumerate(lines):
        if hash in line:
            lines[count] = '\tserver_names_hash_bucket_size 128;\n'
    with open('/etc/nginx/nginx.conf', 'w') as g:
        g.writelines(lines)


with open('/etc/nginx/sites-available/django.conf', 'r') as f:
    lines = f.readlines()
    hash =  'server_name'
    ip = get('https://api.ipify.org').text
    for count, line in enumerate(lines):
        if hash in line:
            lines[count] = f' server_name {ip};\n'
    with open('/etc/nginx/sites-available/django.conf', 'w') as g:
        g.writelines(lines)
