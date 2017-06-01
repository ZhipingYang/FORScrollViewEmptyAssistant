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
        self.userInteractionEnabled = YES;
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

- (NSString *)emptyBtnTitle
{
    return _emptyBtnTitle ?: @"";
}

- (UIImage *)emptyBtnImage
{
    return _emptyBtnImage ?: [UIImage imageNamed:@"blank_button"];
}

#pragma mark - DZNEmptyDataSetSource

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
{
    NSDictionary *attributes = @{NSFontAttributeName: self.emptyTitleFont,
                                 NSForegroundColorAttributeName: self.emptyTitleColor};
    
    return [[NSAttributedString alloc] initWithString:self.emptyTitle
                                           attributes:attributes];
}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView
{
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{NSFontAttributeName: self.emptySubtitleFont,
                                 NSForegroundColorAttributeName: self.emptySubtitleColor,
                                 NSParagraphStyleAttributeName: paragraph};
    
    return [[NSAttributedString alloc] initWithString:self.emptySubtitle attributes:attributes];
}

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    return self.emptyImage;
}

- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    NSDictionary *attributes = @{NSFontAttributeName: self.emptyBtntitleFont,
                                 NSForegroundColorAttributeName: self.emptyBtntitleColor};
    
    return [[NSAttributedString alloc] initWithString:self.emptyBtnTitle attributes:attributes];
}

- (UIImage *)buttonBackgroundImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    return self.emptyBtnImage;
}

- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIColor clearColor];
}

- (UIView *)customViewForEmptyDataSet:(UIScrollView *)scrollView
{
    return self.customView;
}

- (CGPoint)offsetForEmptyDataSet:(UIScrollView *)scrollView
{
    return self.emptyCenterOffset;
}

- (CGFloat)spaceHeightForEmptyDataSet:(UIScrollView *)scrollView
{
    return self.emptySpaceHeight;
}

#pragma mark - DZNEmptyDataSetDelegate

- (BOOL)emptyDataSetShouldAllowTouch:(UIScrollView *)scrollView
{
    return self.userInteractionEnabled;
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView
{
    return self.allowScroll;
}

- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView
{
    return self.shouldDisplay ? self.shouldDisplay() : YES;
}

- (void)emptyDataSetDidTapView:(UIScrollView *)scrollView
{
    !self.emptyViewTapBlock ?: self.emptyViewTapBlock();
}

- (void)emptyDataSetDidTapButton:(UIScrollView *)scrollView
{
    !self.emptyBtnClickBlock ?: self.emptyBtnClickBlock();
}

- (void)emptyDataSetWillAppear:(UIScrollView *)scrollView
{
    !self.emptyViewWillAppear ?: self.emptyViewWillAppear();
}

- (void)emptyDataSetWillDisappear:(UIScrollView *)scrollView
{
    !self.emptyViewWillDisappear ?: self.emptyViewWillDisappear();
}

@end

