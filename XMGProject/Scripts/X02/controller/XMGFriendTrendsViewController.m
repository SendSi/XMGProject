//
//  XMGFriendTrendsViewController.m
//  XMGProject
//
//  Created by scuplt on 16-4-13.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "XMGFriendTrendsViewController.h"

@interface XMGFriendTrendsViewController ()

@end

@implementation XMGFriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"我的关注";
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem initWithNorImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(ClickOneShow:)];
     self.view.backgroundColor=xmgColorBG;
}
-(void)ClickOneShow:(UIButton *)btn{
    logClass;
}
@end
