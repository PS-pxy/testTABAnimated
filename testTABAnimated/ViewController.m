//
//  ViewController.m
//  testTABAnimated
//
//  Created by PS on 2021/2/26.
//

#import "ViewController.h"
#import "NetRequestClass.h"
#import "testTableViewCell.h"
#import "textTableViewCell.h"
#import "cellModel.h"

#import "AAChartKit.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataAry;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = [UIView new];
        _tableView.tableFooterView = [UIView new];
        
    }
    return _tableView;
}


- (NSMutableArray *)dataAry{
    if (!_dataAry) {
        _dataAry = [NSMutableArray array];
    }
    return _dataAry;
}

-(void)ani:(UIView*)view1 anview2:(UIView*)view2{
    
    [UIView animateWithDuration:1 animations:^{
        view2.sd_layout.bottomEqualToView(view1).offset(-60);
        [view2 updateLayout];
    }];
    
}

-(void)setUpUI{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
    view.sd_layout.centerXEqualToView(self.view).centerYEqualToView(self.view).heightIs(300).widthIs(300);
    
    
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor  = [UIColor redColor];
    [view addSubview:redView];
//    redView.frame = CGRectMake(0, view.height, 50, 50);
    redView.sd_layout.leftEqualToView(view).bottomEqualToView(view).heightIs(100).widthIs(100);
    
    [UIView animateWithDuration:0.5 animations:^{
//        [redView sd_clearAutoLayoutSettings];
        redView.sd_layout.leftEqualToView(view).offset(15).widthIs(50).heightIs(50).topEqualToView(view).offset(20);

        [redView updateLayout];
        
        
    }];
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [button addTarget:self action:@selector(setUpUI) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button];
    
    button.sd_layout.rightEqualToView(self.view).offset(-20).topEqualToView(self.view).offset(88).heightIs(30).widthIs(30);
    
    self.view.backgroundColor = [UIColor greenColor];
    
//    CGFloat chartViewWidth  = self.view.frame.size.width;
//    CGFloat chartViewHeight = self.view.frame.size.height - 250;
//    AAChartView *aaChartView = [[AAChartView alloc]init];
//    aaChartView.frame = CGRectMake(0, 100, chartViewWidth, chartViewWidth);
//    //_aaChartView.scrollEnabled = NO;
////    aaChartView.layer.cornerRadius = chartViewWidth/2;
////    aaChartView.layer.masksToBounds = YES;
//    [self.view addSubview:aaChartView];
//
//    AAChartModel *aaChartModel = [AAChartModel new];
//    aaChartModel.chartType = AAChartTypeColumn;
//    aaChartModel.categoriesSet(@[@"外观",@"内饰",@"配置",@"控件", @"性价比",@"舒适性",@"操控",@"动力"]);
//    aaChartModel.polar = YES;
//    aaChartModel.titleFontSize = @5;
//    aaChartModel.backgroundColor = @"#FF97174D";
//    aaChartModel.legendEnabled = NO;
//    aaChartModel.yAxisVisible = NO; //yAxisVisible
//    aaChartModel.xAxisVisible = YES;
//    aaChartModel.dataLabelsEnabled = YES;
//
//    /*
//     .xAxisVisibleSet(true)//是否显示最外一层圆环
//     .yAxisVisibleSet(false)//是否显示中间的多个圆环
//     .legendEnabledSet(false)
//     */
//
//    AASeriesElement *series = [[AASeriesElement alloc] init];
//    series.data = @[@4.1, @3.4, @4.2, @3.4, @2.4, @4.0, @3.6, @4.2];
//    series.type  = AAChartTypeArea;
//    series.lineWidth  = @1;
//    series.borderColor = @"rgba(255, 151, 23, 1)";
//    series.color = @"rgba(255, 151, 23, 1)";
//    series.fillOpacity = @0.3;
//
//
//    aaChartModel.series = @[series];
//
//    [aaChartView aa_drawChartWithChartModel:aaChartModel];
    
    
    
    
    
    /*
    
    [self.view addSubview:self.tableView];
    
    self.tableView.tabAnimated = [TABTableAnimated animatedWithCellClassArray:@[[testTableViewCell class],[textTableViewCell class]] cellHeightArray:@[@250,@150] animatedCountArray:@[@1,@1]];
    
    [self.tableView tab_startAnimation];
    self.tableView.sd_layout.spaceToSuperView(UIEdgeInsetsMake(88, 0, 0, 0));
    
    [self getdata];
    
    
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeContactAdd)];
    [button addTarget:self action:@selector(buttonA) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view addSubview:button];
    
    button.sd_layout.centerXEqualToView(self.view).bottomSpaceToView(self.tableView, 0);
     */
}
-(void)buttonA{
    [self.tableView tab_startAnimation];
    [self.dataAry removeAllObjects];
    [self getdata];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataAry.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 1) {
        CGFloat height = [self.tableView cellHeightForIndexPath:indexPath model:self.dataAry[indexPath.row] keyPath:@"model" cellClass:[textTableViewCell class]  contentViewWidth:self.view.frame.size.width];
        NSLog(@"%f",height);
        return height;
    }
    
    CGFloat height = [self.tableView cellHeightForIndexPath:indexPath model:self.dataAry[indexPath.row] keyPath:@"model" cellClass:[testTableViewCell class]  contentViewWidth:self.view.frame.size.width];
    NSLog(@"%f",height);
    return height;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        textTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"textCell"];
        if (!cell) {
            cell = [[textTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"textCell"];
        }
        cell.model = self.dataAry[indexPath.row];
        return cell;
    }
    
    
    testTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"testCell"];
    if (!cell) {
        cell = [[testTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"testCell"];
    }
    cell.model = self.dataAry[indexPath.row];
    return cell;
}



-(void)getdata{
    NSDictionary *dic = @{@"pageindex":@"1",
                          @"tag":@"77897",
                          @"uid":@"2806",
    };
    
    [NetRequestClass NetRequestGETWithRequestURL:@"https://api.shenxuanche.com/getHomeNewsList_V2.aspx" WithParameter:dic WithReturnValeuBlock:^(id returnValue) {
        NSString *string = returnValue;
       NSData *jsonData = [string dataUsingEncoding:NSUTF8StringEncoding];
       NSError *err;
       NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                           options:NSJSONReadingMutableContainers
                                                             error:&err];
        
        
        for (NSDictionary *dataDic in dic[@"items"][@"data"]) {
            cellModel *model = [cellModel modelWithDictionary:dataDic];
            [self.dataAry addObject:model];
        }
        [self.tableView tab_endAnimation];
        [self.tableView reloadData];
        
        
    } WithFailureBlock:^(id errorCode) {
        
    }];
}






@end
