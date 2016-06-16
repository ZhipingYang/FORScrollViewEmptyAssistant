//
//  FOREmptyAssistantConfiger.h
//  51offer
//
//  Created by XcodeYang on 12/10/15.
//  Copyright © 2015 51offer. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  是否显示空白页的Block
 *  @return 返回Bool是否应当显示空白页
 */
typedef BOOL(^ShouldDisplay)();

/**
 *  空白页的常用参数配置类，参数可以根据配置是否显示
 */
@interface FOREmptyAssistantConfiger : NSObject

///空白页的占位图icon，有则显示，无则消失
@property (nonatomic, strong)   UIImage *emptyImage;

/// default @""
@property (nonatomic, copy)     NSString *emptyTitle;
/// default systemFontOfSize:17.0f
@property (nonatomic, strong)   UIFont *emptyTitleFont;
/// default darkGrayColor
@property (nonatomic, strong)   UIColor *emptyTitleColor;

/// default @""
@property (nonatomic, copy)     NSString *emptySubtitle;
/// default systemFontOfSize:15.0f
@property (nonatomic, strong)   UIFont *emptySubtitleFont;
/// default lightGrayColor
@property (nonatomic, strong)   UIColor *emptySubtitleColor;

/// default systemFontOfSize:17.0f
@property (nonatomic, strong)   UIFont *emptyBtntitleFont;
/// default whiteColor
@property (nonatomic, strong)   UIColor *emptyBtntitleColor;
/// default "blank_button"
@property (nonatomic, strong)   UIImage *emptyBtnImage;


/**
 *  空白页整体位置默认是在tableView居中显示
 *  default CGPointZero
 */
@property (nonatomic)   CGPoint emptyCenterOffset;


/**
 *  空白页的图片、按钮、文案之间的间距大小
 *  default (x:0, y:-30)
 */
@property (nonatomic)   CGFloat emptySpaceHeight;

/**
 *  添加空白页后ScrollView是否可以继续拖拽
 *  default YES
 */
@property (nonatomic)   BOOL allowScroll;

/**
 *  添加空白页后ScrollView是否可以展示
 *  default YES
 */
@property (nonatomic)   ShouldDisplay shouldDisplay;

@end

