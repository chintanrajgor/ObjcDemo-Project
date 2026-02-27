//
//  RateNowVC.h
//  ObjcDemo Project
//
//  Created by Neosoft on 23/04/24.
//

#import <UIKit/UIKit.h>
#import "ProductDetails.h"

NS_ASSUME_NONNULL_BEGIN

@interface RateNowVC : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UILabel *lblProductName;
@property (weak, nonatomic) IBOutlet UIButton *btnClose;
@property (weak, nonatomic) IBOutlet UICollectionView *ratingCollectionView;
@property (weak, nonatomic) IBOutlet UIButton *btnRate;

@property (weak,nonatomic) ProductDetailsData * productDetails;

- (void) setUpUI;
- (void) setCollectionView;

@end

NS_ASSUME_NONNULL_END
