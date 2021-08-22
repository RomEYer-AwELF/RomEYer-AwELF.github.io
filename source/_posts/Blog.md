---
layout: post
title: 使用Github Pages架设自己免费的博客吧！
keywords: Gtihub
date: 2020-04-27 09:29:00
photos: https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNblog/bg/72937338_p0.png
avatar: https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDN/img/avatar.png
author: RomEYer
authorAbout: 只要努力，还是办得到的！
description: GitHub Pages 是一个静态网站托管服务，是一个完全免费的服务，被设计来管理你的来自一个GitHub 库的个人的、组织的、或者项目的页面。你可以创建和发布一个 GitHub Pages 到网上...
comments: true
categories: 技术
tags: 博客架设
---

## GitHub Pages 简介
GitHub Pages 是一个静态网站托管服务，是一个完全免费的服务，被设计来管理你的来自一个GitHub 库的个人的、组织的、或者项目的页面。你可以创建和发布一个 GitHub Pages 到网上。
<font color=red>不过 GitHub Pages 网站是在网络上公开使用的，即使他们的库是私有的。如果你敏感的数据在你的 Page 库中，你也有必要在发布之前删除它。</font>

>详见：https://help.github.com/en/github/working-with-github-pages/about-github-pages

## 准备工作
我们需要什么？
* 一个 GitHub 账号
* 一个合适的 GitHub 仓库
* 一台不会太过于卡顿的电脑
* Node 和 Git 环境
* 你的手

### 注册 GitHub 账号
请首先打开https://github.com/
你将会看到令人熟悉的注册界面
![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/20200427095019.png)
  * Username 是你将要填入的用户名
  * Email address 是你的电子邮件地址
  * Password 是你的密码

你需要做的是填写它们并且点击 Sign up for GitHub

* 如果你已经拥有 GitHub 账号那么你可以选择跳过这一步继续往下看。

点击后你将会看到如下页面（当然你的界面是已经填写好信息的界面，因为你刚刚填写过了）
![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/注册2.png)
接下来你需要根据提示完成验证并且点击 Create account 
这样你就拥有自己的 GitHub 账号了（至于邮箱验证链接什么的我相信没有人不知道怎么做吧）


 ### 准备环境

 #### 安装 Git 和 Node
 你需要准备 Node 和 Git 环境，Git将用于项目管理，而 Hexo 是基于 Node 驱动的博客框架因此我们也需要安装 Node
 * Git 下载链接：https://git-scm.com/
 * Node 下载链接：https://nodejs.org/en/

下载并安装完成 Git 后可以直接使用 git bash 或者打开 Windows自带的 PowerShell、CMD 并且输入如下内容验证是否成功。
```shell
git version
node -v
npm -v
```
输入以上指令后如返回出现如下版本号则安装成功
![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/PS.png)
确认以上步骤无误后便可以开始安装 Hexo 了

#### 安装 Hexo 
首先新建一个文件夹，在文件夹目录按住 Shift 右键找到 PowerShell 选择打开
输入如下指令开始安装
```shell
npm install hexo-cli -g
```
完成安装后我们可以输入以下指令查看版本
```shell
hexo v
```
随后我们输入下面的指令进行初始化
```shell
hexo init
```
这样就可以看到文件夹中生成了许多文件
![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/SC.png)
* node_modules 依赖包
* scaffolds 命令生成的文章模板
* source 命令创建的文章
* themes 主题文件
* _config.yml 博客的配置文件可以在此配置大部分的参数
（虽然名称不同但是和主题的配置文件不同请注意）
* db.json source 解析所得到的文件
* package.json 项目所需模块项目的配置信息

>详细可见官方介绍文档：https://hexo.io/zh-cn/

确认如上文件存在就可以测试启动了，只需要输入以下指令就可以完成启动
```shell
npm i hexo-server
hexo generate
hexo server
```
接下来访问 http://localhost:4000 便可以访问博客的界面了，恭喜你成功搭建了自己的博客页面。
当然现在只是完成了本地搭建，接下来我们要使用 Github Pages 完成部署


## 创建仓库
回到 GitHub 我们可以看到如下内容，点击左上角的 New 创建一个新的仓库
![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/Git.png)
随后你需要在下面填写一些信息
![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/20200427151201.png)
* Repository name 填入你的<font color=red> 用户名+github.io </font>（例如我的用户名 RomEYer-AwELF.github.io）
* Description 填入你的仓库名称（例如 Hexo、blog 或者其他）
![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/20200427151837.png)
点击 Create repository 完成操作
下面回到 PowerShell 中，配置github账户信息
输入以下信息并且替换“用户名”为你的用户名“邮箱地址”为你的注册邮箱地址

```shell
git config --global user.name "用户名"
git config --global user.email "邮箱地址"
```
然后生成密钥 SSH key

```shell
ssh-keygen -t rsa -C "邮箱地址"
```
根据提示三次回车后即可完成操作
![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/20200427153851.png)
接下来打开C:\Users\ *你的电脑用户名* \ .ssh
![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/20200427154058.png)
用笔记本打开 id_rsa.pub 文件<font color=red>复制其中 ssh-rsa 以及后面,除去邮箱外的所有数据</font>
![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/20200427154548.png)
![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/20200427154710.png)
![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/20200427154853.png)
* Title 填写名称（任意）
* Key 填写刚才复制的ssh-rsa 以及后面,除去邮箱外的所有数据（不包含邮箱，后面不要留空格！！）

确认填写完毕后点击 Add SSH key 即可
## 将博客部署到 GitHub
现在我们已经成功搭建了博客（在本地）而且有一些人可能使用了 hexo server 后没有 Ctrl+C 停止运行导致开了两个 SSH（笑）
接下来要做的就是将博客部署到 GitHub 运行
首先打开博客根目录下的  _config.yml  配置文参数直接在配置文件末尾添加如下图配置
![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/20200427155740.png)
红框中的请改成自己的 GitHub 用户名/用户名
```json
deploy:
  type: git
  repo: https://github.com/RomEYer-AwELF/RomEYer-AwELF.github.io.git
  branch: master
```
配置完成后记得 Ctrl+S 保存
然后安装部署插件 hexo-deployer-git 在博客目录下打开 PowerShell 输入如下指令
```shell
npm install hexo-deployer-git --save
```
插件完成安装后输入
```shell
hexo generate
hexo deploy
```
等待部署完毕后，访问网址 https://你的用户名.github.io  就可以访问你的博客了
<font color=red>至此属于你的博客就部署完成了！！！</font>
之后我也将对于博客主题配置、写作方法等进行详细介绍