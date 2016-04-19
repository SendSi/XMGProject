//
//  XMGTabBarControllerViewController.m
//  XMGProject
//
//  Created by scuplt on 16-4-13.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "XMGTabBarController.h"
#import "XMGEssenceViewController.h"
#import "XMGFriendTrendsViewController.h"
#import "XMGMeViewController.h"
#import "XMGNewViewController.h"
#import "XMGTabBar.h"
#import "XMGNavigationController.h"

@interface XMGTabBarController ()

@end

@implementation XMGTabBarController
/** 一次性设置的,在 此较好   */
+(void)initialize{
    NSMutableDictionary *norDic=[NSMutableDictionary dictionary];
    norDic[NSForegroundColorAttributeName]=[UIColor lightGrayColor];
    norDic[NSFontAttributeName]=[UIFont systemFontOfSize:13];
    
    NSMutableDictionary *selDic=[NSMutableDictionary dictionary];
    selDic[NSForegroundColorAttributeName]=[UIColor blackColor];
    selDic[NSFontAttributeName]=[UIFont systemFontOfSize:13];
    UITabBarItem *items= [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    
    [items setTitleTextAttributes:norDic forState:UIControlStateNormal];
    [items setTitleTextAttributes:selDic forState:UIControlStateSelected];
    
  }

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addBouttomTabBar:[[XMGEssenceViewController alloc] init] title:@"精华" norImage:@"tabBar_essence_icon" selImage:@"tabBar_essence_click_icon"];
    [self addBouttomTabBar:[[XMGNewViewController alloc] init] title:@"新帖" norImage:@"tabBar_new_icon" selImage:@"tabBar_new_click_icon"];
    [self addBouttomTabBar:[[XMGFriendTrendsViewController alloc] init] title:@"关注" norImage:@"tabBar_friendTrends_icon" selImage:@"tabBar_friendTrends_click_icon"];
    [self addBouttomTabBar:[[XMGMeViewController alloc] init] title:@"我" norImage:@"tabBar_me_icon" selImage:@"tabBar_me_click_icon"];
    
    [self setValue:[[XMGTabBar alloc] init] forKey:@"tabBar"];//此处使用kvc,设置了内容


}

-(void)addBouttomTabBar:(UIViewController *)vc title:(NSString *)title norImage:(NSString *)norImage selImage:(NSString *)selImage
{
    vc.title=title;
    vc.tabBarItem.selectedImage=[UIImage imageNamed:selImage];
    vc.tabBarItem.image=[UIImage imageNamed:norImage];

    XMGNavigationController *nav=[[XMGNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}

@end






