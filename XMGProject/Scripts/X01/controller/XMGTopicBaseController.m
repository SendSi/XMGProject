//
//  XMGTopicBaseController.m
//  XMGProject
//
//  Created by SunSi on 16/5/8.
//  Copyright © 2016年 Scuplt0413. All rights reserved.
//

#import "XMGTopicBaseController.h"
#import <AFNetworking.h>
#import "XMGTopicModel.h"
#import <MJExtension.h>
#import <UIImageView+WebCache.h>
#import <MJRefresh.h>
#import "XMGTopicCell.h"


@interface XMGTopicBaseController ()
/** 数组  */
@property (strong,nonatomic) NSMutableArray *topicArr;

/** 页数  */
@property (assign,nonatomic) NSInteger page;

/** maxTime  */
@property (copy,nonatomic) NSString *maxtime;

/** 上一次请求,防止,用户还没反应过来,请求这又请那  */
@property (strong,nonatomic) NSDictionary *params;

@end

@implementation XMGTopicBaseController


-(NSMutableArray *)topicArr{
    if(!_topicArr)_topicArr=[NSMutableArray array];
    return _topicArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTableviewStyle];
    [self setRefreshView];
    [self setTableviewCell];
}


-(void)setTableviewStyle{
    self.tableView.backgroundColor=xmgColorBG;
    //设置内边距
    CGFloat bottom=self.tabBarController.tabBar.height;//底部高度
    CGFloat top=xmgTableViewH+xmgTableViewY;
    self.tableView.contentInset=UIEdgeInsetsMake(top, 0, bottom, 0);
    self.tableView.scrollIndicatorInsets=self.tableView.contentInset;
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
}


#pragma  mark -头部数据
-(void) setRefreshView{
    self.tableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewTopicData)];
    [self.tableView.mj_header beginRefreshing];
    self.tableView.mj_header.automaticallyChangeAlpha=YES;
    
    
    self.tableView.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreTopicData)];
    
}


#pragma  mark -数据
/** 一开始的数据   */
-(void)loadNewTopicData{
    [self.tableView.mj_footer endRefreshing];
    
    NSMutableDictionary *pars=[NSMutableDictionary dictionary];
    pars[@"a"]=@"list";
    pars[@"c"]=@"data";
    pars[@"type"]=@(self.type);
    self.page=0;
    self.params=pars;
    
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:pars progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary   *responseObject) {
        // NSLogs(@"%@",responseObject);
        // [responseObject writeToFile:@"users/sunsi/desktop/abs.plist" atomically:YES];///Users/sunsi/Desktop
        if(self.params!=pars)return ;
        self.maxtime=responseObject[@"info"][@"maxtime"];
        
        
        self.topicArr=[XMGTopicModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if(self.params!=pars)return ;
        [self.tableView.mj_header endRefreshing];
    }];
}

/** 加载新数据  */
-(void)loadMoreTopicData{
    [self.tableView.mj_header endRefreshing];
    self.page++;
    NSMutableDictionary *pars=[NSMutableDictionary dictionary];
    pars[@"a"]=@"list";
    pars[@"c"]=@"data";
    pars[@"type"]=@(self.type);
    pars[@"page"]=@(self.page);
    pars[@"maxtime"]=self.maxtime;
    self.params=pars;//self.params防止多次请求389585111
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:pars progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary   *responseObject) {
        if(self.params!=pars)return ;
        self.maxtime=responseObject[@"info"][@"maxtime"];
        
        NSArray *arr=[XMGTopicModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.topicArr addObjectsFromArray:arr];
        
        [self.tableView reloadData];
        [self.tableView.mj_footer endRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if(self.params!=pars)return ;
        [self.tableView.mj_header endRefreshing];
        self.page--;//网络不给力时
    }];
}

#pragma mark - Table view的内容
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // NSLogs(@"%ld",self.topicArr.count);
    return self.topicArr.count;
}

//cell的创建
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XMGTopicCell *cell=[tableView dequeueReusableCellWithIdentifier:topicCell];
    cell.topicModel=self.topicArr[indexPath.row];
    
    return cell;
}


#pragma mark -cell代理
static NSString *const topicCell=@"topicCell";
/** cell使用  */
-(void)setTableviewCell{
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([XMGTopicCell class]) bundle:nil] forCellReuseIdentifier:topicCell];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   XMGTopicModel *model= self.topicArr[indexPath.row];
    return model.cellHeight;
}



@end
