core_packages:
  pkg.installed:
    - pkgs:
      - curl
      - nodejs
      - make
      - g++

node:
  cmd.run:
    - name: update-alternatives --install /usr/bin/node nodejs /usr/bin/nodejs 100
    - unless: test -f /usr/bin/node
    - require:
      - pkg: core_packages

npm:
  cmd.run:
    - name: curl -sf https://www.npmjs.org/install.sh | sh
    - unless: test -f /usr/bin/npm
    - require:
      - cmd: node

ikr:
  user.present:
    - fullname: Ivan Krechetov
    - shell: /bin/bash
    - home: /home/ikr
    - createhome: True
    - groups:
      - users

lesya:
  user.present:
    - fullname: Olesya Krechetova
    - shell: /bin/bash
    - home: /home/lesya
    - createhome: True
    - groups:
      - users
