//
//  XMGTopicModel.m
//  XMGProject
//
//  Created by SunSi on 16/5/8.
//  Copyright © 2016年 Scuplt0413. All rights reserved.
//

#import "XMGTopicModel.h"

@implementation XMGTopicModel
{
    CGFloat _cellHeight;
}

-(NSString *)created_at{
    //时间格式
    NSDateFormatter *nsDF=[[NSDateFormatter alloc] init];
    nsDF.dateFormat=@"yyyy-MM-dd HH:mm:ss";
    //当前时间now
    NSDate *now=[NSDate date];
    //贴子创建时间
    NSDate *createTime=[nsDF dateFromString:_created_at];
    //今年
    //今天   (刚刚,几分钟前,几小时前)
    //昨天
    //非今昨
    //非今年
    
    if(createTime.isYears){
        if (createTime.isTodays) {
            NSDateComponents *cmps=[now dateShowFrom:createTime];
            if(cmps.hour>=1){
                return [NSString stringWithFormat:@"%zd小时前",cmps.hour];
            }
            else if (cmps.minute>=1){
                return [NSString stringWithFormat:@"%zd分钟前",cmps.minute];
            }
            else{
                return  @"刚刚";
            }
        }else if(createTime.isYestedays)        {//昨天的 昨天  12:00:11
            nsDF.dateFormat=@"昨天 HH:mm:ss";
            return [nsDF stringFromDate:createTime];
        }
        else{//是今年  05-12 12:00:11
            nsDF.dateFormat =@"MM-dd HH:mm:ss";
            return [nsDF stringFromDate:createTime];
        }
    }
    else{//不是今年
        return [NSString stringWithFormat:@"%@",createTime];
    }
}


-(CGFloat)cellHeight{
    if(!_cellHeight){
        CGSize sizess=CGSizeMake([UIScreen mainScreen].bounds.size.width-40, MAXFLOAT);
        CGFloat heightH=  [  self.text boundingRectWithSize:sizess options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size.height;
//段子
        _cellHeight=heightH+xmgCellBottom+xmgCellTop+2*xmgCellMargin;
    //图片
        if(self.type==xmgTypeTexture){
            
        }
        else if (self.type==XmgTypeVideo){
            
        }
    }
    return _cellHeight;
}

@end
