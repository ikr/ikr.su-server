ruby_packages:
  pkg.installed:
    - pkgs:
      - ruby
      - ruby-dev

jekyll:
  gem.installed:
    - require:
      - pkg: ruby_packages

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

/var/www/ikr.su-blog:
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

https://github.com/ikr/ikr.su-blog.git:
  git.latest:
    - rev: master
    - target: /var/www/ikr.su-blog
    - user: ikr
    - require:
      - file: /var/www/ikr.su-blog

/var/www/heap:
  file.directory:
    - user: ikr
    - group: users
    - dir_mode: 755
    - require:
      - file: /var/www

jekyll_build:
  cmd.run:
    - name: jekyll build
    - cwd: /var/www/ikr.su-blog
    - user: ikr
    - group: users
    - watch:
      - git: https://github.com/ikr/ikr.su-blog.git