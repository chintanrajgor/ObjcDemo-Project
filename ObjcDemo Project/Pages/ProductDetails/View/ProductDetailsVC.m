//
//  ProductDetailsVC.m
//  ObjcDemo Project
//
//  Created by Neosoft on 05/04/24.
//

#import "ProductDetailsVC.h"
#import "ProductDetailsViewModel.h"
#import "ProductDetailsTableViewCell.h"
#import "ProductDetailsFooterView.h"
#import "RateNowVC.h"
#import "AddToCartVC.h"

//MARK: - ProductDetailsVC
@implementation ProductDetailsVC

ProductDetailsViewModel *viewModel;
//MARK: - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTableView];
    viewModel = [[ProductDetailsViewModel alloc] init];
    viewModel.resultMessageDelegate = self;
    self.title = @"Product Details";
    [self getProductDetails];
}

- (void)getProductDetails{
    [viewModel getProductDetailsForProductId:self.productId];
}

- (void)setTableView{
    self.productDetailsTableView.delegate = self;
    self.productDetailsTableView.dataSource = self;
    
    [self.productDetailsTableView registerNib:[UINib nibWithNibName:@"ProductDetailsTableViewCell" bundle:nil] forCellReuseIdentifier: @"ProductDetailsTableViewCell"];
    [self.productDetailsTableView registerNib:[UINib nibWithNibName:@"ProductDetailsFooterView" bundle:nil] forCellReuseIdentifier:@"ProductDetailsFooterView"];
}

//MARK: - TableView Delegate and Datasource
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    ProductDetailsTableViewCell *cell = (ProductDetailsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"ProductDetailsTableViewCell" forIndexPath:indexPath];
    [cell configureCellWithProductDetails:viewModel.productDetailsData];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (viewModel.productDetailsData == NULL){
        return 0;
    }
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:@"ProductDetailsFooterView" owner:self options:nil];
    ProductDetailsFooterView *footerView = [nibContents objectAtIndex:0];
    footerView.rateNowHandler = ^{
        Rate *nextVC = [[ProductDetailsVC alloc] init];
        nextVC.productId = productId;
        [self.navigationController pushViewController:nextVC animated:YES];
    };
    return footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

//MARK: - Message Delegate
- (void)resultWithMessage:(nonnull NSString *)resultMsg {
    dispatch_async(dispatch_get_main_queue(), ^{
        if ([resultMsg  isEqual: @"ProductDetails Fetched Successfully"]){
            [self.productDetailsTableView reloadData];
        } else {
            [self showAlertWithTitle:@"Alert" message:resultMsg completion:^{}];
        }
    });
}

@end
