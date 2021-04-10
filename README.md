# ONLYOFFICE Docker

![](https://libs.websoft9.com/common/websott9-cloud-installer.png) 

## Introduction

[English](/README.md) | [简体中文](/README-zh.md)  

This repository is an **Cloud Native solution** powered by [Websoft9](https://www.websoft9.com) to for installing [ONLYOFFICE](https://github.com/ONLYOFFICE/Docker-CommunityServer) and pre-configure required items automatically and users only need to run a command on Linux. It simplifies the complicated installation and initialization process.  

## System Requirements

The following are the minimal [recommended requirements](https://github.com/ONLYOFFICE/Docker-CommunityServer#recommended-system-requirements):

* **OS**: 64-bit Red Hat, CentOS, 64-bit Debian, Ubuntu or other compatible distributive with kernel version 3.8 or later
* **Public Cloud**: More than 20+ major Cloud such as AWS, Azure, Google Cloud, Alibaba Cloud, HUAWEIClOUD, Tencent Cloud
* **Private Cloud**: KVM, VMware, VirtualBox, OpenStack
* **ARCH**: amd64
* **RAM**: 4 GB or more
* **CPU**: dual-core 2 GHz or higher
* **HDD**: at least 2 GB of free space
* **Swap file**: at least 2 GB

## QuickStart

### All-in-one Installer

Use SSH to connect your instance and run the automatic installation script below

```
sudo wget -N https://download.websoft9.com/docker/install.sh; sudo bash install.sh -r onlyoffice
```

### Manual Installation

#### Preparation

If you have not install Docker and Docker-Compose, refer to the following commands to install it:

```
curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh
curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
ln -sf /usr/local/bin/docker-compose  /usr/bin
```

#### Use docker-compose

We assume that you are already familiar with Docker, and you can modify [docker-compose file](docker-compose-production.yml) by yourself

```
git clone --depth=1 https://github.com/Websoft9/docker-onlyoffice
cd docker-onlyoffice
docker-compose -f docker-compose-production.yml up -d
```

### FAQ

#### Do I need to change the password before docker-compose up?
Yes, you should modify all database password and application password at docker-compose file for production

#### Docker runing failed for the reason that port conflict?
You should modify ports at [docker-compose file](docker-compose-production.yml) and docker-compose again

### Usage instructions

You can point your browser to: *http://Instance's Internet IP:9003*  

The following is the information that may be needed during use

#### Credentials

By default, the available users are:

| User    | Password |
| ------- | -------- |
| admin | 123456  |

#### Services and Ports

| Service | Port | Use |  Necessity |
| --- | --- | --- | --- |
| onlyoffice-server | 9003 | HTTP to access ONLYOFFICE | Required |
| onlyoffice-mysql-server | 3306 | Remote to access MySQL | Optional |
| phpmyadmin | 9090 | phpMyAdmin on Docker | Optional |

## Documentation

[ONLYOFFICE Administrator Guide](https://support.websoft9.com/docs/onlyoffice)

## Enterprise Support

If you want to get our Enterprise Support to ensure high availability of applications, you can subscribe our [ONLYOFFICE Enterprise Support](https://apps.websoft9.com/onlyoffice) 

What you get with a Enterprise Support subscription?

* Knowledge: Answers and guidance from product experts
* Support: Everything you need for technical support, e.g Enable HTTPS, Upgrade guide
* Security: Security services and tools to protect your software
