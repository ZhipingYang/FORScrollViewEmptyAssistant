//
//  FORCollectionViewController.m
//  FORScrollViewEmptyAssistant_Example
//
//  Created by Daniel on 22/03/2018.
//  Copyright © 2018 XcodeYang. All rights reserved.
//

#import "FORCollectionViewController.h"
#import <FORScrollViewEmptyAssistant/FORScrollViewEmptyAssistant.h>

@interface FORCollectionViewController ()
{
    NSInteger _numberOfCount;
}
@end

@implementation FORCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _numberOfCount = arc4random()%40;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    [self.collectionView emptyViewConfigerBlock:^(FOREmptyAssistantConfiger * _Nonnull configer) {
        
        UIImage *image = [UIImage imageNamed:@"blank_button"];
        image = [image stretchableImageWithLeftCapWidth:image.size.width/2.0 topCapHeight:image.size.height/2.0];
        configer.emptyBtnBackgroundImage = image;
        
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        animation.duration = 0.6;
        animation.values = @[ @(-20), @(20), @(-20), @(20), @(-10), @(10), @(-5), @(5), @(0) ];
        configer.imageAnimation = animation;
        
        configer.emptyTitle = @"Hello World";
        configer.emptyTitleFont = [UIFont boldSystemFontOfSize:22];
        configer.emptySubtitle = @"Talk is cheap. Show me the code";
        configer.emptyImage = [UIImage imageNamed:@"image_empty"];
        configer.emptySpaceHeight = 20;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)refreshAction:(UIBarButtonItem *)sender {
    _numberOfCount = arc4random()%40;
    [self.collectionView reloadData];
}

- (IBAction)cleanDataAction:(UIBarButtonItem *)sender {
    _numberOfCount = 0;
    [self.collectionView reloadData];
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _numberOfCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.contentView.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0
                                                       green:arc4random()%255/255.0
                                                        blue:arc4random()%255/255.0
                                                       alpha:1];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
