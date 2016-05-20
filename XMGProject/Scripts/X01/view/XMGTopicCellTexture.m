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

@interface XMGTopicCellTexture()
@property (weak, nonatomic) IBOutlet UIImageView *showImage;
@property (weak, nonatomic) IBOutlet UIImageView *gifImage;
@property (weak, nonatomic) IBOutlet UIButton *needClickShowButton;

@end


@implementation XMGTopicCellTexture

-(void)setTopicModel:(XMGTopicModel *)topicModel{
    _topicModel=topicModel;
    [self.showImage sd_setImageWithURL:[NSURL URLWithString:topicModel.small_image0] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    NSString *strImage0_suffix=topicModel.small_image0.pathExtension;
    self.gifImage.hidden =![strImage0_suffix isEqualToString:@"gif"];
    
    if(!topicModel.isBigTuxture){
        self.needClickShowButton.hidden=YES;
        self.showImage.contentMode=UIViewContentModeScaleToFill;
    }
    else{
        self.needClickShowButton.height=NO;
        self.showImage.contentMode=UIViewContentModeScaleAspectFill;
    }
}


+(instancetype)instanceTopicTexture{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];
}
@end
