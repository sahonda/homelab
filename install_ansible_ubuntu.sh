#!/bin/bash 
set -Eeu -o pipefail -o noclobber -x

[[ ${UID} == 0 ]] && sudo='' || sudo='sudo'

${sudo} apt update
${sudo} apt -y install ansible-core
${sudo} apt -y upgrade

${sudo} mkdir /etc/ansible
${sudo} cat <<-_ENDOF_CFGFILE >/etc/ansible/ansible.cfg
[defaults]
host_key_checking=False
_ENDOF_CFGFILE

