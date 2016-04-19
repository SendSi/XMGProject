//
//  XMGTestViewController.m
//  XMGProject
//
//  Created by scuplt on 16/4/18.
//  Copyright © 2016年 Scuplt0413. All rights reserved.
//

#import "XMGTestViewController.h"

@implementation XMGTestViewController

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    UIViewController *uc=[[UIViewController alloc] init];
    [uc.navigationController pushViewController:uc animated:YES];
}

@end
