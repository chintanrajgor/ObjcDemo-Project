//
//  ProductDetailsTableViewCell.h
//  ObjcDemo Project
//
//  Created by Neosoft on 18/04/24.
//

#import <UIKit/UIKit.h>
#import "ProductDetails.h"

NS_ASSUME_NONNULL_BEGIN
//MARK: - ProductDetailsTableViewCell
@interface ProductDetailsTableViewCell : UITableViewCell<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

//MARK: - IBOutlets
@property (weak, nonatomic) IBOutlet UILabel *lblProductName;
@property (weak, nonatomic) IBOutlet UILabel *lblProductCategory;
@property (weak, nonatomic) IBOutlet UILabel *lblProducer;
@property (weak, nonatomic) IBOutlet UILabel *lblPrice;
@property (weak, nonatomic) IBOutlet UILabel *lblOutOfStock;
@property (weak, nonatomic) IBOutlet UILabel *lblDescriptionTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblDescription;
@property (weak, nonatomic) IBOutlet UIButton *btnShare;
@property (weak, nonatomic) IBOutlet UIImageView *productImg;
@property (weak, nonatomic) IBOutlet UICollectionView *productImageCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *ratingCollectionView;

- (void)setCollectionView;
- (void)configureCellWithProductDetails: (ProductDetails*) productDetails;

@end

NS_ASSUME_NONNULL_END
