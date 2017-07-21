# Cabbage

[![CI Status](http://img.shields.io/travis/EyreFree/Cabbage.svg?style=flat)](https://travis-ci.org/EyreFree/Cabbage)
[![Version](https://img.shields.io/cocoapods/v/Cabbage.svg?style=flat)](http://cocoapods.org/pods/Cabbage)
[![License](https://img.shields.io/cocoapods/l/Cabbage.svg?style=flat)](http://cocoapods.org/pods/Cabbage)
[![Platform](https://img.shields.io/cocoapods/p/Cabbage.svg?style=flat)](http://cocoapods.org/pods/Cabbage)

Cabbage 是一个用普通的 iOS 应用开发框架，基于 ReSwift 4.0.0。

> [English Introduction](https://github.com/EyreFree/Cabbage/blob/master/README.md)

## 示例

1. 利用 `git clone` 命令下载本仓库, `Example` 目录包含了示例程序；
2. 用 XCode 打开对应项目编译即可。

或执行以下命令：

```bash
git clone git@github.com:EyreFree/Cabbage.git; cd Cabbage/Example; open 'Cabbage.xcworkspace'
```

更多例子: [https://github.com/EyreFree/CabbageExamples](https://github.com/EyreFree/CabbageExamples)

## 环境

- XCode 8.0+
- Swift 3.0+
- iOS 8.0+

## 安装

Cabbage 可以通过 [CocoaPods](http://cocoapods.org) 进行获取。只需要在你的 Podfile 中添加如下代码就能实现引入：

```ruby
pod "Cabbage", '~> 0.0.1'
```

然后，执行如下命令即可：

```bash
$ pod install
```

## 使用

在你需要使用的地方添加如下代码引入 Cabbage 模块：

```swift
import Cabbage
```

## 协议

Cabbage 基于 MIT 协议进行分发和使用，更多信息参见协议文件。
