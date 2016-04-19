//
//  UIImage+XMGExtension.m
//  XMGProject
//
//  Created by scuplt on 16-4-14.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "UIView+XMGExtension.h"

@implementation UIView (XMGExtension)

//其实就是别 人 传width给你,设置一下 frame----先得到frame,再设回去
-(void)setWidth:(CGFloat)width{
    CGRect frame=self.frame;
    frame.size.width=width;
    self.frame=frame;
}
-(void)setHeight:(CGFloat)height{
    CGRect frame=self.frame;
    frame.size.height=height;
    self.frame=frame;
}
-(void)setSize:(CGSize)size{
    CGRect frame=self.frame;
    frame.size=size;
    self.frame=frame;
}

-(void)setX:(CGFloat)x{
    CGRect frame=self.frame;
    frame.origin.x=x;
    self.frame=frame;
}
-(void)setY:(CGFloat)y{
    CGRect frame=self.frame;
    frame.origin.y=y;
    self.frame=frame;
}

-(CGFloat)width{
    return self.frame.size.width;
}
-(CGFloat)height{
    return self.frame.size.height;
}
-(CGFloat)x{
    return  self.frame.origin.x;
}

-(CGFloat)y{
    return self.frame.origin.y;
}
-(CGSize)size{
    return self.frame.size;
}

@end










