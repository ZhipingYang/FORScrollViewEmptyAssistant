//
//  FORViewController.m
//  FORScrollViewEmptyAssistant
//
//  Created by XcodeYang on 05/19/2016.
//  Copyright (c) 2016 XcodeYang. All rights reserved.
//

#import "FORViewController.h"
#import <MJRefresh/MJRefresh.h>
#import <FORScrollViewEmptyAssistant/FORScrollViewEmptyAssistant.h>

@interface FORViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (strong, nonatomic) NSMutableArray *dataArray;

@property (nonatomic) BOOL emptyDisplayCondition;

@end

@implementation FORViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dataArray = [NSMutableArray array];
    self.tableview.tableFooterView = [UIView new];
    self.emptyDisplayCondition = NO;
    
    self.tableview.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadDataSuccess];
    }];
    
    // method one 配置方法1
    typeof(self) weakSelf = self;
    [self.tableview emptyViewConfigerBlock:^(FOREmptyAssistantConfiger *configer) {
        
        UIImage *image = [UIImage imageNamed:@"blank_button"];
        image = [image stretchableImageWithLeftCapWidth:image.size.width/2.0 topCapHeight:image.size.height/2.0];
        configer.emptyBtnBackgroundImage = image;
        
        CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
        anim.values = @[@0.8, @1, @1.2, @0.9, @1.1, @1];
        anim.duration = 0.6;
        configer.imageAnimation = anim;
        
        configer.emptyTitle = @"Hello World";
        configer.emptyTitleFont = [UIFont boldSystemFontOfSize:22];
        configer.emptySubtitle = @"Talk is cheap. Show me the code";
        configer.emptyImage = [UIImage imageNamed:@"image_empty"];
        configer.emptySpaceHeight = 20;
        configer.emptyBtnTitle = @"Request Net";
        configer.emptyBtntitleFont = [UIFont boldSystemFontOfSize:19];
        configer.emptyCenterOffset = -50;
        configer.emptyBtnClickBlock = ^{
            [weakSelf.tableview.mj_header beginRefreshing];
        };
        configer.shouldDisplay = ^{
            return weakSelf.emptyDisplayCondition;
        };
        configer.emptyViewTapBlock = ^{
            [[[UIAlertView alloc] initWithTitle:@"EmptyView Tapped" message:@"add some event when empty view tapped" delegate:nil cancelButtonTitle:@"Sure" otherButtonTitles:nil] show];
        };
    }];
    
    
    /*
     // method two 配置方法2
     typeof(self) weakSelf = self;
     FOREmptyAssistantConfiger *configer = [FOREmptyAssistantConfiger new];
     configer.emptyTitle = @"This is demo";
     configer.emptySubtitle = @"tap this to request network \n hurry up";
     configer.emptyViewTapBlock = ^{
     [weakSelf.tableview.mj_header beginRefreshing];
     };
     [self.tableview emptyViewConfiger:configer];
     
     // method three 配置方法3
     UIView *view = [[[NSBundle mainBundle] loadNibNamed:@"FORCustomCell" owner:nil options:nil] firstObject];
     FOREmptyAssistantConfiger *configer = [FOREmptyAssistantConfiger new];
     configer.customView = view;
     configer.shouldDisplay = ^BOOL{
     return weakSelf.emptyDisplayCondition;
     };
     [self.tableview emptyViewConfiger:configer];
     */
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.tableview.mj_header beginRefreshing];
    self.emptyDisplayCondition = YES;
}

- (void)loadDataSuccess {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableview.mj_header endRefreshing];
        
        for (int i=0; i<arc4random()%3+2; i++) {
            [self.dataArray addObject:[[NSDate date] description]];
            //TODO: not support insertRowsAtIndexPaths:withRowAnimation: on DZNEmptyDataSet
//            NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:[self.dataArray count]-1 inSection:0];
//            [self.tableview insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
        [self.tableview reloadData];
    });
}

- (IBAction)deleteAll:(id)sender {
    [self.dataArray removeAllObjects];
    [self.tableview reloadData];
}

- (CGFloat)getRandomFloat{
    return (arc4random()%100 + 156)/256.f;
}

#pragma mark - UITableView Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor colorWithRed:[self getRandomFloat]
                                               green:[self getRandomFloat]
                                                blue:[self getRandomFloat]
                                               alpha:1];
    return cell;
}

#pragma mark - UITableView Delegate methods

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.dataArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        if (self.dataArray.count==0) {
            //TODO: not support "deleteRowsAtIndexPaths:withRowAnimation:" on DZNEmptyDataSet
            //reloadData is necessary
            [self deleteAll:nil];
        }
    }
}

@end
