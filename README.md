# About

Automatic OS configuration for krechetov.net

# Installation

## VirtualBox

### Prerequisites

1. Install [VirtualBox and Vagrant](http://docs.vagrantup.com/v1/docs/getting-started/index.html)

2. Run `vagrant plugin install vagrant-salt`

3. Get the Ubuntu 12.04 Precise x86_64 base box: `vagrant box add precise64 http://files.vagrantup.com/precise64.box`

### Host OS steps

From this project's root run:

    ~/prj/krechetov.net-server(master)$ vagrant up

That will provision the development VM start-up. When the provisioning is done, you can ssh into the
guest OS by

    ~/prj/krechetov.net-server(master)$ vagrant ssh

## Live

### Prerequisites

1. An Ubuntu 12.04 server

2. Install the SaltStack software
  * TBD
  * TBD
  * TBD

# License: MIT

Copyright (c) 2013 Ivan Krechetov

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
