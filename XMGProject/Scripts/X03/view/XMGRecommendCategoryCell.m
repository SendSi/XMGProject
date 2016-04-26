//
//  XMGRecommendCategoryCell.m
//  XMGProject
//
//  Created by scuplt on 16/4/20.
//  Copyright © 2016年 Scuplt0413. All rights reserved.
//

#import "XMGRecommendCategoryCell.h"
#import "XMGRecommondCategoryModel.h"

@interface XMGRecommendCategoryCell()
@property (weak, nonatomic) IBOutlet UIView *selectLeftRed;

@end

@implementation XMGRecommendCategoryCell

- (void)awakeFromNib {
    self.backgroundColor=xmgColor(244, 244, 244);
    self.textLabel.font=[UIFont systemFontOfSize:13];
    self.textLabel.textColor=xmgColor(78, 78, 78);//xmgColor(219, 21, 26);
    self.selectLeftRed.backgroundColor=xmgColor(219, 21, 26);
    
}

-(void)setCategory:(XMGRecommondCategoryModel *)category{
    _category=category;
    
    self.textLabel.text=category.name;
}
-(void) layoutSubviews{
    [super layoutSubviews];
    
    self.textLabel.y=2;
    self.textLabel.height=self.contentView.height-4*self.textLabel.y;
}

/** 可以有这个方法中 监听cell 的选中和取消选中 */
-(void)setSelected:(BOOL)selected animated:(BOOL)animated{
    [super setSelected:selected animated:animated];
    self.selectLeftRed.hidden=!selected;
    self.textLabel.textColor = selected ? self.selectLeftRed.backgroundColor : xmgColor(78, 78, 78);
}

@end















