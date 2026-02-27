//
//  ProductDetailsImageCollectionViewCell.m
//  ObjcDemo Project
//
//  Created by Neosoft on 22/04/24.
//

#import "ProductDetailsImageCollectionViewCell.h"
#import "SDWebImage/SDWebImage.h"
@implementation ProductDetailsImageCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)configureCellWithImageURL: (NSURL*) imgUrl{
    [self.productImg sd_setImageWithURL:imgUrl];
}

- (void)setBorderColorWithColor: (UIColor *) borderColor{
    self.layer.borderWidth = 2;
    self.layer.borderColor = borderColor.CGColor;
}

@end
