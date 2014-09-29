core_packages:
  pkg.installed:
    - pkgs:
      - curl
      - nodejs
      - make

node:
  cmd.run:
    - name: update-alternatives --install /usr/bin/node nodejs /usr/bin/nodejs 100
    - unless: test -f /usr/bin/node
    
npm:
  cmd.run:
    - name: curl -sf https://www.npmjs.org/install.sh | sh
    - unless: test -f /usr/bin/npm

ikr:
  user.present:
    - fullname: Ivan Krechetov
    - shell: /bin/bash
    - home: /home/ikr
    - createhome: True
    - groups:
      - users
