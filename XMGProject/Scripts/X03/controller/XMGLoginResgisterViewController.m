//
//  XMGLoginResgisterViewController.m
//  XMGProject
//
//  Created by SunSi on 16/5/2.
//  Copyright © 2016年 Scuplt0413. All rights reserved.
//

#import "XMGLoginResgisterViewController.h"

@interface XMGLoginResgisterViewController ()
- (IBAction)ClickChangeRightTop:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftConstranitLine;
- (IBAction)CloseLoginPanel;

@end

@implementation XMGLoginResgisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}


/** 点击右上角的内容--切换 */
- (IBAction)ClickChangeRightTop:(UIButton *)sender {
    if(self.leftConstranitLine.constant==0)//注意细节...登录框,注册框 两者的宽度,top,   左边的边线 改为左对右
    {
    self.leftConstranitLine.constant=-self.view.width;
        [sender setTitle:@"已有账号?" forState:UIControlStateNormal];
    }
    else{
        [sender setTitle:@"注册账号" forState:UIControlStateNormal];
        self.leftConstranitLine.constant=0;        
    }
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
}
- (IBAction)CloseLoginPanel {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
