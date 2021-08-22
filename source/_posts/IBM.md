---

layout: post
title: 论如何白嫖 IBM 优质梯子
keywords: V2-Ray
date: 2020-06-21 10:29:24
photos: https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/IBMBG.jpg
avatar: https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDN/img/avatar.png
author: RomEYer
authorAbout: 生命不息，白嫖不止！
description: 首先在这里“梯子”是什么这里就不多说了，这次的目标是如何完全白嫖一个“梯子”当然这是一个“终极白嫖”因为我们需要的一切都能白嫖到...
comments: true
categories: 技术
tags: V2-Ray
---

## 简述
**<font color="red">注意本教程仅作学习交流用途展示，请勿用作非法用途，如造成不良影响，本站将配合调查并且进行整改</font>**

首先在这里“梯子”是什么这里就不多说了，这次的目标是如何完全白嫖一个“梯子”

当然这是一个“终极白嫖”因为<font color="red"> 我们需要的一切都能白嫖到</font>

Cloudflare 将会提供免费的高速中转

IBM Cloud 将会提供免费的空间

但是 IBM Cloud 十天不操作就会关机，所以必须十天内对其重启一次，避免关机，这里使用 Github Actions 每周自动重启

* 部分教程资源参考自

* https://github.com/badafans/v2ray-cloudfoundry

* https://github.com/CCChieh/IBMYes

<font color="red" size="4">**注意,此教程已经失效，IBM疑似已经不会为新的账号分配免费空间了（2020.06.23）**</font>

## 准备工作
我们需要什么？
* 一个 GitHub 账号
* 一个 Cloudflare 账号
* 一个 IBM 账号

### 相关链接

* GitHub 链接：https://github.com
* Cloudflare 链接：https://cloudflare.com
* IBM 链接：https://www.ibm.com
* IBM Cloud 链接：https://cloud.ibm.com
* 仓库链接：https://github.com/badafans/v2ray-cloudfoundry
* 仓库链接：https://github.com/CCChieh/IBMYes
* V2-Ray下载链接：https://pan.romeyer.live/%E8%BD%AF%E4%BB%B6/v2rayN-Core.zip

### 注册 GitHub 账号

详见：https://www.romeyer.live/2020/04/27/Blog.html#%E6%B3%A8%E5%86%8C-GitHub-%E8%B4%A6%E5%8F%B7
 ### 注册 Cloudflare 账号

打开 https://cloudflare.com 点击右上角注册

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/20200621114627CF.png)

填入上述信息便可完成注册了

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/20200621114721CF.png)

### 注册 IBM 账号

打开 https://www.ibm.com 点击右上角图标进行注册

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/IBM20200621091841.png)

在下方填入相关信息即可

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/20200621091926IBM.png)



在 IBM Cloud https://cloud.ibm.com 登录

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/20200621092113IBM.png)

## 创建 Cloud Foundry

### 创建容器

完成登陆后可以在界面看到如下内容，并且选择左边菜单栏中的 Cloud Foundry 然后选择公共

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/20200621092211IBM.png)

选择创建

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/20200621092234IBM.png)

依据下面两幅图选择，区域选择达拉斯，套餐选择128MB

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/20200621092320IBM.png)

应用名称填写自己需要的容器的名称，<font color="red">必须记录下来</font>，后面将用到

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/20200621092411IBM.png)

创建完成后，如图左上角会出现一个 “访问应用程序 URL“ <font color="red">这里的 URL 必须记下来</font>，接下来会用到

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/20200621092704IBM.png)

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/20200621094655IBM.png)

### 部署 V2-Ray

然后依据下面图中框选的地方打开 IBM 的 Shell 

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/20200621092803IBM.png)

在 Shell 中依次输入如下内容


```SHELL
git clone https://github.com/badafans/v2ray-cloudfoundry.git
cd v2ray-cloudfoundry/v2ray
chmod +x *
cd ..
```

上面内容完成后修改 manifest.yml 文件

```yaml
vim manifest.yml
```

输入如上指令后你会看到下图显示并且修改 <font color="red">name: </font>后面为你刚才记下的容器名称（注意“:”和名称之间有空格，否则会报错）

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/20200621093140IBM.png)

```yaml
applications:

- path: .

  name: GetStartedGo  //这里改成你的容器的名称

  random-route: true

  memory: 128M
```

这里按 “A” 进入修改模式，完成修改后按 “Ctrl+C” 退出修改模式并且输入 “:wq!” 回车保存（这里 “wq!” 是为了防止由于权限不够导致的无法保存）

接下来输入如下指令

```SHELL
ibmcloud target --cf
ibmcloud cf install
ibmcloud cf push
```

## 创建 Cloudflare Workers

注册 Cloudflare 账号后可以看到如下界面，选择 Workers 然后选择创建 Workers

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/20200621094746CF.png)

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/20200621094817CF.png)

在脚本区域输入如下内容，并且填入之前记下的 URL

```js
addEventListener( 
  "fetch",event => { 
    let url=new URL(event.request.url);
    url.hostname="这里填上面你记录的url（不包含https://）"; 
    let request=new Request(url,event.request);
     event. respondWith( 
       fetch(request) 
       ) 
       }
        )

```

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/20200621094913CF.png)

预览中出现如下显示即部署正常

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/20200621094929CF.png)

接下来记下部署的地址

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/20200621111044CF.png)

### 配置 V2-Ray 客户端

如下图，地址栏输入上面 Workers 部署的地址

* 端口：8080 （默认）

* 用户 ID：8c35bef3-d51f-41ab-ac87-7b053410495b（默认）

* 额外 ID：64（默认）

* 传输协议：ws

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/20200621095410V2.png)

连接后如，测试速度基本正常即连接正常，至此工作基本上已经完成

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/20200621095516V2.png)

## 部署 Github Actions 每周自动重启

打开如下链接：https://github.com/CCChieh/IBMYes 选择Fork

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/20200621100341GIT.png)

完成后我们选择 Settings 然后是 Secrets

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/20200621100420GIT.png)

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/20200621100436GIT.png)

点击 New secret

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/20200621100456GIT.png)

依次创建如下内容

```json
IBM_ACCOUNT // IBM Cloud的登录邮箱和密码
IBM_APP_NAME // 应用的名称
REGION_NUM // 区域编码
RESOURSE_ID // 资源组ID
```

分别填入账号密码

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/20200621100723GIT.png)

填入之前记录的容器名称

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/20200621100647GIT.png)

之后我们回到 IBM Shell 输入如下指令依次输入账号密码

```SHELL
ibmcloud login
```

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/20200621101021IBM.png)

回车后你将会看到如下内容

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/20200621101120IBM.png)

框中的就是资源区名称，将其记录且对照资源区代码

```json
1 au-syd
2 in-che
3 jp-tok
4 kr-seo
5 eu-de
6 eu-gb
7 us-south
8 us-east
```

在 Secret 中填入资源代码，如下例我是 “us-south” 则对照填写上面的 “7”

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/20200621100829GIT.png)

继续回到 IBM Shell 获取资源区ID

输入如下指令

```SHELL
ibmcloud resource groups
```

如框中显示的就是资源区ID了将其也填入 Secret 中

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/20200621101219IBM.png)

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/20200621100902GIT.png)

完成后则可以启动 Actions 了

### 启动 Actions

点击上方菜单的 Actions

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/20200621101310GIT.png)

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/20200621101326GIT.png)

点击上图 “I understand my workflows, go ahead and enable them” 就可以运行了

运行如下图则运行成功，接下来每周 IBM Cloud 便会自动重启了

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/20200621101518GITRUN.png)

## 一些测试

如果上面的工作全部完成了，那么你便成功白嫖到了一个相对不错的梯子了，根据博主自己宽带的测试速度来看，这个梯子的速度也只能说是中规中矩，但是完全满足日常使用的要求

* Fast测速

* ![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/12SC.png)

* YouTuBe 8K 测试
* ![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/YOUTUBE.png)

## 后日谈

*更新于2020.06.23*

最新消息显示，IBM已经不会为新账号提供免费空间了，所以各位有薅到羊毛的人，请且用且珍惜。

若有后续，博主会继续更新的。

*更新于2020.09.11*

由于近期有大量 YouTube UP 主上传了相关视频教程，结果此举导致 IBM Foundry 大批量清理 V2 应用容器且封禁了一大批 IBM Cloud 账号，当然，对于此举的持续时间目前是为止的，如果你的容器和账号依旧正常。那么且用且珍惜吧。

PS：博主貌似没感觉到什么的来着，毕竟两个号都活着来着...