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
  npm.installed:
    - dir: /var/www/wiki-node
    - user: ikr
    - require:
      - cmd: npm
    - watch:
      - git: https://github.com/fedwiki/wiki-node.git
