nginx:
  pkg.installed

dehydrated:
  pkg.installed

/etc/nginx/sites-enabled/ikr.su:
  file.managed:
    - source: salt://web-server/conf/ikr.su
    - require:
      - pkg: nginx
    - watch_in:
      - service: nginx

/etc/nginx/conf.d/acme-challenge.http.location.inc:
  file.managed:
    - source: salt://web-server/conf/acme-challenge.http.location.inc
    - require:
      - pkg: nginx
      - pkg: dehydrated
    - watch_in:
      - service: nginx

ssl_inc_transitional:
  cmd.run:
    - name: >
        echo 'ssl_certificate /etc/ssl/certs/ssl-cert-snakeoil.pem;' > /etc/nginx/conf.d/ssl.inc &&
        echo 'ssl_certificate_key /etc/ssl/private/ssl-cert-snakeoil.key;' >> /etc/nginx/conf.d/ssl.inc
    - unless: test -f /etc/nginx/conf.d/ssl.inc
    - require:
      - pkg: nginx
    - require_in:
      - service: nginx

/etc/dehydrated/domains.txt:
  file.managed:
    - contents:
      - ikr.su
      - mail.ikr.su
    - require:
      - pkg: dehydrated

{% if grains.virtual != 'VirtualBox' %}
initial_lets_encrypt_cert:
  cmd.run:
    - name: /usr/bin/dehydrated --cron
    - unless: test -d /var/lib/dehydrated/certs/ikr.su
    - require:
      - file: /etc/nginx/conf.d/acme-challenge.http.location.inc
      - file: /etc/dehydrated/domains.txt

ssl_inc:
  cmd.run:
    - name: >
        /bin/systemctl stop nginx &&
        echo 'ssl_certificate /var/lib/dehydrated/certs/ikr.su/fullchain.pem;' > /etc/nginx/conf.d/ssl.inc &&
        echo 'ssl_certificate_key /var/lib/dehydrated/certs/ikr.su/privkey.pem;' >> /etc/nginx/conf.d/ssl.inc &&
        /bin/systemctl start nginx
    - onlyif: test -f /etc/nginx/conf.d/ssl.inc && cat /etc/nginx/conf.d/ssl.inc | grep -F ssl-cert-snakeoil
    - require:
      - cmd: initial_lets_encrypt_cert

root_email_for_cron:
  cron.env_present:
    - user: root
    - name: MAILTO
    - value: ikr@ikr.su

lets_encrypt_cert_update:
  cron.present:
    - name: chronic /usr/bin/dehydrated --cron && systemctl reload nginx && systemctl reload dovecot && systemctl reload postfix
    - identifier: lets_encrypt_cert_update
    - user: root
    - dayweek: 0
    - hour: 1
    - minute: 37
{% endif %}
