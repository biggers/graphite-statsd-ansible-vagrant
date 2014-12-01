#
# graphite-statsd-ansible-vagrant  Makefile -- how We Do This (devel, deploy)
#
# NOTE: the build, packaging & run "target" is Ubuntu 12.04+
#   - use 'devstack' or Github 'quantum-ansible', or "SVL" (someday)
#   - this set-up, is not "ported" to run on MacOS X !
#
# NOTE: must use real Tabs, not spaces, in a Makefile!

# -------- targets

.PHONY: symlink_hosts vg_provision ans_play

PYTHON = /usr/bin/python

PFX = .

buck_stops_here:
	echo "See the comments @ the top of this Makefile (first) !"

symlink_hosts:
	ln -s  .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory ansible_hosts

LOG = vgprov.$$$$.log
vg_provision:
	script -c "vagrant provision --provision-with ansible" ${LOG}

LOG = anpb.$$$$.log
WTASK = 
VERBOSE =
ans_play:
	echo "WTASK=--start-at-task=statsd"
	vagrant up
	script -c "ansible-playbook -i ./ansible_hosts ${VERBOSE} "${WTASK}" --timeout 30  --forks 1  graphite.yml" ${LOG}
