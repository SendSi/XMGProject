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

@end

@implementation XMGTopicCell

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
}


/** 算时间 秒  */
-(void)testTime:(NSString *)timeString{
    //=当前时间now
    NSDate *now=[NSDate date];
    
    NSDateFormatter *nsDF=[[NSDateFormatter alloc] init];
    nsDF.dateFormat=@"yyyy-MM-dd hh:mm:ss";
    NSDate *createTime=[nsDF dateFromString:timeString];
    
    NSTimeInterval ss=[now timeIntervalSinceDate:createTime];
    NSLog(@"时间=%f",ss);
}


/** 算时间 秒  */
-(void)testTime2:(NSString *)timeString{
    //时间格式
    NSDateFormatter *nsDF=[[NSDateFormatter alloc] init];
    nsDF.dateFormat=@"yyyy-MM-dd HH:mm:ss";
    
    //=当前时间now
    NSDate *now=[NSDate date];
    //数据时间
    
    NSDate *createTime=[nsDF dateFromString:timeString];
    
    //    NSCalendar *calendar=[NSCalendar currentCalendar];
    //    NSCalendarUnit caUnit=NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond;
    //  NSDateComponents *cmps=  [calendar components:caUnit fromDate:createTime toDate:now options:0];
    
    NSDateComponents *cmps=    [now dateShowFrom:createTime];
    
    NSLogs(@"%@ %@",now,createTime);
    
    NSLogs(@"%zd %zd %zd %zd %zd %zd ",cmps.year,cmps.month,cmps.day ,cmps.hour,cmps.minute,cmps.second);
    
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
