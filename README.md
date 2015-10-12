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

## On SMTP client configuration

[l.erlacher+do](https://www.digitalocean.com/community/users/l-erlacher-do) _November 20, 2013_

    Postfix is running smtp directly on the mail server you configured, so at
    'mail.yourdomain.com'. It will accept mail for delivery to **local** mail addresses via standard
    smtp on port 25, and it will receive mail for delivery to **any** mail addresses via
    authenticated, encrypted submission server (which is also smtp, postfix just calls it
    submission) on port 587. Make sure that your mail client uses port 587 with plain password auth
    and starttls.

### Links

* [How To Set Up a Postfix E-Mail Server with Dovecot](https://www.digitalocean.com/community/tutorials/how-to-set-up-a-postfix-e-mail-server-with-dovecot)

## Updating the TLS certificate

The same certificate is used by both the HTTP server, and the mail server, issued to the
"mail.ikr.su" common name. Here's the certificate renewal procedure for
[StartSSL](https://www.startssl.com/).

### Domain name validation

At StartSSL.com, go to the Validations Wizard tab. Select the "Domain Name Validation" type. Enter
the ikr.su. Select "ivan.krechetov@gmail.com" as the verification e-mail. Enter the e-mailed
verification code.

### CSR

```
$ scp root@ikr.su:/etc/ssl/private/mail_ikr_su.key ./
$ openssl req -new -nodes -days 365 -key ./mail_ikr_su.key -out ./mail_ikr_su.csr
```

At StartSSL.com, go to the Certificates Wizard tab. Select the "Web Server SSL/TLS Certificate" as
the "Certificate Target". Skip the "Generate Private Key" step. Submit the mail_ikr_su.csr
content. At the "Add Domains" step enter "mail".

### PEM

The `mail_ikr_su.pem` should contain the concatenation of:

1. The common name certificate itself
2. The StartCom Class 1 Intermediate Server CA
