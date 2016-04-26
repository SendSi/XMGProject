//
//  XMGRecommondUserCell.m
//  XMGProject
//
//  Created by scuplt on 16/4/20.
//  Copyright © 2016年 Scuplt0413. All rights reserved.
//

#import "XMGRecommondUserCell.h"
#import "XMGRecommondUserModel.h"
#import <UIImageView+WebCache.h>

@interface XMGRecommondUserCell()
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UIButton *recommendButton;

@end

@implementation XMGRecommondUserCell

- (void)awakeFromNib {

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setUserModel:(XMGRecommondUserModel *)userModel{
    _userModel=userModel;
    self.nameLabel.text=userModel.screen_name;
    self.countLabel.text=[NSString stringWithFormat:@"%@人关注",userModel.fans_count];
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:userModel.header] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
}
@end
