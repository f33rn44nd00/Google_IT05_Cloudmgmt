echo $PATH
#will output the problem (/java/bin:/snap/bin)
ls /
#shows an error (ls: command not found) since PATH does not contain it

#to get back to a working env. run:
export PATH=/bin:/usr/bin
#changes output for:
ls /

#rule responsible for the breakage
cd /etc/puppet/code/environments/production/modules/profile/manifests

cat init.pp

#main thing is to change the PATH instruction in the init script so that it APPENDS instead of replacing
sudo nano init.pp

#The line content => "PATH=/java/bin\n" should be changed to content => "PATH=\$PATH:/java/bin\n"
#also edit the permissions to 0644

sudo puppet agent -v --test

echo $PATH
#should now display all the correct paths
