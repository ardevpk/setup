import os
from requests import get


cwd = os.getcwd()
initial = os.path.join(cwd, 'setup/initial.sh')
os.system(f'sudo chmod +x {initial}')
os.system(f'sudo {initial}')

nginx = '/etc/nginx/nginx.conf'
root = '/home/ubuntu'
django = '/etc/nginx/sites-available/django.conf'
gunicorn = '/etc/supervisor/conf.d/gunicorn.conf'

with open(nginx, 'r') as f:
    lines = f.readlines()
    hash =  '# server_names_hash_bucket_size 64;'
    if lines[0] == 'user www-data;\n': lines[0] = 'user root;\n'
    for count, line in enumerate(lines):
        if hash in line:
            lines[count] = '\tserver_names_hash_bucket_size 128;\n'
    with open(nginx, 'w') as g:
        g.writelines(lines)


with open(django, 'r') as f:
    lines = f.readlines()
    hash =  'server_name'
    ip = get('https://api.ipify.org').text
    for count, line in enumerate(lines):
        if hash in line:
            lines[count] = f' server_name {ip};\n'
        if root in line:
            lines[count] = lines[count].replace(root, cwd)
    with open(django, 'w') as g:
        g.writelines(lines)


with open(gunicorn, 'r') as f:
    lines = f.readlines()
    hash =  'server_name'
    ip = get('https://api.ipify.org').text
    for count, line in enumerate(lines):
        if root in line:
            lines[count] = lines[count].replace(root, cwd)
    with open(gunicorn, 'w') as g:
        g.writelines(lines)
