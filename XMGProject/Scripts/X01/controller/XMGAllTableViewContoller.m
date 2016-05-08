//
//  XMGAllTableViewContoller.m
//  XMGProject
//
//  Created by SunSi on 16/5/8.
//  Copyright © 2016年 Scuplt0413. All rights reserved.
//
/** 全部  */
#import "XMGAllTableViewContoller.h"

@interface XMGAllTableViewContoller ()

@end

@implementation XMGAllTableViewContoller


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell==nil) cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    
    cell.detailTextLabel.text=[NSString stringWithFormat:@"%@-----%ld",[self class],(long)indexPath.row];
    
    return cell;
}

@end
