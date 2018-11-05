# About

Automatic OS configuration for ikr.su

# Installation

## Debian 9 (Stretch) VirtualBox

* Create a new Debian Linux VM **with a disk space large enough**
* Configure the port forwarding for ssh in the VM settings

| Name | Protocol | Host IP | Host Port | Guest IP | Guest Port |
| ---- | -------- | ------- | --------: | -------- | ---------: |
| ssh  | TCP      |         | 2222      |          | 22         |

* Install a bare minimal OS into the VM (called `guest` below)
* Log into the VM as an unprivileged user, and become the root

```
ikr@host:~$ ssh ikr@localhost -p 2222
…
ikr@guest:~$ su -
…
root@guest:~#
```

Bootstrap the system for the further automatic configuration

```
root@guest:~# apt install git salt-minion
…
root@guest:~# git clone https://github.com/ikr/ikr.su-server.git
…
root@guest:~# salt-call -c /root/ikr.su-server/salt state.apply
…
root@guest:~# passwd ikr
…
root@guest:~# passwd lesya
…
```

# Notes

## On SMTP client configuration

[l.erlacher+do](https://www.digitalocean.com/community/users/l-erlacher-do) _November 20, 2013_

> Postfix is running smtp directly on the mail server you configured, so at
> 'mail.yourdomain.com'. It will accept mail for delivery to **local** mail addresses via standard
> smtp on port 25, and it will receive mail for delivery to **any** mail addresses via
> authenticated, encrypted submission server (which is also smtp, postfix just calls it submission)
> on port 587. Make sure that your mail client uses port 587 with plain password auth and starttls.

### Links

* [How To Set Up a Postfix E-Mail Server with Dovecot](https://www.digitalocean.com/community/tutorials/how-to-set-up-a-postfix-e-mail-server-with-dovecot)
