//
//  XMGTabBar.m
//  XMGProject
//
//  Created by scuplt on 16-4-13.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "XMGTabBar.h"
@interface XMGTabBar()
@property (nonatomic,weak) UIButton *plusButton;
@end


@implementation XMGTabBar
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if(self){
        UIButton *plusButton=[[UIButton alloc] init];
        [plusButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [plusButton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];
        [self addSubview:plusButton];
        self.plusButton=plusButton;
        
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];//tabbar-light"]];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat width=self.width;//不用self.frame.size.width
    CGFloat height=self.height;//这样直接点出height的话,看UIView+xmgextension
    
    self.plusButton.width=self.plusButton.currentImage.size.width;
    self.plusButton.height=self.plusButton.currentImage.size.height;
    self.plusButton.center=CGPointMake(width*0.5, height*0.5);
    
    //设置其他tabbar的frame
    CGFloat y=0,w=width*0.2,h=height;
    NSInteger index=0;
    for (UIView *button in self.subviews) {
        if(![button isKindOfClass:[UIControl class] ] || button==self.plusButton)continue;//跳出
        
        if(index<=1)
            button.frame=CGRectMake(w*index,y, w, h);
        else
            button.frame=CGRectMake(w*(index+1), y, w, h);
        
        index++;
    }
}

@end
















