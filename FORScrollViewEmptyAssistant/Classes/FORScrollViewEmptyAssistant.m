//
//  FOREmptyView.m
//  51offer
//
//  Created by XcodeYang on 12/2/15.
//  Copyright © 2015 51offer. All rights reserved.
//

#import "FORScrollViewEmptyAssistant.h"
#import "UIScrollView+EmptyDataSet.h"
#import <objc/runtime.h>

static char const * const kEmptyAssistant = "kEmptyAssistant";

@implementation UIScrollView (FOREmptyAssistant)
- (FORScrollViewEmptyAssistant *)assistant
{
    return objc_getAssociatedObject(self, kEmptyAssistant);
}
- (void)setAssistant:(FORScrollViewEmptyAssistant *)assistant
{
    objc_setAssociatedObject(self, kEmptyAssistant, assistant, OBJC_ASSOCIATION_RETAIN);
}
@end

@interface FORScrollViewEmptyAssistant ()<DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>

@property (nonatomic, strong)   FOREmptyAssistantConfiger *emptyConfiger;
@property (nonatomic, copy)     NSString *emptyBtnTitle;
@property (nonatomic, copy)     void(^emptyBtnActionBlock)();

@end

@implementation FORScrollViewEmptyAssistant
{
    __weak UIScrollView *_emptyContentView;
}

+ (FORScrollViewEmptyAssistant *)emptyWithContentView:(UIScrollView *)contentView
                              emptyConfiger:(FOREmptyAssistantConfiger *)configer;
{
    FORScrollViewEmptyAssistant *emptyView = [[FORScrollViewEmptyAssistant alloc] initWithContentView:contentView
                                                                                             configer:configer];
    return emptyView;
}

+ (FORScrollViewEmptyAssistant *)emptyWithContentView:(UIScrollView *)contentView
                              emptyConfiger:(FOREmptyAssistantConfiger *)configer
                              emptyBtnTitle:(NSString *)btnTitle
                        emptyBtnActionBlock:(void(^)())btnActionBlock;
{
    FORScrollViewEmptyAssistant *emptyView = [[FORScrollViewEmptyAssistant alloc] initWithContentView:contentView
                                                                                             configer:configer];
    emptyView.emptyBtnTitle = btnTitle;
    emptyView.emptyBtnActionBlock = btnActionBlock;
    return emptyView;
}

+ (FORScrollViewEmptyAssistant *)emptyWithContentView:(UIScrollView *)contentView
                              configerBlock:(void (^)(FOREmptyAssistantConfiger *configer))configerBlock
{
    FOREmptyAssistantConfiger *configer = [FOREmptyAssistantConfiger new];
    !configerBlock ?: configerBlock(configer);
    FORScrollViewEmptyAssistant *emptyView = [[FORScrollViewEmptyAssistant alloc] initWithContentView:contentView
                                                                                             configer:configer];
    return emptyView;
}

+ (FORScrollViewEmptyAssistant *)emptyWithContentView:(UIScrollView *)contentView
                              configerBlock:(void (^)(FOREmptyAssistantConfiger *configer))configerBlock
                              emptyBtnTitle:(NSString *)btnTitle
                        emptyBtnActionBlock:(void(^)())btnActionBlock
{
    FOREmptyAssistantConfiger *configer = [FOREmptyAssistantConfiger new];
    !configerBlock ?: configerBlock(configer);
    FORScrollViewEmptyAssistant *emptyView = [[FORScrollViewEmptyAssistant alloc] initWithContentView:contentView
                                                                         configer:configer];
    emptyView.emptyBtnTitle = btnTitle;
    emptyView.emptyBtnActionBlock = btnActionBlock;
    return emptyView;

}


- (id)initWithContentView:(UIScrollView *)contentView configer:(FOREmptyAssistantConfiger *)configer
{
    self = [super init];
    if (self) {
        _emptyContentView = contentView;
        _emptyConfiger = configer;
        
        _emptyContentView.emptyDataSetSource = self;
        _emptyContentView.emptyDataSetDelegate = self;
        
        // check the scrollView's category   查看上面类目方法
        // catch the assistant in this way   持有对象，防止crash
        _emptyContentView.assistant = self;
    }
    return self;
}

#pragma mark - set

- (FOREmptyAssistantConfiger *)emptyConfiger {
    return _emptyConfiger ?: [FOREmptyAssistantConfiger new];
}

- (NSString *)emptyBtnTitle
{
    return _emptyBtnTitle ?: @"";
}

#pragma mark - DZNEmptyDataSetSource

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
{
    NSDictionary *attributes = @{NSFontAttributeName: self.emptyConfiger.emptyTitleFont,
                                 NSForegroundColorAttributeName: self.emptyConfiger.emptyTitleColor};
    
    return [[NSAttributedString alloc] initWithString:self.emptyConfiger.emptyTitle
                                           attributes:attributes];
}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView
{
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{NSFontAttributeName: self.emptyConfiger.emptySubtitleFont,
                                 NSForegroundColorAttributeName: self.emptyConfiger.emptySubtitleColor,
                                 NSParagraphStyleAttributeName: paragraph};
    
    return [[NSAttributedString alloc] initWithString:self.emptyConfiger.emptySubtitle attributes:attributes];
}

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    return self.emptyConfiger.emptyImage;
}

- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    NSDictionary *attributes = @{NSFontAttributeName: self.emptyConfiger.emptyBtntitleFont,
                                 NSForegroundColorAttributeName: self.emptyConfiger.emptyBtntitleColor};
    
    return [[NSAttributedString alloc] initWithString:self.emptyBtnTitle attributes:attributes];
}

- (UIImage *)buttonBackgroundImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    return self.emptyConfiger.emptyBtnImage;
}

- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIColor clearColor];
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView
{
    return self.emptyConfiger.allowScroll;
}

- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView
{
    return self.emptyConfiger.shouldDisplay ? self.emptyConfiger.shouldDisplay() : YES;
}

- (CGPoint)offsetForEmptyDataSet:(UIScrollView *)scrollView
{
    return self.emptyConfiger.emptyCenterOffset;
}

- (CGFloat)spaceHeightForEmptyDataSet:(UIScrollView *)scrollView
{
    return self.emptyConfiger.emptySpaceHeight;
}

#pragma mark - DZNEmptyDataSetDelegate

- (void)emptyDataSetDidTapButton:(UIScrollView *)scrollView
{
    !self.emptyBtnActionBlock ?: self.emptyBtnActionBlock();
}

@end





