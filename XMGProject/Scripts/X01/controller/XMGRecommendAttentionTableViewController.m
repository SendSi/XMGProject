//
//  XMGRecommendAttentionTableView.m
//  XMGProject
//
//  Created by scuplt on 16/4/23.
//  Copyright © 2016年 Scuplt0413. All rights reserved.
//

#import "XMGRecommendAttentionTableViewController.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>
#import "XMGRecommendAttentionCell.h"
#import "XMGRecommendAttentionModel.h"
#import <MJExtension.h>

@interface XMGRecommendAttentionTableViewController()<UITableViewDataSource,UITableViewDelegate>
/** afn manager */
@property (nonatomic,strong) AFHTTPSessionManager *manager;
/** 数组订阅内容 */
@property (nonatomic,strong) NSArray *arrAttention;

@end

@implementation XMGRecommendAttentionTableViewController

-(AFHTTPSessionManager *)manager{
    if(_manager==nil){
        _manager=[AFHTTPSessionManager manager];
    }
    return _manager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self panelViewUI];
    [self loadNewTableView];
}
static NSString * const attention=@"attention";

-(void)panelViewUI{
    self.title=@"推荐与关注";
    self.tableView.rowHeight=70;
    self.tableView.backgroundColor=xmgColorBG;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([XMGRecommendAttentionCell class]) bundle:nil] forCellReuseIdentifier:attention];
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
//  self.tableView.separatorInset=÷;

    
}
-(void)loadNewTableView{
    [SVProgressHUD show];
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"a"]=@"tag_recommend";
    params[@"action"]=@"sub";
    params[@"c"]=@"topic";
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //NSLogs(@"%@",responseObject);
        self.arrAttention=[XMGRecommendAttentionModel mj_objectArrayWithKeyValuesArray:responseObject];
        [SVProgressHUD dismiss];
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"请求失败"];
    }];
    
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrAttention.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XMGRecommendAttentionCell *cell=[tableView dequeueReusableCellWithIdentifier:attention];
    cell.attentionModel=self.arrAttention[indexPath.row];
    return cell;
}









@end












