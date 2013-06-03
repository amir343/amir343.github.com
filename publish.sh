#! /bin/sh
 
SITE='_site'
FTP_SITE='ftp.amirmoulavi.com'
 
cd $SITE
echo 'Stepping into' $SITE
rm -rf bin
 
echo '===================================================='
echo 'Uploading site:' $FTP_SITE
echo '===================================================='
lftp -u $1,$2 $FTP_SITE <<EOF
set ftp:ssl-allow no
cd public_html
mirror -Rp 
quit 0
EOF

echo '===================================================='
echo 'Site published'
