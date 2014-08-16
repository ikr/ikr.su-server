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
    - hash: md5=ec43eae0cb1f0d8788ba6c61d59a2762
    - require:
      - pkg: mail-packages
