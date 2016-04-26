//
//  XMGRecommendViewController.m
//  XMGProject
//
//  Created by scuplt on 16/4/19.
//  Copyright © 2016年 Scuplt0413. All rights reserved.
//

#import "XMGRecommendViewController.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>
#import <MJExtension.h>
#import "XMGRecommondCategoryModel.h"
#import "XMGRecommendCategoryCell.h"
#import "XMGRecommondUserCell.h"
#import "XMGRecommondUserModel.h"
#import <MJRefresh.h>
/** 选中的行 */
#define xmgDidSelectCategory self.categoryData[self.categoryTableView.indexPathForSelectedRow.row]

@interface XMGRecommendViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *categoryTableView;
@property (weak, nonatomic) IBOutlet UITableView *userTableView;
/** 数组 categroy数据 */
@property (nonatomic,strong) NSArray *categoryData;

/** dic请求参数 */
@property (nonatomic,strong) NSMutableDictionary *paramsDic;

/** afn网络请求管理者,懒加载 */
@property (nonatomic,strong) AFHTTPSessionManager *manager;

@end

@implementation XMGRecommendViewController

static NSString *const xmgCategoryId=@"category";
static NSString *const xmgUserId=@"user";
#pragma mark 懒加载 处
-(AFHTTPSessionManager *)manager{
    if(_manager==nil){
        _manager=[AFHTTPSessionManager manager];
    }
    return _manager;
}


#pragma mark --viewDidLoad的加载方法1.UI,2.菊花转控件,3.左侧网络请求
- (void)viewDidLoad {
    [super viewDidLoad];
    [self panelView];/** 视图内容 */
    [self panelNetConLeft];/** 初始网络请求 左侧*/
    [self setupRefresh];/** 刷新菊花转 */
}

/** 视图内容 */
-(void) panelView{
    //add table --注册表格
    [self.categoryTableView registerNib:[UINib nibWithNibName:NSStringFromClass([XMGRecommendCategoryCell class]) bundle:nil] forCellReuseIdentifier:xmgCategoryId];
    [self.userTableView registerNib:[UINib nibWithNibName:NSStringFromClass([XMGRecommondUserCell class]) bundle:nil] forCellReuseIdentifier:xmgUserId];
    self.userTableView.rowHeight=70;
    
    self.title=@"推荐关注";
    self.view.backgroundColor=xmgColorBG;
}
/** 初始网络请求 左侧*/
-(void)panelNetConLeft{
    [SVProgressHUD show];
    NSMutableDictionary *dic=[NSMutableDictionary dictionary];
    dic[@"a"]=@"category";
    dic[@"c"]=@"subscribe";
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:dic progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        self.categoryData= [XMGRecommondCategoryModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.categoryTableView reloadData];
        [self.categoryTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];//选中首行
        //让用户表格进入下拉刷新状态
        [self.userTableView.mj_header beginRefreshing];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"加载失败"];
    }];
}


/** 刷新菊花转 */
-(void)setupRefresh{//底下刷新
    self.userTableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadTopNewUsers) ];
    self.userTableView.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreUser)];
    self.userTableView.mj_footer.hidden=YES;
}


#pragma mark --菊花转
-(void)loadMoreUser{//加载 下一页数据
    XMGRecommondCategoryModel *vc= xmgDidSelectCategory;//选中行
    
    //请求参数
    NSMutableDictionary *dic=[NSMutableDictionary dictionary];
    dic[@"a"]=@"list";
    dic[@"c"]=@"subscribe";
    dic[@"category_id"]=@(vc.id);
    dic[@"page"]=@(++vc.currentPage);//页码请求参数
    self.paramsDic=dic;
    
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:dic progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *users=[XMGRecommondUserModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        [vc.userArrCategory addObjectsFromArray:users];   // 添加到当前类别对应的用户数组中
        vc.total=[responseObject[@"total"] integerValue];
        
        
        if(self.paramsDic!=dic)return ;//假若用户 点击很快,还没reload过来.
        
        [self.userTableView reloadData];
        
        [self checkFooterState];//让底部 的菊花转 停止消失
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if(self.paramsDic!=dic)return ;
        
        
        [SVProgressHUD showErrorWithStatus:@"加载失败"];
        [self.userTableView.mj_footer endRefreshing];
    }];
}
-(void)loadTopNewUsers{//加载 头部
    XMGRecommondCategoryModel *vc= xmgDidSelectCategory;//选中行
    vc.currentPage=1;
    
    //请求参数
    NSMutableDictionary *dic=[NSMutableDictionary dictionary];
    dic[@"a"]=@"list";
    dic[@"c"]=@"subscribe";
    dic[@"category_id"]=@(vc.id);
    dic[@"page"]=@(vc.currentPage);//页码请求参数
    self.paramsDic=dic;
    
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:dic progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *users=[XMGRecommondUserModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [vc.userArrCategory removeAllObjects];//先清除全部数据
        
        [vc.userArrCategory addObjectsFromArray:users];//再全部一次性 加入
        
        vc.total=[responseObject[@"total"] integerValue];
        
        if(self.paramsDic!=dic)return ;
        
        
        [self.userTableView reloadData];
        [self.userTableView.mj_header endRefreshing];
        [self checkFooterState];//结束菊花
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if(self.paramsDic!=dic)return ;
        
        [SVProgressHUD showErrorWithStatus:@"刷新失败"];
        [self.userTableView.mj_header endRefreshing];
    }];
}
/** 检测脚部 底部 */
-(void)checkFooterState{
    XMGRecommondCategoryModel *vc=xmgDidSelectCategory;
    self.userTableView.mj_footer.hidden=(vc.userArrCategory.count==0);
    
    if(vc.userArrCategory.count==vc.total)
        [self.userTableView.mj_footer endRefreshingWithNoMoreData];
    else
        [self.userTableView.mj_footer endRefreshing];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView==self.categoryTableView)
        return self.categoryData.count;
    
    [self checkFooterState];
    return [xmgDidSelectCategory userArrCategory].count;//右边表格的总数
    
}
#pragma mark -代理
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(tableView==self.categoryTableView){
        XMGRecommendCategoryCell *cell=[tableView dequeueReusableCellWithIdentifier:xmgCategoryId];
        cell.category=self.categoryData[indexPath.row];
        return  cell;
    }
    else{
        XMGRecommondUserCell *cell=[tableView dequeueReusableCellWithIdentifier:xmgUserId];
        cell.userModel=[xmgDidSelectCategory userArrCategory][indexPath.row];
        return  cell;
    }
}
/** 点击选中 */
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.userTableView.mj_footer endRefreshing];
    [self.userTableView.mj_header endRefreshing];//结束刷新
    
    XMGRecommondCategoryModel *vc=self.categoryData[indexPath.row];
    
    if(vc.userArrCategory.count){
        [self.userTableView reloadData];
    }
    else {
       [self.userTableView reloadData];//一点击,先把右边清空,防止点击
        
        [self.userTableView.mj_header beginRefreshing];
    }
}
-(void)dealloc{
    [self.manager.operationQueue cancelAllOperations];
}

@end
