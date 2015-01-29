/var/www/wiki-node:
  file.directory:
    - user: ikr
    - group: users
    - dir_mode: 755
    - require:
      - file: /var/www

https://github.com/fedwiki/wiki-node.git:
  git.latest:
    - rev: master
    - target: /var/www/wiki-node
    - user: ikr
    - require:
      - file: /var/www/wiki-node

wiki_deps:
  cmd.wait:
    - name: /usr/bin/npm install
    - cwd: /var/www/wiki-node
    - user: ikr
    - group: users
    - require:
      - cmd: npm
    - watch:
      - git: https://github.com/fedwiki/wiki-node.git

/etc/init.d/fedwiki:
  file:
    - managed
    - source: salt://content/fedwiki
    - mode: 755

fedwiki:
  service:
    - running
    - enable: True
    - require:
      - cmd: wiki_deps
    - watch:
      - git: https://github.com/fedwiki/wiki-node.git
