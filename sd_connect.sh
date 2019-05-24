# connect vpn
sudo vpnc /etc/vpnc/sdumont.conf

# enter sdumont
ssh sara.mortara@login.sdumont.lncc.br

# disconnect
vpnc-disconnect

## options to copy multiple files with space

### works only for a few files
find . -type f -name "*.txt" -print0 | xargs -n 1 --null cp -t para

### avoiding xargs: argument line too long
find . -type f -name "*bin*ensemble*50.tif" | xargs cp -t /scratch/modler/sara.mortara/IIS_download/tif_files/generalistas/bin

find . -type f -name "*bin*ensemble*50.tif" -exec cp -t /scratch/modler/sara.mortara/IIS_download/tif_files/generalistas/bin/ {} +

find . -type f -name "*bin*ensemble*50.tif" -exec cp -t /scratch/modler/sara.mortara/IIS_download/tif_files/ameacadas/bin/ {} +

