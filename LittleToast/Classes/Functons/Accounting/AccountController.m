//
//  AccountController.m
//  LittleToast
//
//  Created by Mr_kit on 2018/3/31.
//  Copyright © 2018年 Mr_kit. All rights reserved.
//

#import "AccountController.h"
#import "AccountBarView.h"
#import "AccountTableViewHeaderView.h"
#import "AccountCell.h"

static NSString *accountingReusedID = @"accountingReusedID";

@interface AccountController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) AccountTableViewHeaderView *headerView;
@property (nonatomic, strong) BaseTableView *tableView;

@end

@implementation AccountController
#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 布局
- (void)setupNav {
    //隐藏导航栏
    self.fd_prefersNavigationBarHidden = YES;
}

- (void)setupView {
    [self.view addSubview:self.tableView];
    
    AccountBarView *baseNav = [[AccountBarView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, Navigation_Height) title:@"小本本" superView:self.tableView];
    baseNav.maxDistentce = 300;
    [self.view addSubview:baseNav];
    
}


#pragma mark - tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AccountCell *cell = [tableView dequeueReusableCellWithIdentifier:accountingReusedID forIndexPath:indexPath];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65;
}






#pragma mark - lazyLoad
-(BaseTableView *)tableView {
    if (!_tableView) {
        _tableView = [[BaseTableView alloc] initWithFrame:self.view.bounds];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.showsVerticalScrollIndicator = NO;
        [_tableView registerClass:[AccountCell class] forCellReuseIdentifier:accountingReusedID];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableHeaderView = self.headerView;
        
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 49)];
    }
    return _tableView;
}

- (AccountTableViewHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[AccountTableViewHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH - 50)];
    }
    return _headerView;
}
@end
