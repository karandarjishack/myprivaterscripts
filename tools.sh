#Before running the script, make sure to make the following things
#You are in root
echo "Let the Fun Begin"

sudo apt update
sudo apt upgrade
wget https://go.dev/dl/go1.18.2.linux-amd64.tar.gz
gunzip go1.18.2.linux-amd64.tar.gz
tar -xvf go1.18.2.linux-amd64.tar
cp go/bin/go /usr/local/bin
export GO111MODULE=on
cp -R go /usr/local
wget https://github.com/projectdiscovery/subfinder/releases/download/v2.4.8/subfinder_2.4.8_linux_amd64.tar.gz
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
git clone https://github.com/projectdiscovery/nuclei-templates.git
git clone https://github.com/shifa123/nuclei-templates-all.git
wget https://github.com/projectdiscovery/httpx/releases/download/v1.1.0/httpx_1.1.0_linux_amd64.tar.gz
wget https://github.com/hahwul/dalfox/releases/download/v2.7.5/dalfox_2.7.5_linux_amd64.tar.gz
go install github.com/tomnomnom/gf@latest
git clone https://github.com/tomnomnom/gf.git
git clone https://github.com/1ndianl33t/Gf-Patterns.git
go install github.com/tomnomnom/waybackurls@latest
go install -v github.com/projectdiscovery/interactsh/cmd/interactsh-client@latest
go install github.com/tomnomnom/qsreplace@latest
git clone https://github.com/iamj0ker/bypass-403.git
git clone https://github.com/danielmiessler/SecLists.git
go install github.com/ffuf/ffuf@latest


gunzip *.gz
tar -xvf subfinder_2.4.8_linux_amd64.tar
tar -xvf httpx_1.1.0_linux_amd64.tar
tar -xvf dalfox_2.7.5_linux_amd64.tar

unzip *.zip

rm -rf *.tar


mv subfinder /usr/local/bin
mv httpx /usr/local/bin
mv dalfox /usr/local/bin

cd go/bin
mv gf /usr/local/bin
mv nuclei /usr/local/bin
mv waybackurls /usr/local/bin
mv interactsh-client /usr/local/bin
mv qsreplace /usr/local/bin
mv ffuf /usr/local/bin
cd ../../

echo "Done"
