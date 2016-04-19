//
//  UIBarButtonItem+XMGButtonItemTool.m
//  XMGProject
//
//  Created by scuplt on 16/4/17.
//  Copyright © 2016年 Scuplt0413. All rights reserved.
//

#import "UIBarButtonItem+XMGButtonItemTool.h"

@implementation UIBarButtonItem (XMGButtonItemTool)

+(instancetype)initWithNorImage:(NSString *)norImage highImage:(NSString *)highImage target:(id)target action:(SEL) action{
    UIButton *button=[[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:norImage] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    button.size=button.currentImage.size;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc] initWithCustomView:button];
}

@end
