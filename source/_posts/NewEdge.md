---
layout: post
title: 修改NewEdge主题方法简谈
keywords: NewEdgeTheme
date: 2020-06-17 20:43:53
photos: https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/EdgeThem.jpg
avatar: https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDN/img/avatar.png
author: RomEYer
authorAbout: 我们应该做什么，或许它们很简单吗？
description: 微软的 NewEdge 因为采用了 Chromium 内核因此也共享了 Chrome 插件商城的插件库，但是一直以来 Edge 都没有办法更换主题，插件商城的主题添加也会显示错误...
comments: true
categories: 技术
tags: NewEdge Theme
---

## 简介

微软的 NewEdge 因为采用了 Chromium 内核因此也共享了 Chrome 插件商城的插件库，但是一直以来 Edge 都没有办法更换主题，插件商城的主题添加也会显示错误，而这一次意外倒是让我发现了给 NewEdge安装主题的方法

目前似乎也没发现有谁发现或者公布了这个方法吧，所以我也就在这里谈论一下吧。

这个方法操作并不复杂，需要做的也就是将 Chrome 的主题文件下面 manifest.json 文件增加一行 "manifest_version": 2, 就行了。

## 需求

* 一台安装NewEdge的计算机

* 获取到的主题包（从Chrome Webstore）获取

* 你的手

## 相关链接

Chrome Webstore：https://chrome.google.com/webstore/

已经修改过的两个主题包：https://pan.romeyer.live/%E8%BD%AF%E4%BB%B6/Edge%E4%B8%BB%E9%A2%98.zip

## 操作步骤

### 修改主题文件

打开主题包目录中的 manifest.json 文件大致上你会看到类似下面的内容

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/EDGE1.png)

在 "update_url" 上放插入如下内容保存

```JSON
"manifest_version": 2,
```

### 使用主题

打开Edge浏览器的扩展

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/EDGE2.png)

勾选开发者模式，点击加载解压缩的扩展，选择你修改好的主题文件

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/EDGE3.png)

然后.....就没有然后了呢......

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/EDGE5.png)

### 关于更换和删除

更换可以直接加载新的主题就会替换原本的主题

删除的话可以在 设置-外观 中删除

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/EDGE6.png)

其次，主题在Edge上面使用是支持默认主题的 深/浅色 的，而且效果以外的好

![](https://cdn.jsdelivr.net/gh/RomEYer-AwELF/CDNimg/img/EDGE7.png)

如果你看到这里，你就会发现，这个教程非常简单，但是效果相当好。当然我并不知道这么好的东西为什么巨硬要藏着掖着（笑

这个是怎么发现的呢，实际上是差不多是我在转移某一个 Chrome 插件到 Edge 时由于选错目录导致报错发现的吧，毕竟报错的意思就是要求让 "manifest_version":  值为2，也就是抱着尝试的心态去改了一下.....嘛，也就是这样了（简而言之我水完了）

如果有发现其他有趣修改办法，也可以在下面评论