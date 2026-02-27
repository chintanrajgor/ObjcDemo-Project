//
//  HomeCategoriesTableViewCell.h
//  ObjcDemo Project
//
//  Created by Neosoft on 03/04/24.
//

#import <UIKit/UIKit.h>
#import "Products.h"

NS_ASSUME_NONNULL_BEGIN
//MARK: - HomeCategoriesTableViewCell
@interface HomeCategoriesTableViewCell : UITableViewCell<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
//IBOutlets
@property (weak, nonatomic) IBOutlet UICollectionView *homeProductListCollectionView;
@property (weak, nonatomic) NSArray<ProductsData *> *productsList;
@property (strong,nonatomic) void (^cellTappedHandler)(NSNumber*);

//Functions
- (void) configureCellWithProductList: (NSArray<ProductsData *>*) productList;
- (void) setCollectionView;
@end

NS_ASSUME_NONNULL_END
