# LSTTimer 性能和精度兼得的iOS计时器组件

[![Platform](https://img.shields.io/badge/platform-iOS-red.svg)](https://developer.apple.com/iphone/index.action) [![Language](http://img.shields.io/badge/language-OC-yellow.svg?style=flat )](https://en.wikipedia.org/wiki/Objective-C) [![License](https://img.shields.io/badge/license-MIT-blue.svg)](http://mit-license.org) [![CocoaPods Compatible](https://img.shields.io/cocoapods/v/LSTPopView.svg)](https://img.shields.io/cocoapods/v/LSTTimer.svg)

## 前言
- 在项目开发中,计时器任务的需求很多, LSTTimer的出现就是为了更好统一管理项目中的计时器任务. 
- 欢迎coder们发现问题或者提供更好的idea,一起努力完善

## 博客地址
- github: [https://github.com/LoSenTrad/LSTTimer](https://github.com/LoSenTrad/LSTTimer)
- 简书: [https://www.jianshu.com/p/4f05c7e26bb1](https://www.jianshu.com/p/4f05c7e26bb1)

## 实现思路
LSTTimer单例设计, 内部持有一个NSTimer和计时任务池, 所有的计时任务都被添加到任务池里面; NSTimer每100ms(毫秒)执行一次遍历计时任务池, 每个计时任务会进行的时间差运算.

## 特性

- 提供丰富的api,简单入手使用
- 单例设计,安全且占用内存少,统一管理app所有计时任务
- 单计时器任务池设计,一个NSTimer完成多个计时任务
- 计时任务精确度:100ms(100毫秒)
- 支持计时格式--> 天:时:分:秒:毫秒
- 支持硬盘持久化计时任务
- 支持列表计时任务和各种花里胡哨的计时任务

## 版本更新历史[点我](https://github.com/LoSenTrad/LSTTimer/blob/master/UPDATE_HISTORY.md)

## 安装

- CocoaPods安装: 在podfile文件中添加以下描述,然后 `pod install` 或者 `pod update`

  ```ruby
  pod 'LSTTimer'
  ```  
- Carthage安装:(暂时未适配)
    
## 效果演示(gif图比较大,请耐心等待~)

- 应用市场常用的示例场景
    - 支持 天:时:分:秒:毫秒 
    - 列表计时方案:只需一个计时任务

|常用示例场景<br><img src="https://raw.githubusercontent.com/5208171/LSTBlog/master/LSTTimer/%E5%B8%B8%E7%94%A8%E8%AE%A1%E6%97%B6%E4%BB%BB%E5%8A%A1%E7%A4%BA%E4%BE%8B.gif" width = "200" height = "424" alt="图片名称" align=center />|列表倒计时<br><img src="https://raw.githubusercontent.com/5208171/LSTBlog/master/LSTTimer/%E5%88%97%E8%A1%A8%E5%80%92%E8%AE%A1%E6%97%B6.gif" width = "200" height = "424" alt="图片名称" align=center />|
|---|---|

- 内存计时任务
(当前页面添加计时任务,退出当前页面,计时任务不会停止,而是存在于app的整个生命周期内.当然了,也可以手动移除)

|内存计时任务<br><img src="https://raw.githubusercontent.com/5208171/LSTBlog/master/LSTTimer/%E5%86%85%E5%AD%98%E8%AE%A1%E6%97%B6%E4%BB%BB%E5%8A%A1.gif" width = "200" height = "424" alt="图片名称" align=center />|
|---|

- 硬盘计时任务

(当前页面添加硬盘计时任务,退出app,计时任务保存在硬盘,再次打开进入app,如果计时任务没有结束,继续该计时任务)

|自动规避键盘遮挡<br><img src="https://raw.githubusercontent.com/5208171/LSTBlog/master/LSTTimer/%E7%A1%AC%E7%9B%98%E8%AE%A1%E6%97%B6%E4%BB%BB%E5%8A%A1.gif" width = "200" height = "424" alt="图片名称" align=center />|
|---|
           

## 作者

490790096@qq.com, LoSenTrad@163.com

## 版权

 尊重劳动成果, 人人有责.
     



        
    
