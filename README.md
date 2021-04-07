# ONLYOFFICE Docker

![](https://libs.websoft9.com/common/websott9-cloud-installer.png) 

## Introduction

[English](/README.md) | [简体中文](/README-zh.md)  

This repository is an **Cloud Native solution** powered by [Websoft9](https://www.websoft9.com) to for installing [ONLYOFFICE](https://github.com/ONLYOFFICE/Docker-CommunityServer) and pre-configure required items automatically and users only need to run a command on Linux. It simplifies the complicated installation and initialization process.  

## System Requirements

The following are the minimal recommended requirements:

* **OS**: 64-bit Red Hat, CentOS, 64-bit Debian, Ubuntu or other compatible distributive with kernel version 3.8 or later
* **ARCH**: amd64
* **RAM**: 4 GB or more
* **CPU**: dual-core 2 GHz or higher
* **HDD**: at least 2 GB of free space
* **Swap file**: at least 2 GB
* **Docker version**: 1.9.0 or later

To learn more, refer to the [Recommended System Requirements](https://github.com/ONLYOFFICE/Docker-CommunityServer#recommended-system-requirements): 

## Installation

### Preparation

If you have not install Docker and Docker-Compose, refer to the following commands to install it:

```
curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh
curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
ln -sf /usr/local/bin/docker-compose  /usr/bin
```

### Use docker-compose

We assume that you are already familiar with Docker, and you can modify [docker-compose file](docker-compose.workspace.yml) by yourself

```
git clone --depth=1 https://github.com/Websoft9/docker-onlyoffice
cd docker-knowagecommunityserver
docker-compose -f docker-compose-production.yml up -d
```

### Start using

You can point your browser to: *http://Instance Internet IP:9003*  
By default, the available users are:

| User    | Password |
| ------- | -------- |
| admin | 123456  |

## Parameters

* **Services**: ONLYOFFICE CommunityServer, ONLYOFFICE DocumentServer, phpMyAdmin, MySQL5.7
* **Ports**: 9003 for ONLYOFFICE CommunityServer, 9090 for phpMyAdmin, 9002 for ONLYOFFICE DocumentServer

## Subscription

We have publish ONLYOFFICE CommunityServer on major Cloud Platform, just [subscribe it](https://apps.websoft9.com/onlyoffice) you can deployment it automatically and get our Enterprise Support to ensure high availability of applications.  

What you get with a Enterprise subscription?

* Knowledge: Answers and guidance from product experts
* Support: Everything you need for technical support, e.g Enable HTTPS, Upgrade guide
* Security: Security services and tools to protect your software

## Links

* [Documentation](https://support.websoft9.com/docs/onlyoffice)
* [CHANGELOG](/CHANGELOG.md)
* [License](/LICENSE.md)

## FAQ

#### Do I need to change the password before docker-compose up?

Yes, you should modify all database password and application password at docker-compose file for production

#### What the default username and password?

Refer to comment area at the top of docker-compose file
