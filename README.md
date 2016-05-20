# FORScrollViewEmptyAssistant

[![CI Status](http://img.shields.io/travis/ZhipingYang/FORScrollViewEmptyAssistant.svg?style=flat)](https://travis-ci.org/ZhipingYang/FORScrollViewEmptyAssistant)
[![Version](https://img.shields.io/cocoapods/v/FORScrollViewEmptyAssistant.svg?style=flat)](http://cocoapods.org/pods/FORScrollViewEmptyAssistant)
[![License](https://img.shields.io/cocoapods/l/FORScrollViewEmptyAssistant.svg?style=flat)](http://cocoapods.org/pods/FORScrollViewEmptyAssistant)
[![Platform](https://img.shields.io/cocoapods/p/FORScrollViewEmptyAssistant.svg?style=flat)](http://cocoapods.org/pods/FORScrollViewEmptyAssistant)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

```objc
// common initialization

[FORScrollViewEmptyAssistant emptyWithContentView:self.tableview configerBlock:^(FOREmptyAssistantConfiger *configer) {
        configer.emptyTitle = @"Hello World";
        configer.emptySubtitle = @"Talk is cheap. Show me the code";
        configer.emptyImage = [UIImage imageNamed:@"image_empty"];
        configer.shouldDisplay = ^{
            // return bool value 
        };
}];

FOREmptyAssistantConfiger *configer = [FOREmptyAssistantConfiger new];
configer.emptyImage = [UIImage imageNamed:@"image_empty"];
configer.emptyTitle = @"Hello World";
[FORScrollViewEmptyAssistant emptyWithContentView:scrollView emptyConfiger:configer];
```

```objc
// with button named request
[FORScrollViewEmptyAssistant emptyWithContentView:scrollView
                                    configerBlock:^(FOREmptyAssistantConfiger *configer) {
                                        configer.emptyImage = [UIImage imageNamed:@""];
                                        configer.emptyTitle = @"Net error,Please request again";
                                        ...
                                        }
                                    emptyBtnTitle:@"Request"
                              emptyBtnActionBlock:^{
                                      //action code
                                  }];
```

## Requirements
**声明：**本库是基于[DZNEmptyDataSet](https://github.com/dzenbot/DZNEmptyDataSet)的基础上做的封装，目的就是：
>- 简易使用于TableView和CollectionView上
>- 改进灵活度，根据不同状态切换不同的空白页（例如：网络失败 / 请求成功的空数据）。

**说明：**[DZNEmptyDataSet](https://github.com/dzenbot/DZNEmptyDataSet)及本库的封装都是基于dataSource的array数组为空时才回展示，更确切的说是cell的个数为零。

**提醒：**除了TableView和CollectionView初始化不需要reload，其他情况下数据为空时需要触发reloadData方法来呈现空白页占位图。

> TableView几乎在所有的项目中都需要用到,那呈现出的空数据或者网络连接失败状态下的TableView或CollectionView要是没有做相对应的说明，使用者很容易会迷惑甚至不知所措，并且大量的列表存在为空的可能性时需要我们做大量的配置也是一件很繁琐的事情，这就是这个库要解决的问题

使用空白页占位图的***优点***：

- 避免了一整片空白的视图，解释为什么当前页是这样的
- 可以添加一个回调事件
- 避免强类型提示的突兀出现（UIAlerView、HUDProgress等等）
- 更快引导用户入门
- 使用logo加深品牌的影响

真实项目中的空白页占位图图样案例：

![Screenshots_Row1](https://raw.githubusercontent.com/dzenbot/UITableView-DataSet/master/Examples/Applications/Screenshots/Screenshots_row1.png)
![Screenshots_Row2](https://raw.githubusercontent.com/dzenbot/UITableView-DataSet/master/Examples/Applications/Screenshots/Screenshots_row2.png)

DZNEmptyDataSet及本库都可以实现如上的效果，这里例举本库实现的一些图样：
![Screenshot](https://github.com/ZhipingYang/FORScrollViewEmptyAssistant/raw/master/EmptyView.png)  

### 特征
- 大于等于 iOS6.0
- iPhone 和 iPad
- 限于在TableView和CollectionView上使用
- 对应元素一共有emptyImage、emptyTitle、emptySubtitle、emptyButton
- 可调整一些属性包括：
	- 中心图片或按钮图片
	- 上下间距（emptySpaceHeight）
	- 字体颜色（emptyTitle/Subtitle/ButtonColor）
	- 字体大小（emptyTitle/Subtitle/ButtonFont）
	- 整体中心位移调整（emptyCenterOffset）
	- 显示时是否屏蔽滑动手势（allowScroll）
	- 详细查看。。。
- 支持自动布局及屏幕旋转
- 不包含原库DZNEmptyDataSet的自定义空白页占位图（custom view），以后可以考虑如何接入在一功能

## Installation

FORScrollViewEmptyAssistant is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "FORScrollViewEmptyAssistant"
```

## Author

XcodeYang, xcodeyang@gmail.com

## License

FORScrollViewEmptyAssistant is available under the MIT license. See the LICENSE file for more info.
