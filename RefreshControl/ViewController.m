//
//  ViewController.m
//  RefreshControl
//
//  Created by hu on 2017/3/6.
//  Copyright © 2017年 LCY. All rights reserved.
//

#import "ViewController.h"
#import "Refresh.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) RefreshHeader *refresh;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.refresh = [[RefreshHeader alloc] initWithTarget:self.tableView beginRefreshBlock:^{
        [self loadData];
    }];
    [self.view addSubview:self.tableView];
    
    [self.refresh beginRefreshing];
}

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}

- (void)loadData{
    
    __weak typeof(self) weakSelf = self;

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        __strong typeof (weakSelf) strongSelf = weakSelf;
        [strongSelf.dataArray addObjectsFromArray:@[@1,@1,@1,@1,@1,@1,@1,@1,@1,@1,@1,]];
        [strongSelf.refresh endRefreshing];
        [strongSelf.tableView reloadData];
    });
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
