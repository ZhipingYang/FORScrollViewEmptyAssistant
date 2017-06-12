# FORScrollViewEmptyAssistant

[![CI Status](http://img.shields.io/travis/ZhipingYang/FORScrollViewEmptyAssistant.svg?style=flat)](https://travis-ci.org/ZhipingYang/FORScrollViewEmptyAssistant)
[![Version](https://img.shields.io/cocoapods/v/FORScrollViewEmptyAssistant.svg?style=flat)](http://cocoapods.org/pods/FORScrollViewEmptyAssistant)
[![License](https://img.shields.io/cocoapods/l/FORScrollViewEmptyAssistant.svg?style=flat)](http://cocoapods.org/pods/FORScrollViewEmptyAssistant)
[![Platform](https://img.shields.io/cocoapods/p/FORScrollViewEmptyAssistant.svg?style=flat)](http://cocoapods.org/pods/FORScrollViewEmptyAssistant)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

**block config**

```objective-c
    // easy emptyview's layout
    [self.tableview emptyViewConfigerBlock:^(FOREmptyAssistantConfiger *configer) {
        configer.emptyTitle = @"Hello World";
        configer.emptySubtitle = @"Talk is cheap. Show me the code";
        configer.emptyImage = [UIImage imageNamed:@"image_empty"];
    }];
    
    // complicated 
    typeof(self) weakSelf = self;
    
    [self.tableview emptyViewConfigerBlock:^(FOREmptyAssistantConfiger *configer) {
        configer.emptyTitle = @"Hello World";
        configer.emptySubtitle = @"Talk is cheap. Show me the code";
        configer.emptyImage = [UIImage imageNamed:@"image_empty"];
        configer.imageAnimation = imageAnimation;
        configer.emptyBtnTitle = @"Request Net";
        configer.emptyBtnClickBlock = ^{
            [weakSelf.tableview.mj_header beginRefreshing];
        };
    }];
    
```

**custom view as emptyView**

```objective-c

    typeof(self) weakSelf = self;
    
    FOREmptyAssistantConfiger *configer = [FOREmptyAssistantConfiger new];
    configer.emptyTitle = @"This is demo";
    configer.emptySubtitle = @"tap this to request network \n hurry up";
    configer.emptyViewTapBlock = ^{
        [weakSelf.tableview.mj_header beginRefreshing];
    };
    
    [self.tableview emptyViewConfiger:configer];
    
```
**custom view as emptyView**

```objective-c

     UIView *customView = [[[NSBundle mainBundle] loadNibNamed:@"FORCustomCell" owner:nil options:nil] firstObject];
     
     FOREmptyAssistantConfiger *configer = [FOREmptyAssistantConfiger new];
     configer.customView = customView;
     
     [self.tableview emptyViewConfiger:configer];
     
```
<img width="200" alt="wx20170601-170002 2x" src="https://cloud.githubusercontent.com/assets/9360037/26672453/cfdd51ea-46eb-11e7-8746-1bacf58dfe8d.png"> <img width="250" alt="wx20170601-170002 2x" src="https://cloud.githubusercontent.com/assets/9360037/26672501/0263db48-46ec-11e7-9000-2400e71e1a3f.jpeg">

## Requirements
**声明：**本库是基于[DZNEmptyDataSet](https://github.com/dzenbot/DZNEmptyDataSet)的基础上做的封装，目的就是：
>- 简易使用于TableView和CollectionView上
>- 改进灵活度，根据不同状态切换不同的空白页（例如：网络失败 / 请求成功的空数据）。

**说明：**[DZNEmptyDataSet](https://github.com/dzenbot/DZNEmptyDataSet)及本库的封装都是基于dataSource的array数组为空时才回展示，更确切的说是cell的个数为零。

**提醒：**除了TableView和CollectionView初始化不需要reload，其他情况下数据为空时需要触发reloadData方法来呈现空白页占位图，内部swizzle了reloadData方法。

> TableView几乎在所有的项目中都需要用到,那呈现出的空数据或者网络连接失败状态下的TableView或CollectionView要是没有做相对应的说明，使用者很容易会迷惑甚至不知所措，并且大量的列表存在为空的可能性时需要我们做大量的配置也是一件很繁琐的事情，这就是这个库要解决的问题

使用空白页占位图的***优点***：

- 避免了一整片空白的视图，解释为什么当前空白页是这样的
- 可以添加一些交互回调事件
- 避免强类型提示的突兀出现（UIAlerView、HUDProgress等等）
- 更快引导用户入门
- 使用logo加深品牌的影响

真实项目中的空白页占位图图样案例：

DZNEmptyDataSet及本库都可以实现如上的效果，这里例举本库实现的一些图样：

<img width="250" alt="wx20170601-170002 2x" src="https://cloud.githubusercontent.com/assets/9360037/26672500/0260edac-46ec-11e7-9026-d22a5dcdd1fd.jpeg"> <img width="250" alt="wx20170601-170002 2x" src="https://cloud.githubusercontent.com/assets/9360037/26672502/0268a2cc-46ec-11e7-9594-4d81a1626748.jpeg"> <img width="250" alt="wx20170601-170002 2x" src="https://cloud.githubusercontent.com/assets/9360037/26672503/02751372-46ec-11e7-9916-4ed6d69052dc.jpeg">

### 特征
- >= iOS6.0
- iPhone 和 iPad
- 限于在TableView和CollectionView上使用
- 对应元素一共有emptyImage、emptyTitle、emptySubtitle、emptyButton
- 支持自动布局及屏幕旋转(Autolayout)
- 可调整一些属性包括：


| 属性  | 类型 |  说明 |  默认值  |
| -------- | --------| ------ |------ |
|  |  |  |  |
| **DataSource** |  |  |  |
|  |  |  |  |
| emptyTitle   | NSString |   标题 |  `@""`  |
| emptyTitleFont   | UIFont |   标题字体 |  `systemFontOfSize:17.0f`  |
| emptyTitleColor   | UIColor |   标题颜色 |  `darkGrayColor`  |
|  |  |  |  |
| emptySubtitle   | NSString |   副标题 |  `@""`  |
| emptySubtitleFont   | UIFont |   副标题字体 |  `systemFontOfSize:15.0f`  |
| emptySubtitleColor   | UIColor |   副标题颜色 |  `lightGrayColor`  |
|  |  |  |  |
| emptyImage   | UIImage |   空白页占位图 |  `nil`  |
|  |  |  |  |
| emptyBtnTitle   |  NSString |  按钮标题 |  `@""`  |
| emptyBtntitleFont   | UIFont |   按钮字体 |  `systemFontOfSize:17.0f`  |
| emptyBtnTitleColor   | UIColor |   按钮标题颜色 |  `whiteColor`  |
| emptyBtnImage   |  UIImage |  按钮icon |  `nil`  |
| emptyBtnBackgroundImage   | UIImage |   按钮背景图片 |  `blank_button`  |
|  |  |  |  |
| customView   | UIView |  自定义空白view（则前面设置的样式全部失效） |  `nil`  |
| emptyCenterOffset   | CGPoint |   空白页整体位置默认是在tableView居中显示 |  `(x:0, y:-30)`  |
| emptySpaceHeight   | CGFloat |   空白页的图片、按钮、文案之间的间距大小 | `20`  |
|  |  |  |  |
| **Delegate** | |||
|  |  |  |  |
| allowScroll   |  BOOL |  添加空白页后ScrollView是否可以继续拖拽 |  `YES`  |
| userInteractionEnabled   | BOOL |   可交互 |  `YES`  |
| shouldDisplay   |  BOOL(^)() |  添加空白页后ScrollView是否可以展示 |  `YES`  |
|  |  |  |  |
| shouldStartImageViewAnimate   | BOOL(^)() |   空白页的图片是否执行动画 |  `YES`  |
| imageAnimation   |  CAAnimation |  图片的动画, Note: shouldStartAnimate==NO || imageAnimation==nil || emptyImage==nil 三者成立一个就不执行动画 |  `[CAAnimation new]`  |
|  |  |  |  |
| emptyViewTapBlock   |  void(^)() |  空白页区域点击 |  `/`  |
| emptyBtnClickBlock   |  void(^)() |  按钮点击 |  `/`  |
|  |  |  |  |
| **Life Cirlce** |  |||
|  |  |  |  |
| emptyViewWillAppear   |  void(^)() |  life cricle |  `/`  |
| emptyViewWillDisappear   | void(^)() |   life cricle |  `/`  |
| emptyViewDidAppear   |  void(^)() |  life cricle |  `/`  |
| emptyViewDidDisappear   |  void(^)() |  life cricle |  `/`  |


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
