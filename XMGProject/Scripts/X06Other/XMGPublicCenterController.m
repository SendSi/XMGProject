//
//  XMGPublicCenterController.m
//  XMGProject
//
//  Created by SunSi on 16/5/22.
//  Copyright © 2016年 Scuplt0413. All rights reserved.
//

#import "XMGPublicCenterController.h"
#import "XMGVerticalButton.h"

@interface XMGPublicCenterController ()

@end

@implementation XMGPublicCenterController

- (void)viewDidLoad {
    [super viewDidLoad];

[self setUI];
    
//    NSArray *images = @[@"publish-video", @"publish-picture", @"publish-text", @"publish-audio", @"publish-review", @"publish-offline"];
//    NSArray *titles = @[@"发视频", @"发图片", @"发段子", @"发声音", @"审帖", @"离线下载"];
//    
//    // 中间的6个按钮
//    int maxCols = 3;
//    CGFloat buttonW = 72;
//    CGFloat buttonH = buttonW + 30;
//    CGFloat buttonStartY = (xmgScreenH - 2 * buttonH) * 0.5;
//    CGFloat buttonStartX = 20;
//    CGFloat xMargin = (xmgScreenW - 2 * buttonStartX - maxCols * buttonW) / (maxCols - 1);
//    for (int i = 0; i<images.count; i++) {
//        XMGVerticalButton *button = [[XMGVerticalButton alloc] init];
//        // 设置内容
//        button.titleLabel.font = [UIFont systemFontOfSize:14];
//        [button setTitle:titles[i] forState:UIControlStateNormal];
//        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [button setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
//        
//        // 设置frame
//        button.width = buttonW;
//        button.height = buttonH;
//        int row = i / maxCols;
//        int col = i % maxCols;
//        button.x = buttonStartX + col * (xMargin + buttonW);
//        button.y = buttonStartY + row * buttonH;
//        [self.view addSubview:button];
//    }

}

-(void)setUI{
    //1个image
    UIImageView *uiTopImage=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"app_slogan"]];
        [self.view addSubview:uiTopImage];
    uiTopImage.centerX=xmgScreenW*0.5;
    uiTopImage.centerY=60;
    
    //6个按钮
    // 数据
    NSArray *images = @[@"publish-video", @"publish-picture", @"publish-text", @"publish-audio", @"publish-review", @"publish-offline"];
    NSArray *titles = @[@"发视频", @"发图片", @"发段子", @"发声音", @"审帖", @"离线下载"];
    CGFloat startX=15;//左右两边
    CGFloat widthW=72;
    CGFloat heightH=widthW+25;
    CGFloat startY=(xmgScreenH-heightH*2)*0.5;//开始的高度
    CGFloat marginX=((xmgScreenW-startX*2)-widthW*3)*0.5;
    for (int i=0; i<6; i++) {
        XMGVerticalButton *verButton=[[XMGVerticalButton alloc ] init];
        verButton.titleLabel.font=[UIFont systemFontOfSize:14];
        [verButton.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [verButton setTitle:titles[i] forState:UIControlStateNormal];
        [verButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [verButton setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
        int rowIndex=i/3;
        int colIndex=i%3;
        CGFloat verX=startX+ colIndex*(widthW+marginX);
        CGFloat verY=startY+rowIndex*;
        
        // 设置frame
        verButton.width = widthW;
        verButton.height = heightH;
        verButton.x=verX;
        verButton.y=verY;
        
        //verButton.frame=CGRectMake(verX ,verY, width, height);
       // NSLog(@"%d",verY);
        [self.view addSubview:verButton];
    }
}


- (IBAction)canclClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
