//
//  HomeVC.m
//  ObjcDemo Project
//
//  Created by Neosoft on 01/04/24.
//

#import "HomeVC.h"
#import "RegisterVC.h"
#import "HomeCategoriesTableViewCell.h"
#import "RegisterHeaderView.h"
#import "ProductDetailsVC.h"

//MARK: - HomeVC
@implementation HomeVC

//MARK: - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTableView];
    [self setUpUI];
    [super setLoaderWithContainerView: self.view];
    [self getProductList];
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
}

//Function
- (void) setUpUI{
    self.VM = [[HomeViewModel alloc] init];
    self.VM.resultMessageDelegate = self;
    self.view.backgroundColor = [UIColor colorNamed:@"secondary"];
}


- (void)setTableView{
    self.homeTableView.delegate = self;
    self.homeTableView.dataSource = self;

    [self.homeTableView registerNib:[UINib nibWithNibName:@"HomeCategoriesTableViewCell" bundle:nil] forCellReuseIdentifier: @"HomeCategoriesTableViewCell"];
}

- (void)getProductList{
    [super showLoader];
    [self.VM callForGetProductList];
}

- (void)goToNextVCWithProductId: (NSNumber*)productId{
    ProductDetailsVC *nextVC = [[ProductDetailsVC alloc] init];
    nextVC.productId = productId;
    [self.navigationController pushViewController:nextVC animated:YES];
}

//MARK: - TableView Functions
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    HomeCategoriesTableViewCell *categoryCell = [tableView dequeueReusableCellWithIdentifier:@"HomeCategoriesTableViewCell" forIndexPath:indexPath];
    [categoryCell configureCellWithProductList:self.VM.categoryProductList[indexPath.section][@"CategoryProducts"]];
    categoryCell.cellTappedHandler = ^(NSNumber *productId){
        [self goToNextVCWithProductId:productId];
    };
    return  categoryCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.VM.categoryProductList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.view.frame.size.width/1.8;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    RegisterHeaderView *headerView = [[RegisterHeaderView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 30)];
    UILabel *headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, tableView.frame.size.width, 30)];
    headerLabel.text = self.VM.categoryIdDict[@(section + 1)];
    headerLabel.textAlignment = NSTextAlignmentLeft;
    headerLabel.font = [UIFont fontWithName:@"KohinoorDevanagari-Semibold" size:22.0f];
    headerLabel.textColor = [UIColor whiteColor];
    [headerView addSubview:headerLabel];
    return headerView;
}

//MARK: - ResultMessageDelegate Function
- (void)resultWithMessage:(NSString *)resultMsg {
    dispatch_async(dispatch_get_main_queue(), ^{
        [super hideLoader];
        if ([resultMsg  isEqual: @"Products Fetched SuccessFully"]){
            [self.homeTableView reloadData];
            NSLog(@"%@", self.VM.categoryProductList);
        } else {
            [self showAlertWithTitle:@"Alert" message:resultMsg completion:^{}];
        }
    });
}

@end
