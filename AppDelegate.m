//
//  AppDelegate.m
//  highStakes
//
//  Created by Buwaneka Galpoththawela on 10/21/15.
//  Copyright © 2015 Buwaneka Galpoththawela. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark appearance 

//-(void)setupAppearance {
//    //    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor greenColor],NSFontAttributeName:[UIFont fontWithName:@"Halvetica-Light" size:24.0]}];
//    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor greenColor],NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Light" size:24.0]}];

//    [[UINavigationBar appearance]setBackgroundColor:[UIColor greenColor]];

//    [[UILabel appearanceWhenContainedIn:[GCAppearanceViewController class], nil] setFont:[UIFont fontWithName:@"Baskerville" size:19.0]];
//    
//    [[UITableViewCell appearance] setBackgroundColor:[UIColor grayColor]];
//    
//    [[UIButton appearance]setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    // [[UILabel appearanceWhenContainedIn:[UITableViewCell class], nil]setTextColor:[UIColor whiteColor]];// did not work
//    
//}


-(void)setupAppearance{
    //[[UILabel appearanceWhenContainedIn:[ViewController class], nil] setFont:]
    [[UINavigationBar appearance] setBackgroundColor:[UIColor colorWithRed:202 green:0 blue:0 alpha:1]];
   // [[UILabel ap]]
    
    
    [[UILabel appearance] setBackgroundColor:[UIColor colorWithRed:101 green:231 blue:232 alpha:1]];
    
   // [[UIView appearance] setBackgroundColor:[UIColor colorWithRed:202 green:0 blue:0 alpha:1]];
    
    
}

#pragma mark life cycle


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [Parse setApplicationId:@"k1m8ZOsFVSyK7eyKSeEHyVTmSAS4wFHVH24HvXMo"
                  clientKey:@"oO9iKWRohfWch1IUwyKCVfmBG2YvwlVfbQbCsZqm"];
    
        [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    [self setupAppearance];
        return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
