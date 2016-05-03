//
//  XMGVerticalButton.m
//  XMGProject
//
//  Created by SunSi on 16/5/2.
//  Copyright © 2016年 Scuplt0413. All rights reserved.
//

/** 上图下字  */
#import "XMGVerticalButton.h"

@implementation XMGVerticalButton



-(void)awakeFromNib{
//    [super awakeFromNib];
    self.titleLabel.textAlignment=NSTextAlignmentCenter;
    self.titleLabel.font=[UIFont systemFontOfSize:14];
}



-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat x=0,y=0,w=contentRect.size.width,h=contentRect.size.height*0.7;
    return CGRectMake(x, y, w, h);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat x=0,w=contentRect.size.width,h=contentRect.size.height*0.3,y=contentRect.size.height-h;
    return CGRectMake(x, y, w, h);
}

@end
