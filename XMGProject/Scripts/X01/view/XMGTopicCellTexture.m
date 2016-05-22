//
//  XMGTopicCellTexture.m
//  XMGProject
//
//  Created by SunSi on 16/5/19.
//  Copyright © 2016年 Scuplt0413. All rights reserved.
//

#import "XMGTopicCellTexture.h"
#import "XMGTopicModel.h"
#import <UIImageView+WebCache.h>
#import "DALabeledCircularProgressView.h"
#import "XMGTexureShowAllViewController.h"

@interface XMGTopicCellTexture()
@property (weak, nonatomic) IBOutlet UIImageView *showImage;
@property (weak, nonatomic) IBOutlet UIImageView *gifImage;
@property (weak, nonatomic) IBOutlet UIButton *needClickShowButton;
@property (weak, nonatomic) IBOutlet DALabeledCircularProgressView *placeHolderPro;

@end


@implementation XMGTopicCellTexture

-(void)awakeFromNib{
    self.autoresizingMask=UIViewAutoresizingNone;
    self.placeHolderPro.roundedCorners=2;
    self.placeHolderPro.progressLabel.textColor=[UIColor whiteColor];
    self.showImage.userInteractionEnabled=YES;
    self.needClickShowButton.userInteractionEnabled=NO;
    [self.showImage addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showTexture)]];
}
-(void)showTexture{
    XMGTexureShowAllViewController *textureViewController=[[XMGTexureShowAllViewController alloc] init];
    textureViewController.topicModel=self.topicModel;
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:textureViewController animated:YES completion:nil];
}

-(void)setTopicModel:(XMGTopicModel *)topicModel{
    _topicModel=topicModel;
    
    [self.placeHolderPro setProgress:topicModel.progressNumber];
    
    [self.showImage sd_setImageWithURL:[NSURL URLWithString:topicModel.small_image0] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        self.placeHolderPro.hidden=NO;
       topicModel.progressNumber=1.0*receivedSize/expectedSize;
        [self.placeHolderPro setProgress:topicModel.progressNumber animated:NO];
        
        NSString *stringNum=[NSString stringWithFormat:@"%.0f%%",topicModel.progressNumber*100 ];

        self.placeHolderPro.progressLabel.text=[stringNum stringByReplacingOccurrencesOfString:@"-" withString:@""];
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.placeHolderPro.hidden=YES;
        
        if(topicModel.isBigTuxture==NO)return ;
        
        UIGraphicsBeginImageContextWithOptions(topicModel.textureFrame.size, YES, 0);
        CGFloat width=topicModel.textureFrame.size.width;
        CGFloat height=width*image.size.height/image.size.width;
        [image drawInRect:CGRectMake(0, 0, width, height)];
        self.showImage.image=UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }];
    
    NSString *strImage0_suffix=topicModel.small_image0.pathExtension;
    self.gifImage.hidden =![strImage0_suffix isEqualToString:@"gif"];
    
    if(topicModel.isBigTuxture){
        self.needClickShowButton.hidden=NO;
    }
    else{
        self.needClickShowButton.hidden=YES;
    }
}


+(instancetype)instanceTopicTexture{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];
}
@end
