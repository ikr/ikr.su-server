# About

Automatic OS configuration for ikr.su

# Installation

On Debian Wheezy

    # echo 'deb http://http.debian.net/debian wheezy-backports main' >> /etc/apt/sources.list
    # apt-get update
    # apt-get -t wheezy-backports install salt-minion
    # git clone https://github.com/ikr/ikr.su-server.git
    # salt-call -c /root/ikr.su-server/salt state.highstate
    
