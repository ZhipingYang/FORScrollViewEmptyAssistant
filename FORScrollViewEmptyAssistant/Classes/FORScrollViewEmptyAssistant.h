//
//  FOREmptyView.h
//  51offer
//
//  Created by XcodeYang on 12/2/15.
//  Copyright © 2015 51offer. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "FOREmptyAssistantConfiger.h"

@interface UITableView (EmptyAsistant)

- (void)emptyViewConfigerBlock:(void (^)(FOREmptyAssistantConfiger *configer))configerBlock;

- (void)emptyViewConfiger:(FOREmptyAssistantConfiger *)configer;

@end

@interface UICollectionView (EmptyAsistant)

- (void)emptyViewConfigerBlock:(void (^)(FOREmptyAssistantConfiger *configer))configerBlock;

- (void)emptyViewConfiger:(FOREmptyAssistantConfiger *)configer;

@end

