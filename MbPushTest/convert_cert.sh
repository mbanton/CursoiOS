#!/bin/bash

CERT_FROM_APPLE=aps_development.cer
CERT_P12=key.p12
OUT_FILE=cert_push_from_php.pem

echo
echo "Generate certificate to apple push from PHP."
echo "More info on: http://www.raywenderlich.com/32960/"
echo

if [ ! -e $CERT_FROM_APPLE ]; then
    echo
    echo "File $CERT_FROM_APPLE not found. Generate cert in: https://developer.apple.com/account/ios/certificate/certificateList.action"
    echo
    exit 1
fi

if [ ! -e $CERT_P12 ]; then
    echo
    echo "File $CERT_P12 not found. Export from your OS X keychain."
    echo
    exit 1
fi

openssl x509 -in $CERT_FROM_APPLE -inform der -out PushChatCert.pem
openssl pkcs12 -nocerts -out PushChatKey.pem -in $CERT_P12

cat PushChatCert.pem PushChatKey.pem > $OUT_FILE

rm -f PushChatCert.pem
rm -f PushChatKey.pem

echo
echo "File $OUT_FILE generated sucessfuly. Please run php simplepush.php"
echo

