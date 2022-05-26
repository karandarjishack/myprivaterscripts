#Before running the script, make sure to make the following things
#You are in root
echo "Let the Fun Begin"

wget https://github.com/projectdiscovery/subfinder/releases/download/v2.4.8/subfinder_2.4.8_linux_amd64.tar.gz
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
git clone https://github.com/projectdiscovery/nuclei-templates.git
wget https://github.com/projectdiscovery/httpx/releases/download/v1.1.0/httpx_1.1.0_linux_amd64.tar.gz
wget https://github.com/hahwul/dalfox/releases/download/v2.7.5/dalfox_2.7.5_linux_amd64.tar.gz
go install github.com/tomnomnom/gf@latest
git clone https://github.com/1ndianl33t/Gf-Patterns.git
go install github.com/tomnomnom/waybackurls@latest
go install -v github.com/projectdiscovery/interactsh/cmd/interactsh-client@latest
go install github.com/tomnomnom/qsreplace@latest
git clone https://github.com/iamj0ker/bypass-403.git
git clone https://github.com/shifa123/nuclei-templates-all.git
git clone https://github.com/danielmiessler/SecLists.git
go install github.com/ffuf/ffuf@latest


gunzip *.gz
tar -xvf subfinder_2.4.8_linux_amd64.tar
tar -xvf nuclei_2.3.8_linux_amd64.tar
tar -xvf httpx_1.1.0_linux_amd64.tar
tar -xvf dalfox_2.7.5_linux_amd64.tar

unzip *.zip

cp /root/go/bin/nuclei /usr/local/bin/
cp subfinder /usr/local/bin
cp httpx /usr/local/bin
cp /root/go/bin/gf /usr/local/bin/
cp /root/go/bin/waybackurls /usr/local/bin/
mkdir .gf
mv /root/Gf-Patterns/*json /root/.gf
cp /root/go/bin/interactsh-client /usr/local/bin/
cp /root/go/bin/qsreplace /usr/local/bin/
mv /root/bypass-403/bypass-403.sh /usr/local/bin/
mv /root/SecLists /usr/share/wordlists/
cp /root/go/bin/ffuf /usr/local/bin/

rmdir Gf-Patterns


echo "Done"
