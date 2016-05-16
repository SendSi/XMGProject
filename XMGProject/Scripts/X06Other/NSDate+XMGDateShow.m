//
//  NSDate+XMGDateShow.m
//  XMGProject
//
//  Created by SunSi on 16/5/15.
//  Copyright © 2016年 Scuplt0413. All rights reserved.
//

#import "NSDate+XMGDateShow.h"

@implementation NSDate (XMGDateShow)

-(NSDateComponents *)dateShowFrom:(NSDate *)from{
    NSCalendar *calendar=[NSCalendar currentCalendar];
    NSCalendarUnit caUnit=NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond;
    NSDateComponents *cmps=  [calendar components:caUnit fromDate:from toDate:self options:0];
    return cmps;
}
/**
 
 
 
 */
/** 是否为今年  */
-(BOOL) isYears{
    NSCalendar *calendar=[NSCalendar currentCalendar];
    NSInteger   selfCmp=[calendar component:NSCalendarUnitYear fromDate:self];
    NSInteger nowCmp=[calendar component:NSCalendarUnitYear fromDate:[NSDate date]];
    
    return nowCmp==selfCmp;
}
/** 是否为今天  */
-(BOOL)isTodays{
    NSDateFormatter *nsDF=[[NSDateFormatter alloc] init];
    nsDF.dateFormat=@"yyyy-MM-dd";
    
    NSString *selfDate=[nsDF stringFromDate:self];
    NSString *nowDate=[nsDF stringFromDate:[NSDate date]];
    
    return [selfDate isEqualToString:nowDate];
}
/** 是否为昨天  */
-(BOOL) isYestedays{
    NSDateFormatter *nsDF=[[NSDateFormatter alloc] init];
    nsDF.dateFormat=@"yyyy-MM-dd";
    
    NSDate *selfDate=[nsDF dateFromString:[nsDF stringFromDate:self]];
    NSDate *nowDate=[nsDF dateFromString:[nsDF stringFromDate:[NSDate date]]];
    NSCalendar *calendar=[NSCalendar currentCalendar];
    NSDateComponents *cmps=  [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:selfDate toDate:nowDate options:0];
    
    return  cmps.year==0&&cmps.month==0&&cmps.day==1;
}



@end
