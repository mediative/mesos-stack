#!/bin/sh
#
# Based on
# https://github.com/mesosphere/marathon-lb/blob/7ee4e51f7202320eddc23e5a2ff2a1dfab21a788/run#L25-L31

domain="$1"

openssl genrsa -out "$domain.key" 2048
openssl req -new -key "$domain.key" -out "$domain.csr" -subj /CN=*/
openssl x509 -req -in "$domain.csr" -out "$domain.cert" -signkey "$domain.key" -days 3650
cat "$domain.cert" "$domain.key" > "$domain.pem"
rm "$domain."{key,csr,cert}
