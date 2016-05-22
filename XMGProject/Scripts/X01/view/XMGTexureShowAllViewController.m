//
//  XMGTexureShowAllViewController.m
//  XMGProject
//
//  Created by SunSi on 16/5/21.
//  Copyright © 2016年 Scuplt0413. All rights reserved.
//

#import "XMGTexureShowAllViewController.h"
#import "XMGTopicModel.h"
#import <UIImageView+WebCache.h>
#import <SVProgressHUD.h>
#import "DALabeledCircularProgressView.h"

@interface XMGTexureShowAllViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *textureScrollView;
- (IBAction)shareClickButton:(id)sender;
- (IBAction)saveClickButton;
/** 图片 */
@property (weak,nonatomic) UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet DALabeledCircularProgressView *numShowLabel;

@end

@implementation XMGTexureShowAllViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.numShowLabel.progressLabel.textColor=[UIColor whiteColor];
    
    UIImageView *myImageView=[[UIImageView alloc] init];
    [self.textureScrollView addSubview:myImageView];
    self.myImageView=myImageView;
    myImageView.userInteractionEnabled=YES;
    
    [self.numShowLabel setProgress:self.topicModel.progressNumber animated:YES];
    [myImageView sd_setImageWithURL:[NSURL URLWithString:self.topicModel.big_image1] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        self.numShowLabel.hidden=NO;
        self.topicModel.progressNumber=  1.0*receivedSize/expectedSize;
         [self.numShowLabel setProgress:self.topicModel.progressNumber animated:YES];
        self.numShowLabel.progressLabel.text=[NSString stringWithFormat:@"%.0f%%",self.topicModel.progressNumber*100 ];       
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.numShowLabel.hidden=YES;
    }];
    
    //[myImageView sd_setImageWithURL:[NSURL URLWithString:self.topicModel.big_image1]];
    
    //CGFloat
    CGFloat uiWidth=[UIScreen mainScreen].bounds.size.width;
    CGFloat uiHeight=[UIScreen mainScreen].bounds.size.height;
    CGFloat textureW=uiWidth;
    CGFloat textureH=textureW*self.topicModel.height/self.topicModel.width;
    
    if(textureH>uiHeight){
        myImageView.frame=CGRectMake(0, 0, textureW, textureH);
        self.textureScrollView.contentSize = CGSizeMake(0, textureH);
    }
    else{
        myImageView.size=CGSizeMake(textureW, textureH);
        myImageView.centerY=uiHeight*0.5;
    } 
    
    [myImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickBacks)]];
}

-(IBAction) clickBacks{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)shareClickButton:(id)sender {
}

- (IBAction)saveClickButton {
    if(self.myImageView.image==nil)
    {
        [SVProgressHUD showInfoWithStatus:@"图片还没下载完成"];
        return;
    }
    
    UIImageWriteToSavedPhotosAlbum(self.myImageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    if (error) {
        [SVProgressHUD showErrorWithStatus:@"保存失败"];
    }
    else {
        [SVProgressHUD showInfoWithStatus:@"保存成功" ];
    }
    
}

-(void)setTopicModel:(XMGTopicModel *)topicModel{
    _topicModel=topicModel;
}
@end
