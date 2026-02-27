//
//  ProductDetailsVC.h
//  ObjcDemo Project
//
//  Created by Neosoft on 05/04/24.
//

#import <UIKit/UIKit.h>
#import "Protocols.h"
#import "BaseVC.h"

NS_ASSUME_NONNULL_BEGIN
//MARK: - ProductDetailsVC
@interface ProductDetailsVC : BaseVC<ResultMessageDelegate,UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *productDetailsTableView;
@property (assign, nonatomic) NSNumber *productId;

- (void)getProductDetails;
- (void)setTableView;
@end

NS_ASSUME_NONNULL_END
