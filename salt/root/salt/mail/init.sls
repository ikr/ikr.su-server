mailname:
  file.managed:
    - name: /etc/mailname
    - source: salt://mail/mailname

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
