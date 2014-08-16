mail-packages:
  pkg.installed:
    - pkgs:
      - postfix
      - dovecot-core
      - dovecot-imapd

postfix-master-conf:
  file.patch:
    - name: /etc/postfix/master.cf
    - source: salt://mail/main.cf.diff
    - require:
      - pkg: mail-packages
