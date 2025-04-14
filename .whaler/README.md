# Setup Guide

## Install [Docker](https://www.docker.com)

``` bash
curl -fsSL https://get.docker.com | sh
```

Add your user to docker group:

``` bash
sudo usermod -aG docker $USER
```

> **NB!** Restart terminal

## Install [Whaler](https://github.com/whaler/whaler) & [Plugins](https://github.com/whaler?q=plugin)

``` bash
curl -sSL https://git.io/get-whaler | sh
whaler plugins:install whaler-haproxy-plugin
whaler plugins:install whaler-ssh-plugin
```

### [Configure DNS](https://github.com/whaler/whaler-haproxy-plugin#dnsmasq)

Or just add string `127.0.0.1 <app-name>.whaler.lh` to `/etc/hosts`

### Configure ssh-agent

> **NB!** Generate SSH key, if it doesn't exist yet: `ssh-keygen -t rsa -C "<email>"`
> 
> Do not use passphrase when creating key!

``` bash
whaler vars:set SSH_AUTH_SOCK /.ssh/agent
docker run -d --restart always --env SSH_ADD=/id_rsa --name ssh-agent cravler/ssh-agent
docker cp $HOME/.ssh/id_rsa ssh-agent:/id_rsa
docker restart ssh-agent
```

Add your `id_rsa.pub` to `GitHub` and check access:

``` bash
docker run -it --rm --volumes-from ssh-agent cravler/ssh-agent ssh-add -L
docker run -it --rm --volumes-from ssh-agent cravler/ssh-agent ssh -T git@github.com
```
