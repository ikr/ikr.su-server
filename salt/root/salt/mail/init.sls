mail-packages:
  pkg.installed:
    - pkgs:
      - postfix
      - dovecot-core
      - dovecot-imapd

postfix-master-conf:
  file.patch:
    - name: /etc/postfix/master.cf
    - source: salt://mail/master.cf.diff
    - hash: md5=dd05b4ce11a36f511b89eb9637bb9d18
    - options: --backup
    - require:
      - pkg: mail-packages
