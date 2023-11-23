#--- PART 1 - Create a VM from Cloud console ---
#After connecting to the VM created in Cloud console copy the repo:

git clone https://www.github.com/google/it-cert-automation-practice.git

cd ~/it-cert-automation-practice/Course5/Lab3
ls

sudo cp hello_cloud.py /usr/local/bin/
sudo cp hello_cloud.service /etc/systemd/system

sudo systemctl enable hello_cloud.service


# Shut down the VM

# --- PART 2 - 