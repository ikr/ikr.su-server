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
    - hash: md5=26b04e372ac0a04a748dbdc47681380e
    - options: --backup
    - require:
      - pkg: mail-packages
