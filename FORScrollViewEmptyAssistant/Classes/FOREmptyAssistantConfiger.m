//
//  FOREmptyAssistantConfiger.m
//  51offer
//
//  Created by XcodeYang on 12/10/15.
//  Copyright © 2015 51offer. All rights reserved.
//

#import "FOREmptyAssistantConfiger.h"


@implementation FOREmptyAssistantConfiger

- (instancetype)init
{
    if (self = [super init]) {
        self.emptyCenterOffset = CGPointMake(0, -30);
        self.emptySpaceHeight = 20;
        self.allowScroll = YES;
    }
    return self;
}

- (NSString *)emptyTitle
{
    return _emptyTitle ?: @"";
}

- (NSString *)emptySubtitle
{
    return _emptySubtitle ?: @"";
}

- (UIFont *)emptyTitleFont
{
    return _emptyTitleFont ?: [UIFont boldSystemFontOfSize:17.0f];
}

- (UIFont *)emptySubtitleFont
{
    return _emptySubtitleFont ?: [UIFont systemFontOfSize:15.0f];
}

- (UIFont *)emptyBtntitleFont
{
    return _emptyBtntitleFont ?: [UIFont systemFontOfSize:17.0f];
}

- (UIColor *)emptyTitleColor
{
    return _emptyTitleColor ?: [UIColor darkGrayColor];
}

- (UIColor *)emptySubtitleColor
{
    return _emptySubtitleColor ?: [UIColor lightGrayColor];
}

- (UIColor *)emptyBtntitleColor
{
    return _emptyBtntitleColor ?: [UIColor whiteColor];
}

- (UIImage *)emptyBtnImage
{
    return _emptyBtnImage ?: [UIImage imageNamed:@"blank_button"];
}


@end

