# About

Automatic OS configuration for ikr.su

# Installation

On Debian Wheezy

    # echo 'deb http://http.debian.net/debian wheezy-backports main' >> /etc/apt/sources.list
    # apt-get update
    # apt-get -t wheezy-backports install salt-minion
    # git clone https://github.com/ikr/ikr.su-server.git
    # salt-call -c /root/ikr.su-server/salt state.highstate

# Notes

On SMTP client configuration

[l.erlacher+do](https://www.digitalocean.com/community/users/l-erlacher-do) _November 20, 2013_

    Postfix is running smtp directly on the mail server you configured, so at
    'mail.yourdomain.com'. It will accept mail for delivery to **local** mail addresses via standard
    smtp on port 25, and it will receive mail for delivery to **any** mail addresses via
    authenticated, encrypted submission server (which is also smtp, postfix just calls it
    submission) on port 587. Make sure that your mail client uses port 587 with plain password auth
    and starttls.

# Links

* [How To Set Up a Postfix E-Mail Server with Dovecot](https://www.digitalocean.com/community/tutorials/how-to-set-up-a-postfix-e-mail-server-with-dovecot)
