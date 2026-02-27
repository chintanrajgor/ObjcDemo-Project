//
//  ProductDetailsImageCollectionViewCell.h
//  ObjcDemo Project
//
//  Created by Neosoft on 22/04/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProductDetailsImageCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *productImg;

- (void)configureCellWithImageURL: (NSURL*) imgUrl;
- (void)setBorderColorWithColor: (UIColor *) borderColor;
@end

NS_ASSUME_NONNULL_END
