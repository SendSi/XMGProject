//
//  XMGWordTableViewController.m
//  XMGProject
//
//  Created by SunSi on 16/5/8.
//  Copyright © 2016年 Scuplt0413. All rights reserved.
//

#import "XMGWordTableViewController.h"
#import <AFNetworking.h>
@interface XMGWordTableViewController ()

@end

@implementation XMGWordTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableDictionary *pars=[NSMutableDictionary dictionary];
    pars[@"a"]=@"list";
    pars[@"c"]=@"data";
    pars[@"type"]=@"29";
    
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:pars progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary   *responseObject) {
        NSLogs(@"%@",responseObject);
        [responseObject writeToFile:@"users/sunsi/desktop/abs.plist" atomically:YES];///Users/sunsi/Desktop
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     return 50;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell==nil) cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    
    cell.detailTextLabel.text=[NSString stringWithFormat:@"%@-----%ld",[self class],indexPath.row];
    
    return cell;
}




@end
