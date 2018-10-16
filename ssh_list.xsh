#!/usr/bin/env xonsh

import sys

cd ~/.ssh
dir = $(pwd).replace('\n', '')

result = 'Selection'.ljust(13) + '\t' + 'Host'.ljust(20) + '\n'
result += '-----------------------------------------------------' + '\n'
target_hosts = []
with open(dir + '/config') as f:
    for row in f:
        if row.startswith('Host '):
            host = row.replace('Host ', '').replace('\n', '')
            target_hosts.append(host)
            result += str(len(target_hosts) - 1).ljust(13) + '\t' + host.ljust(20) + '\n'
print(result)

if len(target_hosts) == 0:
    sys.exit()
else:
    selected_num = input('please select number:')

if not selected_num:
    print('process is over.')
    sys.exit()

if not selected_num.isnumeric():
    print('invalid number.')
    sys.exit()

if int(selected_num) > (len(target_hosts) - 1):
    print('invalid number.')
    sys.exit()

print('start connection.')
ssh @(target_hosts[int(selected_num)])
