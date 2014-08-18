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
