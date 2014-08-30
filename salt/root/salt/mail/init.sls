/etc/mailname:
  file.managed:
    - source: salt://mail/mailname

/etc/aliases:
  file.managed:
    - source: salt:://mail/aliases

mail-packages:
  pkg.installed:
    - pkgs:
      - postfix
      - dovecot-core
      - dovecot-imapd

postfix-master-conf:
  file.managed:
    - name: /etc/postfix/master.cf
    - source: salt://mail/master.cf
    - require:
      - pkg: mail-packages

postfix-main-conf:
  file.managed:
    - name: /etc/postfix/main.cf
    - source: salt://mail/main.cf
    - require:
      - pkg: mail-packages

/etc/ssl/certs/mail_ikr_su.pem:
  file.exists

/etc/ssl/private/mail_ikr_su.key:
  file.exists
