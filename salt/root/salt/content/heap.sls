/var/www/heap:
  file.directory:
    - user: ikr
    - group: users
    - dir_mode: 755
    - require:
      - file: /var/www
