curl:
  pkg:
    - installed

nodejs:
  pkg:
    - installed

node:
  cmd.run:
    - name: update-alternatives --install /usr/bin/node nodejs /usr/bin/nodejs 100
    - unless: test -f /usr/bin/node

ikr:
  user.present:
    - fullname: Ivan Krechetov
    - shell: /bin/bash
    - home: /home/ikr
    - createhome: True
    - groups:
      - users
