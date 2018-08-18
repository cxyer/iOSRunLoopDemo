//
//  ViewController.m
//  iOSRunLoopDemo
//
//  Created by 蔡晓阳 on 2018/8/18.
//  Copyright © 2018 cxy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *dataArr;



@end

@implementation ViewController

- (NSArray *)dataArr {
    if (!_dataArr) {
        _dataArr = @[@"scheduledTimer",@"timer",@"timer(UIScrollView)"];
    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    cell.textLabel.text = self.dataArr[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    if (indexPath.row == 0) {
        [self test1];
    } else if (indexPath.row == 1) {
        [self test2];
    } else if (indexPath.row == 2) {
        [self test3];
    }
}

- (void)timerAction {
    NSLog(@"%s",__func__);
}

- (void)test1 {
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
}
- (void)test2 {
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
}

- (void)test3 {
    //顺便滑动视图看看 改成NSRunLoopCommonModes
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}


@end
