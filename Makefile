all: help

help:
	@echo ""
	@echo "-- Help Menu"
	@echo ""   1. make gluster

gluster: requirements provision

example: inventory

inventory:
	-@cp -i inventory.example inventory

requirements:
	-@mkdir -p /etc/ansible/roles
	ansible-galaxy install -r requirements.txt
	echo `date -I`>> requirements

provision:
	ansible-playbook -i inventory playbooks/provision.yml
