mail-packages:
  pkg.installed:
    - pkgs:
      - postfix
      - dovecot-core
      - dovecot-imapd

postfix-master-conf:
  file.prepend:
    - name: /etc/postfix/master.cf
    - sources:
      - salt://mail/main.cf
    - require:
      - pkg: mail-packages
