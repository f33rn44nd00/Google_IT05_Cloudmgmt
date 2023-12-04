# Run command to obtain information about server status:
sudo systemctl status apache2

# attempt to restart the server:
sudo systemctl restart apache2

# Run again to find root cause:
sudo systemctl status apache2

# Some process is using port 80, to find out which:
sudo netstat -nlp

# With the pID number written down, you can run:
ps -ax | grep python3 # to find out which program it is

# Once found, check it: }
cat /usr/local/bin/jimmytest.py

# Use the pID to kill it:
sudo kill [process-id]

# Confirm it died:
ps -ax | grep python3

#It didn't so it probably has an associated service, check with:
sudo systemctl --type=service | grep jimmy

# To stop it:
sudo systemctl stop jimmytest && sudo systemctl disable jimmytest

# Confirm that port 80 is released:
sudo netstat -nlp

#This should work now:
sudo systemctl start apache2