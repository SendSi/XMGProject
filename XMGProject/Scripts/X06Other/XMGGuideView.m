//
//  XMGGuideView.m
//  XMGProject
//
//  Created by scuplt on 16/5/4.
//  Copyright © 2016年 Scuplt0413. All rights reserved.
//

#import "XMGGuideView.h"

@implementation XMGGuideView

+(instancetype) initLoadNibGuideView{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];
}
- (IBAction)ClickKnown {
    [self removeFromSuperview];
}

+(void)showNew{
    NSString *strKey=@"CFBundleShortVersionString";
    NSString *currentVersion=[NSBundle mainBundle].infoDictionary[strKey] ;
    NSString *sanboxVersion=[[NSUserDefaults standardUserDefaults] stringForKey:strKey];
    if(![currentVersion isEqualToString:sanboxVersion])
    {
        UIWindow *window=[UIApplication sharedApplication].keyWindow;
        
        XMGGuideView *guide=[XMGGuideView initLoadNibGuideView];
        guide.frame=window.bounds;
        [window addSubview:guide];
        
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:strKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

@end
