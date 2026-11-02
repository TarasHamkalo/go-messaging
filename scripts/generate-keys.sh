#!/bin/bash

mkdir -p resources/certs ./resources/jwt-keys

# 1. Generate JWT RSA Key Pair (Private & Public)
openssl genrsa -out resources/jwt-keys/private.key 2048
openssl rsa -in resources/jwt-keys/private.key -pubout -out resources/jwt-keys/public.key

# 2. Generate TLS Self-Signed Certificate & Private Key for localhost
openssl req -x509 \
  -newkey rsa:2048 \
  -nodes \
  -keyout resources/certs/localhost-privkey.pem \
  -out resources/certs/localhost-cert.pem \
  -sha256 \
  -days 365 \
  -subj "/CN=localhost" \
  -addext "subjectAltName=DNS:localhost,IP:127.0.0.1"


echo "Keys and certificates successfully generated see resources/"
