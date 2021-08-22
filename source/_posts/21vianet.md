---

layout: post
title: 在同济世纪互联租户中创建应用并调用 API 方法
keywords: 21vianet
date: 2020-08-21 14:07:44
photos: https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/21vianetbg.jpg
avatar: https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDN/img/avatar.png
author: RomEYer
authorAbout: 我们曾经考虑过很多很多...就和现在一样
description: 先简单说明一下已知情况，同济大学并未开放普通用户的 Azure AD 管理门户访问权限，至于一般注册应用也都是需要进入 AAD 来完成相关注册的。不过这里有一点很有趣，首先我们可以了解几点...
comments: true
categories: 技术
tags: 21vianet
---

## 在同济世纪互联租户中创建应用并调用 API 方法

先简单说明一下已知情况，同济大学并未开放普通用户的 Azure AD 管理门户访问权限，至于一般注册应用也都是需要进入 AAD 来完成相关注册的。

**不过这里有一点很有趣，首先我们可以了解几点：**

* **1.应用的 ID 和密钥是可以公用的，只要拥有以上两者，任何人都可以正常使用同一个注册应用，而 Onemanager 就是类似的方法。**

* **2.在 AAD 的应用是可以跨租户注册的，如果我们在一个租户注册了对应应用，那么如果我们登录另外一个租户的账号的时候，这个应用也会转移到对应租户。而在这里这个应用是作为企业应用存在的，但是同样是有效的。**

知道了以上两点，我们实际上就已经解决了 AAD 无法访问导致的应用无法注册的问题。

#### **附参考图（以下图样由国际版租户测试得到）：**

租户一中进行应用注册，名称为：“ API （测试）”

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/21API1.png)

跳转时输入租户二中某账号信息并且完成许可

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/21API2.png)

此时租户二的企业应用程序中已经出现了租户一中“ API （测试）”应用

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/21API3.png)

 ## 注意点

1.这里使用的其他租户必须开放 AAD 访问权限以便于可以注册应用，必须事先将回调地址设置好且获取应用 ID 和应用机密。（此处的应用 ID 和机密对应调用 API 时需要使用的应用 ID 和应用机密）

2.需要额外准备世纪互联的租户，这个租户可以是有订阅或者无订阅租户（空全局）无订阅租户可以由 AAD 创建，这一点和国际版如出一辙，详细可以参考 [登录Azure创建租户](https://www.loliloli.moe/2020/05/31/E3_Symphony.html#登录-Azure-创建租户) 有订阅租户可以是教育或者商业试用订阅全局，注册方法可以自行查询。



## 后日谈

*更新于2020.08.21*

