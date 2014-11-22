nginx:
  pkg:
    - installed
  service:
    - running
    - enable: True
    - require:
      - pkg: nginx
    - watch:
      - file: /etc/nginx/sites-enabled/default
      - file: /etc/ssl/certs/mail_ikr_su.pem
      - file: /etc/ssl/private/mail_ikr_su.key

/etc/nginx/sites-enabled/default:
  file.managed:
    - source: salt://nginx/ikr.su.conf
    - require:
      - pkg: nginx
