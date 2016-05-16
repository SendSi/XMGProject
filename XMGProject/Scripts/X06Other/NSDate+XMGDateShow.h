//
//  NSDate+XMGDateShow.h
//  XMGProject
//
//  Created by SunSi on 16/5/15.
//  Copyright © 2016年 Scuplt0413. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDate (XMGDateShow)

-(NSDateComponents *)dateShowFrom:(NSDate *)from;

-(BOOL) isYears;
-(BOOL)isTodays;
-(BOOL) isYestedays;


@end
