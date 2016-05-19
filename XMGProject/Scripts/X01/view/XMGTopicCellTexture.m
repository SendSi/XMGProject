//
//  XMGTopicCellTexture.m
//  XMGProject
//
//  Created by SunSi on 16/5/19.
//  Copyright © 2016年 Scuplt0413. All rights reserved.
//

#import "XMGTopicCellTexture.h"

@implementation XMGTopicCellTexture

-(void)setTopicModel:(XMGTopicModel *)topicModel{
    _topicModel=topicModel;
    
}
+(instancetype)instanceTopicTexture{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];
}
@end
