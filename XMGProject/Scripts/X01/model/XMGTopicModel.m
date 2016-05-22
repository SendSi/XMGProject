//
//  XMGTopicModel.m
//  XMGProject
//
//  Created by SunSi on 16/5/8.
//  Copyright © 2016年 Scuplt0413. All rights reserved.
//

#import "XMGTopicModel.h"
#import <MJExtension.h>

@implementation XMGTopicModel
{
    CGFloat _cellHeight;
}

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"small_image0":@"image0",
             @"big_image1":@"image1",
             @"middle_image2":@"image2"
             };
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
        CGFloat sizeShowWidth=[UIScreen mainScreen].bounds.size.width-40;
        CGSize sizess=CGSizeMake(sizeShowWidth, MAXFLOAT);
        CGFloat heightH=  [  self.text boundingRectWithSize:sizess options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size.height;
        //段子
        _cellHeight=heightH+xmgCellBottom+xmgCellTop+2*xmgCellMargin;
        //图片
        if(self.type==xmgTypeTexture){
            CGFloat textureY=xmgCellMargin+xmgCellTop+heightH;//text文字下的高度
            CGFloat textureW=sizess.width;
            CGFloat textureH;
            textureH=textureW*self.height/self.width;
            //NSLogs(@"texture=%f",textureH);
            if(textureH>=xmgCellTextureMaxH){
                textureH=xmgCellTextureBeyondH;
              self.bigTuxture=YES;
            }
            else
               self.bigTuxture=NO;
      
            self.textureFrame=CGRectMake(0, textureY, textureW+18, textureH);
            _cellHeight+=xmgCellMargin+textureH;
        }
        else if (self.type==XmgTypeVideo){
            
        }
    }
    return _cellHeight;
}

@end
