//
//  FOREmptyAssistantConfiger.h
//  51offer
//
//  Created by XcodeYang on 12/10/15.
//  Copyright © 2015 51offer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>

NS_ASSUME_NONNULL_BEGIN

@interface FOREmptyAssistantConfiger : NSObject <DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>

#pragma mark - datasource

/**
 default nil
 */
@property (nonatomic, strong, nullable) UIImage *emptyImage;

/**
 default @""
 */
@property (nonatomic, copy, nullable) NSString *emptyTitle;

/**
 default systemFontOfSize:17.0f
 */
@property (nonatomic, strong) UIFont *emptyTitleFont;

/**
 default darkGrayColor
 */
@property (nonatomic, strong) UIColor *emptyTitleColor;

/**
 default @""
 */
@property (nonatomic, copy, nullable) NSString *emptySubtitle;

/**
 default systemFontOfSize:15.0f
 */
@property (nonatomic, strong) UIFont *emptySubtitleFont;

/**
 default lightGrayColor
 */
@property (nonatomic, strong) UIColor *emptySubtitleColor;

/**
 default nil
 */
@property (nonatomic, copy, nullable) NSString *emptyBtnTitle;

/**
 default systemFontOfSize:17.0f
 */
@property (nonatomic, strong) UIFont *emptyBtntitleFont;

/**
 default whiteColor
 */
@property (nonatomic, strong) UIColor *emptyBtnTitleColor;

/**
 default nil
 */
@property (nonatomic, strong, nullable) UIImage *emptyBtnImage;

// default nil
@property (nonatomic, strong, nullable) UIImage *emptyBtnBackgroundImage;

// 自定义通用的空白view
@property (nonatomic, strong) UIView *customView;

/**
 空白页整体位置默认是在tableView居中显示: default 0
 */
@property (nonatomic) CGFloat emptyCenterOffset;

/**
 空白页的图片、按钮、文案之间的间距大小: default 20
 */
@property (nonatomic) CGFloat emptySpaceHeight;

#pragma mark - delegate

/**
 添加空白页后ScrollView是否可以继续拖拽: default YES
 */
@property (nonatomic) BOOL allowScroll;

/**
 default YES
 */
@property (nonatomic) BOOL userInteractionEnabled;

/**
 添加空白页后ScrollView是否可以展示: default YES
 */
@property (nonatomic, copy) BOOL(^shouldDisplay)();

/**
 空白页区域点击
 */
@property (nonatomic, copy) void(^emptyViewTapBlock)();

/**
 按钮点击
 */
@property (nonatomic, copy) void(^emptyBtnClickBlock)();

/**
 空白页的图片是否执行动画: default YES
 */
@property (nonatomic, copy) BOOL(^shouldStartImageViewAnimate)();

/**
 图片的动画,
 Note: shouldStartAnimate==NO || imageAnimation==nil || emptyImage==nil 三者成立一个就不执行动画
 */
@property (nonatomic, strong) CAAnimation *imageAnimation;

// life cricle
@property (nonatomic, copy) void(^emptyViewWillAppear)();
@property (nonatomic, copy) void(^emptyViewWillDisappear)();
@property (nonatomic, copy) void(^emptyViewDidAppear)();
@property (nonatomic, copy) void(^emptyViewDidDisappear)();

@end

NS_ASSUME_NONNULL_END
