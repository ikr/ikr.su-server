location ^~ /.well-known/acme-challenge {
    auth_basic "off";
    alias /var/lib/dehydrated/acme-challenges;
}
