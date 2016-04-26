//
//  XMGRecommendAttentionCell.m
//  XMGProject
//
//  Created by scuplt on 16/4/23.
//  Copyright © 2016年 Scuplt0413. All rights reserved.
//

#import "XMGRecommendAttentionCell.h"
#import "XMGRecommendAttentionModel.h"
#import <UIImageView+WebCache.h>
@interface XMGRecommendAttentionCell()
@property (weak, nonatomic) IBOutlet UILabel *numberText;
@property (weak, nonatomic) IBOutlet UILabel *nameText;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UIButton *attentionButton;

@end


@implementation XMGRecommendAttentionCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setAttentionModel:(XMGRecommendAttentionModel *)attentionModel{
    _attentionModel=attentionModel;

    self.nameText.text=attentionModel.theme_name;
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:attentionModel.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    
    NSString *str=nil;
   if(attentionModel.sub_number<1000)
   {
       str=[NSString stringWithFormat:@"%zd人订阅",attentionModel.sub_number];
   }else {
       str=[NSString stringWithFormat:@"%.1zd万人订阅",attentionModel.sub_number/10000.0];

   }
    self.numberText.text=str;
}

-(void)setFrame:(CGRect)frame{
    frame.origin.x=8;
    frame.size.width-=2*frame.origin.x;
    frame.size.height-=2;
    [super setFrame:frame];
}

-(void)setBounds:(CGRect)bounds{//重写bounds,外面不管传什么进来,都改变不
    //bounds.size=CGSizeMake(10,10);
    [super setBounds:bounds];
}
//"theme_name": "生活百科",
//"image_list": "http:%/%/img.spriteapp.cn%/ugc%/2015%/04%/23%/160559_24190.jpg",
//"sub_number": "36824",
@end
