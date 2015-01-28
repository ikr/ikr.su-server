/var/www:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755

/var/www/ikr.su:
  file.directory:
    - user: ikr
    - group: users
    - dir_mode: 755
    - require:
      - file: /var/www

https://github.com/ikr/ikr.su.git:
  git.latest:
    - rev: master
    - target: /var/www/ikr.su
    - user: ikr
    - require:
      - file: /var/www/ikr.su
