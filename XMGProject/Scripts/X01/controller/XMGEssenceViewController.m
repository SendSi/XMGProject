//
//  XMGEssenceViewController.m
//  XMGProject
//
//  Created by scuplt on 16-4-13.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "XMGEssenceViewController.h"
#import "XMGRecommendAttentionTableViewController.h"
#import "XMGAllTableViewContoller.h"
#import "XMGVideoTableViewController.h"
#import "XMGSoundsTableViewController.h"
#import "XMGTextureTableViewController.h"
#import "XMGWordTableViewController.h"



/** 主页 */
@interface XMGEssenceViewController ()<UIScrollViewDelegate>
/** title 底部的选中 红色框  */
@property (weak,nonatomic) UIView *titleBottomRed;

/** btns */
@property (weak,nonatomic) UIButton *btnsCache;
/** titleView头部文字信息 */
@property (weak,nonatomic) UIView *titleContentView;

/** titleView头部文字信息 */
@property (weak,nonatomic) UIScrollView *bigContentView;


@end

@implementation XMGEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setVCTableViewController];
    [self setNavTop];/** 设置导航栏的内容  */
    [self setTitleCategory];/** 设置分类 头部标签  */
    [self setContentView];
}

#pragma mark -头部分类的内容
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
    titleBottomRed.centerY=heightView;
    titleBottomRed.backgroundColor=[[UIColor redColor] colorWithAlphaComponent:0.5];
    self.titleBottomRed=titleBottomRed;
    titleBottomRed.tag=-1;
    
    //文字信息
    for (int i=0; i<counts; i++) {
        UIButton *btns=    [[UIButton alloc] init];
        btns.frame=CGRectMake(w*i, y, w, h);
        [btns setTitle:arrTitle[i] forState:UIControlStateNormal];
        btns.titleLabel.font=[UIFont systemFontOfSize:14];
        [btns setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btns setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        [btns addTarget:self action:@selector(clickTitleShow:) forControlEvents:UIControlEventTouchUpInside];
        [fatherView addSubview:btns];
        btns.tag=i;
        
        if(i==0){//首加载,选中
            btns.enabled=NO;
            self.btnsCache=btns;
            [btns.titleLabel sizeToFit];//相当于 合适位置
            self.titleBottomRed.width=btns.titleLabel.width;
            self.titleBottomRed.centerX=btns.centerX;
           
        }
    }
    self.titleContentView=fatherView;
    
     [fatherView addSubview:titleBottomRed];
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
    
    //滚动内容
    CGPoint offset=self.bigContentView.contentOffset;
    offset.x=btns.tag*self.bigContentView.width;
    [self.bigContentView setContentOffset:offset animated:YES];
    
}


#pragma mark -导航内容
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

#pragma mark -大框的内容
/** 设置scollview 内容Frame--难点是头部底部的穿透 半透明效果  */
-(void )setContentView{
    //不要自动调整inset
    self.automaticallyAdjustsScrollViewInsets=NO;
    UIScrollView *conteview=[[UIScrollView alloc] init];
    conteview.backgroundColor=[[UIColor blueColor] colorWithAlphaComponent:0.1];
    conteview.frame=self.view.bounds;
    [self.view insertSubview:conteview atIndex:0];
    //设置内边距
    
    //    CGFloat bottom=self.tabBarController.tabBar.height;
    //    CGFloat top=CGRectGetMaxY(self.titleContentView.frame);
    //    conteview.contentInset=UIEdgeInsetsMake(top, 0, bottom, 0);
    conteview.contentSize=CGSizeMake(conteview.width*self.childViewControllers.count, 0 );
    conteview.pagingEnabled=YES;
    conteview.delegate=self;
    self.bigContentView=conteview;
    
     [self scrollViewDidEndScrollingAnimation:conteview];
}


#pragma mark -scollview的代理
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    //1.添加子控制器的view
    
    
    //当前的索引
    NSInteger index=scrollView.contentOffset.x/scrollView.width;
    
    //取出子控制器
    UITableViewController *vc=self.childViewControllers[index];
    vc.view.x=scrollView.contentOffset.x;
    vc.view.y=0;//必须设值
    vc.view.height=scrollView.height;
    //设置内边距
    CGFloat bottom=self.tabBarController.tabBar.height;//底部高度
    CGFloat top=CGRectGetMaxY(self.titleContentView.frame);//头部最大Y值
    vc.tableView.contentInset=UIEdgeInsetsMake(top, 0, bottom, 0);
    vc.tableView.scrollIndicatorInsets=vc.tableView.contentInset;
    [scrollView addSubview:vc.view];
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
    //相当于点击按钮
    NSInteger index=scrollView.contentOffset.x/scrollView.width;
    [self clickTitleShow:self.titleContentView.subviews[index]];
    
}

-(void)setVCTableViewController{
    XMGAllTableViewContoller *all=[[XMGAllTableViewContoller alloc] init];
    [self addChildViewController:all];
    
    XMGVideoTableViewController    *video=[[XMGVideoTableViewController alloc] init];
    [self addChildViewController:video];
    
    XMGSoundsTableViewController *sounds=[[XMGSoundsTableViewController alloc] init];
    [self addChildViewController:sounds];
    
    XMGTextureTableViewController *texture=[[XMGTextureTableViewController alloc] init];
    [self addChildViewController:texture];
    
    XMGWordTableViewController *word=[[XMGWordTableViewController alloc] init];
    [self addChildViewController:word];
}

@end
















