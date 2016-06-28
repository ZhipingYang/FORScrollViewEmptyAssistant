//
//  FOREmptyView.h
//  51offer
//
//  Created by XcodeYang on 12/2/15.
//  Copyright © 2015 51offer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FOREmptyAssistantConfiger.h"

/**
 *  DZNEmptyData辅助，重新封装接口调用更简洁
 *  @bug 缺陷：目前还没有引入原库的customView来配置空白页
 *
 *  #简单配置#
 *  @see   emptyWithContentView:emptyConfiger:
 *  @see   emptyWithContentView:emptyConfiger:emptyBtnTitle:emptyBtnActionBlock:
 *
 *  #block配置#
 *  @see   emptyWithContentView:configerBlock:
 *  @see   emptyWithContentView:configerBlock:emptyBtnTitle:emptyBtnActionBlock:
 */
@interface FORScrollViewEmptyAssistant : NSObject

#pragma mark - ModelConfig
/**
 *  没有反馈按钮的空白页,用new一个配置类来配置空白页
 *
 *  @param contentView 空白页载体（UItableView之类）
 *  @param configer    空白页显示内容的配置对象
 *
 *  @return self
 */
+ (FORScrollViewEmptyAssistant *)emptyWithContentView:(UIScrollView *)contentView
                                        emptyConfiger:(FOREmptyAssistantConfiger *)configer;
/**
 *  有反馈按钮的空白页,用new一个配置类来配置空白页
 *
 *  @param contentView      空白页载体（UItableView之类）
 *  @param configer         空白页显示内容的配置对象
 *  @param btnTitle         空白页按钮标题
 *  @param btnActionBlock   空白页按钮事件响应回调
 *
 *  @return self
 */
+ (FORScrollViewEmptyAssistant *)emptyWithContentView:(UIScrollView *)contentView
                                        emptyConfiger:(FOREmptyAssistantConfiger *)configer
                                        emptyBtnTitle:(NSString *)btnTitle
                                  emptyBtnActionBlock:(void(^)())btnActionBlock;

#pragma mark - BlockConfig
/**
 *  没有反馈按钮的空白页,用闭包函数来配置空白页
 *
 *  @param contentView   空白页载体（UItableView之类）
 *  @param configerBlock 闭包函数配置空白页显示元素
 *
 *  @return self
 */
+ (FORScrollViewEmptyAssistant *)emptyWithContentView:(UIScrollView *)contentView
                                        configerBlock:(void (^)(FOREmptyAssistantConfiger *configer))configerBlock;

/**
 *  有反馈按钮的空白页,用闭包函数来配置空白页
 *
 *  @param contentView      空白页载体（UItableView之类）
 *  @param configerBlock    闭包函数配置空白页显示元素
 *  @param btnTitle         空白页按钮标题
 *  @param btnActionBlock   空白页按钮事件响应回调
 *
 *  @return self
 */
+ (FORScrollViewEmptyAssistant *)emptyWithContentView:(UIScrollView *)contentView
                                        configerBlock:(void (^)(FOREmptyAssistantConfiger *configer))configerBlock
                                        emptyBtnTitle:(NSString *)btnTitle
                                  emptyBtnActionBlock:(void(^)())btnActionBlock;
@end

/**
 *  需要在传入的contentView的空白页载体上引用EmptyAssistant作为contentView的一个property
 *  防止 EmptyAssistant 被释放掉
 */
@interface UIScrollView (FOREmptyAssistant)

/**
 *  动态添加的UIScrollView的property
 */
@property (nonatomic, strong) FORScrollViewEmptyAssistant *assistant;

@end
