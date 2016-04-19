//
//  XMGNavigationController.m
//  XMGProject
//
//  Created by scuplt on 16/4/18.
//  Copyright © 2016年 Scuplt0413. All rights reserved.
//

#import "XMGNavigationController.h"

@implementation XMGNavigationController

+(void)initialize{
    UINavigationBar *bar=[UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    [bar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}

-(void)viewDidLoad{
    [super viewDidLoad];
  
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if(self.childViewControllers.count>0){
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"返回" forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        button.contentEdgeInsets=UIEdgeInsetsMake(0, -10, 0, 0);
        button.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
        button.size=CGSizeMake(70, 30);
        [button addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:button];
        viewController.hidesBottomBarWhenPushed=YES;//是viewController 而不是 self.
    }
    
    [super pushViewController:viewController animated:YES];
}

-(void) backClick{
    [self popViewControllerAnimated:YES];
}

@end
