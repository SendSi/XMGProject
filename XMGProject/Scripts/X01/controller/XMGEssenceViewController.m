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
/** title 底部的选中 红色框  */
@property (weak,nonatomic) UIView *titleBottomRed;

/** btns */
@property (weak,nonatomic) UIButton *btnsCache;


@end

@implementation XMGEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setNavTop];/** 设置导航栏的内容  */
    [self setTitleCategory];/** 设置分类 头部标签  */
}
/** 设置分类 头部标签  */
-(void )setTitleCategory{
    UIView *fatherView=[[UIView alloc] init];
    CGFloat heightView=35;
    fatherView.frame=CGRectMake(0, 64, self.view.width, heightView);
    fatherView.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:0.1];
    [self.view addSubview:fatherView];
    
    
    
    //button的宽度值
    NSInteger counts=5;
    NSArray *arrTitle=@[@"全部",@"视频",@"声音",@"图片",@"段子"];
    CGFloat y=0,w=self.view.width/counts,h=heightView;
    
    //底部的红色条
    UIView *titleBottomRed=[[UIView alloc] init];
    titleBottomRed.height=2;
    titleBottomRed.centerY=y+heightView;
    titleBottomRed.backgroundColor=[[UIColor redColor] colorWithAlphaComponent:0.5];
    [fatherView addSubview:titleBottomRed];
    self.titleBottomRed=titleBottomRed;
    
    for (int i=0; i<counts; i++) {
        UIButton *btns=    [[UIButton alloc] init];
        btns.frame=CGRectMake(w*i, y, w, h);
        [btns setTitle:arrTitle[i] forState:UIControlStateNormal];
        btns.titleLabel.font=[UIFont systemFontOfSize:14];
        [btns setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [btns setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        [btns addTarget:self action:@selector(clickTitleShow:) forControlEvents:UIControlEventTouchUpInside];
        [fatherView addSubview:btns];
    
        if(i==0){
            btns.enabled=NO;
            self.btnsCache=btns;
            [btns.titleLabel sizeToFit];//相当于 合适位置
            self.titleBottomRed.width=btns.titleLabel.width;
            self.titleBottomRed.centerX=btns.centerX;
        }
        
    }
    
    
    
}

/** 点击分类 头部头部内容  */
-(void)clickTitleShow:(UIButton *)btns{
    self.btnsCache.enabled=YES;
    btns.enabled=NO;
    self.btnsCache=btns;
    
    
    [UIView animateWithDuration:0.2 animations:^{
        self.titleBottomRed.width=btns.titleLabel.width;
        self.titleBottomRed.centerX=btns.centerX;
    }];
    
    
}



/** 设置导航栏的内容  */
-(void)setNavTop{
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem initWithNorImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(ClickOneShow:)];
    self.navigationItem.titleView=[[UIImageView alloc]initWithImage: [UIImage imageNamed:@"MainTitle"] ];
    self.view.backgroundColor=xmgColorBG;
}

-(void)ClickOneShow:(UIButton *)btn{
    XMGRecommendAttentionTableViewController *xmgReCoAtt=[[XMGRecommendAttentionTableViewController alloc] init];
    [self.navigationController pushViewController:xmgReCoAtt animated:YES];
    NSLogs(@"点击左上角的内容MainTagSubIconClick");
}


@end
