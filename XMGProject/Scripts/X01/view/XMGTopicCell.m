//
//  XMGTopicCell.m
//  XMGProject
//
//  Created by SunSi on 16/5/14.
//  Copyright © 2016年 Scuplt0413. All rights reserved.
//

#import "XMGTopicCell.h"
#import <UIImageView+WebCache.h>
#import "XMGTopicModel.h"
#import "XMGTopicCellTexture.h"

@interface XMGTopicCell()
@property (weak, nonatomic) IBOutlet UIImageView *headImageVIew;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *plugsButton;
@property (weak, nonatomic) IBOutlet UIButton *goodDingButton;
@property (weak, nonatomic) IBOutlet UIButton *caiButton;
@property (weak, nonatomic) IBOutlet UIButton *repostButton;

@property (weak, nonatomic) IBOutlet UIButton *commentButton;
/** 新浪加V  */
@property (weak, nonatomic) IBOutlet UIImageView *sineVImageView;
@property (weak, nonatomic) IBOutlet UILabel *textContentLabel;
/** 图片  */
@property (weak, nonatomic)XMGTopicCellTexture *topicCellTexture;
@end

@implementation XMGTopicCell

-(XMGTopicCellTexture *)topicCellTexture{
    if(!_topicCellTexture)
    {
        XMGTopicCellTexture *model=[XMGTopicCellTexture instanceTopicTexture];
        [self.contentView addSubview:model];
        _topicCellTexture=model;
    }
    return _topicCellTexture;
}

- (void)awakeFromNib {
    UIImageView *imgView=[[UIImageView alloc] init];
    imgView.image=[UIImage imageNamed:@"mainCellBackground"];
    self.backgroundView=imgView;
}


-(void)setTopicModel:(XMGTopicModel *)topicModel{
    _topicModel=topicModel;
    
    [self.headImageVIew sd_setImageWithURL:[NSURL URLWithString:topicModel.profile_image]placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.nameLabel.text =topicModel.name;
    
    self.timeLabel.text=topicModel.created_at;
    topicModel.sina_v=arc4random()%2;
    self.sineVImageView.hidden=!topicModel.sina_v;
    
    //  topicModel.ding=0;    //topicModel.cai=1700007;
    [self setNumber:self.goodDingButton count:topicModel.ding placeHolderTitle:@"顶"];
    [self setNumber:self.caiButton count:topicModel.cai placeHolderTitle:@"踩"];
    [self setNumber:self.repostButton  count:topicModel.repost placeHolderTitle:@"转发"];
    [self setNumber:self.commentButton count:topicModel.comment placeHolderTitle:@"评论"];
    
    self.textContentLabel.text=topicModel.text;
    
self.topicCellTexture.frame=topicModel.textureFrame;
    self.topicCellTexture.topicModel=topicModel;
}


-(void)setNumber:(UIButton *)button count:(NSInteger)count placeHolderTitle:(NSString *)placeHolderTitle{
    if(count>10000){
        placeHolderTitle=[NSString stringWithFormat:@"%0.1f万",count/10000.0];
    }
    else if(count>0){
        placeHolderTitle=[NSString stringWithFormat:@"%zd",count] ;
    }
    [button setTitle:placeHolderTitle forState:UIControlStateNormal];
}
-(void)setFrame:(CGRect)frame{
    CGFloat margin=10;
    frame.origin.x=margin;
    frame.size.width-=2*margin;
    frame.origin.y+=margin;
    frame.size.height-=margin;
    
    [super setFrame:frame];
}


@end
