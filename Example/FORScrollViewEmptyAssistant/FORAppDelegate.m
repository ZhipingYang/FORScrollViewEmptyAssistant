//
//  FORAppDelegate.m
//  FORScrollViewEmptyAssistant
//
//  Created by XcodeYang on 05/19/2016.
//  Copyright (c) 2016 XcodeYang. All rights reserved.
//

#import "FORAppDelegate.h"
#import <FORGestureTrackDisplay/FORGestureTrack.h>

@implementation FORAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self.window startTracking];
    return YES;
}

@end
