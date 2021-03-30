# Docker版ONLYOFFICE

![](https://libs.websoft9.com/common/websott9-cloud-installer.png) 

## 简介

 [简体中文](/README-zh.md) | [English](/README.md) 

本项目是由[Websoft9](https://www.websoft9.com) 基于[ONLYOFFICE 官方Docker](https://github.com/ONLYOFFICE/Docker-CommunityServer)研发的云原生**ONLYOFFICE**程序。程序进行了预配置，用户使用一条命令即可自动完成安装， 大大简化了复杂的安装以及配置过程。

## 配置要求

安装本项目，确保符合如下的条件：

* **操作系统**: Red Hat、CentOS、Debian、Ubuntu或兼容内核kernel3.8后的其他操作系统
* **C架构**: AMD64
* **内存**: 4GB以上
* **CPU**: 2核以上
* **存储**: 2GB以上
* **Swap分区**: 2GB以上
* **Docker版本**: 1.9.0以上

更多配置信息请参照[系统配置](https://github.com/ONLYOFFICE/Docker-CommunityServer#recommended-system-requirements)

## 预安装

如果服务器尚未安装Docker，请使用如下命令安装：

```
curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh
curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
ln -sf /usr/local/bin/docker-compose  /usr/bin
```

## 安装应用

如果你对Docker应用很熟悉，你可以修改[docker-compose file](docker-compose.yml)来满足自己特定需求 

```
git clone --depth=1 https://github.com/Websoft9/docker-onlyofficecommunityserver
cd docker-onlyofficecommunityserver
docker-compose up -d
```

## 参数（服务及端口）

| 服务       | 端口号                                  | 容器名                 |
| ---------- | ------------------------------------- | -------------------- |
| ONLYOFFICE CommunityServer   | 9003 | onlyoffice-mysql-server         |
| phpMyAdmins     | 9090    |       onlyoffice-community-server               |
| ONLYOFFICE DocumentServer     | 9002    |         onlyoffice-document-server             |


## 如何购买

我们在主流云平台上发布了*ONLYOFFICE CommunityServer*，您可以通过[购买ONLYOFFICE](https://apps.websoft9.com/onlyoffice)自动部署它并获得我们的企业支持，以确保应用程序的高可用性。

购买后可享受哪些服务：

* 知识：产品专家的解答和指导
* 支持：技术支持所需的一切，例如启用HTTPS、升级指南
* 安全：安全服务和工具，可提高您软件的安全性

## 链接

* [文档](https://support.websoft9.com/docs/onlyoffice)
* [记录](/CHANGELOG.md)
* [许可证](/License.md)

## 常见问题

#### 启动ONLYOFFICE前需要更改密码吗？

是的, 在生产环境中，您应该在docker compose文件中修改所有数据库密码和应用程序密码

#### ONLYOFFICE默认的用户名和密码是什么？

请参照[docker-compose file](docker-compose.yml)的上方注释区域
