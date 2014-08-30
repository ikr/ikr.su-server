/etc/mailname:
  file.managed:
    - source: salt://mail/mailname

/etc/aliases:
  file.managed:
    - source: salt://mail/aliases

newaliases:
  cmd.wait:
    - watch:
      - file: /etc/aliases

mail-packages:
  pkg.installed:
    - pkgs:
      - postfix
      - dovecot-core
      - dovecot-imapd

/etc/postfix/master.cf:
  file.managed:
    - source: salt://mail/master.cf
    - require:
      - pkg: mail-packages

/etc/postfix/main.cf:
  file.managed:
    - source: salt://mail/main.cf
    - require:
      - pkg: mail-packages

/etc/ssl/certs/mail_ikr_su.pem:
  file.exists

/etc/ssl/private/mail_ikr_su.key:
  file.exists
