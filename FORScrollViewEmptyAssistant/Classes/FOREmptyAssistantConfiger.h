//
//  FOREmptyAssistantConfiger.h
//  51offer
//
//  Created by XcodeYang on 12/10/15.
//  Copyright © 2015 51offer. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef BOOL(^ShouldDisplay)();

@interface FOREmptyAssistantConfiger : NSObject

@property (nonatomic, strong)   UIImage *emptyImage;

// default @""
@property (nonatomic, copy)     NSString *emptyTitle;
// default systemFontOfSize:17.0f
@property (nonatomic, strong)   UIFont *emptyTitleFont;
// default darkGrayColor
@property (nonatomic, strong)   UIColor *emptyTitleColor;


// default @""
@property (nonatomic, copy)     NSString *emptySubtitle;
// default systemFontOfSize:15.0f
@property (nonatomic, strong)   UIFont *emptySubtitleFont;
// default lightGrayColor
@property (nonatomic, strong)   UIColor *emptySubtitleColor;

// default systemFontOfSize:17.0f
@property (nonatomic, strong)   UIFont *emptyBtntitleFont;
// default whiteColor
@property (nonatomic, strong)   UIColor *emptyBtntitleColor;
// default "blank_button"
@property (nonatomic, strong)   UIImage *emptyBtnImage;


// default CGPointZero
//空白页整体位置默认是在tableView居中显示
@property (nonatomic)   CGPoint emptyCenterOffset;

// default (x:0, y:-30)
//空白页的图片、按钮、文案之间的间距大小
@property (nonatomic)   CGFloat emptySpaceHeight;

// default YES
//添加空白页后ScrollView是否可以继续拖拽
@property (nonatomic)   BOOL allowScroll;

// default YES
//添加空白页后ScrollView是否可以展示
@property (nonatomic)   ShouldDisplay shouldDisplay;

@end

