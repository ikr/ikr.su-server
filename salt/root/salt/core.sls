curl:
  pkg:
    - installed

ikr:
  user.present:
    - fullname: Ivan Krechetov
    - shell: /bin/bash
    - home: /home/ikr
    - createhome: True
    - groups:
      - users
