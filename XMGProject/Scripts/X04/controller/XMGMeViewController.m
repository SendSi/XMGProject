//
//  XMGMeViewController.m
//  XMGProject
//
//  Created by scuplt on 16-4-13.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "XMGMeViewController.h"

@interface XMGMeViewController ()

@end

@implementation XMGMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *itemMone =[UIBarButtonItem initWithNorImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" target:self action:@selector(ClickMone:)];
    
    UIBarButtonItem *itemSetting =[UIBarButtonItem initWithNorImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(ClickSetting:)];
    
    
    self.navigationItem.rightBarButtonItems=@[itemSetting,itemMone];
     self.view.backgroundColor=xmgColorBG;
}
-(void)ClickMone:(UIButton *)btn{
    logClass;
}

-(void)ClickSetting:(UIButton *)btn{
    logClass;
}

@end
