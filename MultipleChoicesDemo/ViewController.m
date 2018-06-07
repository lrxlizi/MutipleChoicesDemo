//
//  ViewController.m
//  MultipleChoicesDemo
//
//  Created by 栗子 on 2018/6/5.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/.     https://github.com/lrxlizi/     https://blog.csdn.net/qq_33608748. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "Model.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView    *tableView;
@property(nonatomic,strong) NSMutableArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self initData];
    [self createUI];
    
}

- (void)initData{
    
    self.dataSource = [NSMutableArray array];
    for (int i=0; i<10; i++) {
        Model *model = [[Model alloc]init];
        model.isSelected = NO;
        model.text       = [NSString stringWithFormat:@"这是第%d个",i];
        [self.dataSource addObject:model];
    }
    [self.tableView reloadData];
}

- (void)createUI{
    
    self.tableView                 = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64) style:(UITableViewStylePlain)];
    self.tableView.dataSource      = self;
    self.tableView.delegate        = self;
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.tableView.tableFooterView = [UIView new];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TableViewCell class]) bundle:nil] forCellReuseIdentifier:@"IDCELL"];
    [self.view addSubview:self.tableView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"上传" style:(UIBarButtonItemStylePlain) target:self action:@selector(rightBarButtonItemAction)];
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IDCELL"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model          = self.dataSource[indexPath.row];
//    //如果是只点击选中按钮选择的话
//    cell.selectBtn.tag  = indexPath.row;
//    [cell.selectBtn addTarget:self action:@selector(selectBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Model *model = self.dataSource[indexPath.row];
    model.isSelected = !model.isSelected;
    [self.tableView reloadData];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 70;
    
}


- (void)rightBarButtonItemAction{
    
    NSMutableArray *upLoadArr = [NSMutableArray array];
    for (int i=0; i<self.dataSource.count; i++) {
        Model *model = self.dataSource[i];
        if (model.isSelected) {
            [upLoadArr addObject:model];
        }
    }
    
    NSLog(@"upLoadArr====%@",upLoadArr);
    
}

//- (void)selectBtnAction:(UIButton *)btn{
//
//    Model *model = self.dataSource[btn.tag];
//    model.isSelected = !model.isSelected;
//    [self.tableView reloadData];
//
//}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
