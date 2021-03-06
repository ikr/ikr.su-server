mail-packages:
  pkg.installed:
    - pkgs:
      - postfix
      - dovecot-core
      - dovecot-imapd

/etc/mailname:
  file.managed:
    - contents:
      - ikr.su
    - require:
      - pkg: mail-packages

/etc/aliases:
  file.managed:
    - source: salt://mail/aliases
    - require:
      - pkg: mail-packages

newaliases:
  cmd.wait:
    - watch:
      - file: /etc/aliases

/etc/postfix/master.cf:
  file.managed:
    - source: salt://mail/master.cf
    - require:
      - pkg: mail-packages

/etc/postfix/main.cf:
  file.managed:
    - source: salt://mail/main.cf
    - template: jinja
    - require:
      - pkg: mail-packages

/etc/dovecot/dovecot.conf:
  file.managed:
    - source: salt://mail/dovecot.conf
    - template: jinja
    - require:
      - pkg: mail-packages

postfix:
  service.running:
    - enable: True
    - require:
      - pkg: mail-packages
    - watch:
      - file: /etc/mailname
      - file: /etc/aliases
      - file: /etc/postfix/master.cf
      - file: /etc/postfix/main.cf
{% if grains.virtual != 'VirtualBox' %}
      - cmd: initial_lets_encrypt_cert
{% endif %}

dovecot:
  service.running:
    - enable: True
    - require:
      - pkg: mail-packages
    - watch:
      - file: /etc/mailname
      - file: /etc/aliases
      - file: /etc/dovecot/dovecot.conf
{% if grains.virtual != 'VirtualBox' %}
      - cmd: initial_lets_encrypt_cert
{% endif %}
