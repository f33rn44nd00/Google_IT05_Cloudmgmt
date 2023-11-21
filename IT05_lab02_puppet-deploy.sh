#--- PART 1 - rules and packages ---
# go to directory for modules
cd /etc/puppet/code/environments/production/modules/packages

cat manifests/init.pp

#remember to update permissions
sudo chmod 646 manifests/init.pp

#update the init file with the rules for Debian and Redhat, refer to init.pp

#fetch the address of linux-instance with:
gcloud compute instances describe linux-instance --zone="Zone" --format='get(networkInterfaces[0].accessConfigs[0].natIP)'

#use the address to open another VM in the lab, then run:
sudo puppet agent -v --test

#if done correctly, it should apply the catalog
#Verify by testing golang:
apt policy golang


#--- PART 2 - Machine information ---
#go to the machine info directory:
cd /etc/puppet/code/environments/production/modules/machine_info

#check init.pp to see that the machine info is not properly stored:
cat manifests/init.pp

#we need to add the info for windows, refer to init.pp part 2
#remember to update permissions first:
sudo chmod 646 manifests/init.pp

#Puppet Templates
#to look at templates
cat templates/info.erb

sudo chmod 646 templates/info.erb

#open with nano and add the line (without hashtag) at the bottom of the template:
#Network Interfaces: <%= @interfaces %>

#rerun puppet
sudo puppet agent -v --test

#which should update the machine_info file:
cat /tmp/machine_info.txt

#--- PART 3 - Reboot machine ---
#back in the puppet master VM run:
sudo mkdir -p /etc/puppet/code/environments/production/modules/reboot/manifests

#go to the dir:
cd /etc/puppet/code/environments/production/modules/reboot/manifests

#create an init.pp file:
sudo touch init.pp
sudo nano init.pp

#update contents of init, refer to init.pp Part 3

#to ensure execution, the new module needs to be part of site.pp
sudo nano /etc/puppet/code/environments/production/manifests/site.pp 

#Add a line for the new module "class { 'reboot' : }"

#Again in the linux-instance client, run:
sudo puppet agent -v --test




