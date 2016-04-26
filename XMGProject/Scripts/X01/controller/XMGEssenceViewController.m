//
//  XMGEssenceViewController.m
//  XMGProject
//
//  Created by scuplt on 16-4-13.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "XMGEssenceViewController.h"
#import "XMGRecommendAttentionTableViewController.h"
/** 主页 */
@interface XMGEssenceViewController ()

@end

@implementation XMGEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem initWithNorImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(ClickOneShow:)];
    
    self.navigationItem.titleView=[[UIImageView alloc]initWithImage: [UIImage imageNamed:@"MainTitle"] ];
    self.view.backgroundColor=xmgColorBG;
}
-(void)ClickOneShow:(UIButton *)btn{
    XMGRecommendAttentionTableViewController *xmgReCoAtt=[[XMGRecommendAttentionTableViewController alloc] init];
    [self.navigationController pushViewController:xmgReCoAtt animated:YES];
}


@end
