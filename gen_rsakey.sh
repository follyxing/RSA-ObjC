#!/usr/bin/env bash
echo "Generating RSA key pair ..."
echo "1024 RSA key: private_key.pem"
openssl genrsa -out private_key.pem 1024

echo "create private_key_pkcs#8.pem"
openssl pkcs8 -topk8 -in private_key.pem -out private_key_pkcs#8.pem -nocrypt

echo "create public_key_pkcs.pem"
openssl rsa -in private_key.pem -RSAPublicKey_out -out public_key.pem

echo "create public_key_pkcs#8.pem"
openssl rsa -in private_key.pem -out public_key_pkcs#8.pem -pubout


echo "=========FINISHED==========="           