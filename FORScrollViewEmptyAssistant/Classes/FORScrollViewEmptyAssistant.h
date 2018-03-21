//
//  FOREmptyView.h
//  51offer
//
//  Created by XcodeYang on 12/2/15.
//  Copyright © 2015 51offer. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "FOREmptyAssistantConfiger.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (EmptyAsistant)

- (void)emptyViewConfigerBlock:(nullable void (^)(FOREmptyAssistantConfiger *configer))configerBlock;

- (void)emptyViewConfiger:(nullable FOREmptyAssistantConfiger *)configer;

@end

@interface UICollectionView (EmptyAsistant)

- (void)emptyViewConfigerBlock:(nullable void (^)(FOREmptyAssistantConfiger *configer))configerBlock;

- (void)emptyViewConfiger:(nullable FOREmptyAssistantConfiger *)configer;

@end

NS_ASSUME_NONNULL_END
