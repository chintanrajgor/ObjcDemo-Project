//
//  HomeVC.h
//  ObjcDemo Project
//
//  Created by Neosoft on 01/04/24.
//

#import <UIKit/UIKit.h>
#import "BaseVC.h"
#import "HomeViewModel.h"
#import "Protocols.h"

NS_ASSUME_NONNULL_BEGIN
//MARK: - HomeVC
@interface HomeVC : BaseVC<UITableViewDelegate,UITableViewDataSource, ResultMessageDelegate>
@property (weak, nonatomic) IBOutlet UITableView *homeTableView;

//ViewModel
@property (strong, nonatomic) HomeViewModel *VM;

- (void)setUpUI;
- (void)setTableView;
- (void)getProductList;
- (void)goToNextVCWithProductId: (NSNumber*)productId;
@end

NS_ASSUME_NONNULL_END
