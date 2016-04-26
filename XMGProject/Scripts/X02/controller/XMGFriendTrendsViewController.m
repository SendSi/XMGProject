//
//  XMGFriendTrendsViewController.m
//  XMGProject
//
//  Created by scuplt on 16-4-13.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "XMGFriendTrendsViewController.h"
#import "XMGRecommendViewController.h"
@interface XMGFriendTrendsViewController ()

@end

@implementation XMGFriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"我的关注";
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem initWithNorImage:@"friendsRecommentIcon" highImage:@"friendsRecommentIcon-click" target:self action:@selector(ClickOneShow:)];
     self.view.backgroundColor=xmgColorBG;
}
-(void)ClickOneShow:(UIButton *)btn{
    logClass;

    XMGRecommendViewController *vc=[[XMGRecommendViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
