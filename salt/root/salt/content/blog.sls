ruby_packages:
  pkg.installed:
    - pkgs:
      - ruby
      - ruby-dev

jekyll:
  gem.installed:
    - require:
      - pkg: ruby_packages

/var/www/ikr.su-blog:
  file.directory:
    - user: ikr
    - group: users
    - dir_mode: 755
    - require:
      - file: /var/www

https://github.com/ikr/ikr.su-blog.git:
  git.latest:
    - rev: master
    - target: /var/www/ikr.su-blog
    - user: ikr
    - require:
      - file: /var/www/ikr.su-blog

jekyll_build:
  cmd.wait:
    - name: jekyll build
    - cwd: /var/www/ikr.su-blog
    - user: ikr
    - group: users
    - watch:
      - git: https://github.com/ikr/ikr.su-blog.git
