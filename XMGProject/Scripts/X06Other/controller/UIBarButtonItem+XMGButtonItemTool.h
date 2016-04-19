//
//  UIBarButtonItem+XMGButtonItemTool.h
//  XMGProject
//
//  Created by scuplt on 16/4/17.
//  Copyright © 2016年 Scuplt0413. All rights reserved.
//

#import <UIKit/UIKit.h>
/** 给UIBarButtonItem 写分类  */
@interface UIBarButtonItem (XMGButtonItemTool)

+(instancetype)initWithNorImage:(NSString *)norImage highImage:(NSString *)highImage target:(id)target action:(SEL) action;

@end
