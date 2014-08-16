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
    - hash: md5=fe823f7ff06d6cd8a12f964f193bc8c8
    - options: --backup
    - require:
      - pkg: mail-packages
