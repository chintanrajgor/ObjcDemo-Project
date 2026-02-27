//
//  ProductDetailsTableViewCell.m
//  ObjcDemo Project
//
//  Created by Neosoft on 18/04/24.
//

#import "ProductDetailsTableViewCell.h"
#import "RatingCollectionViewCell.h"
#import "ProductDetailsImageCollectionViewCell.h"
#import "SDWebImage/SDWebImage.h"

//MARK: - ProductDetailsTableViewCell
@implementation ProductDetailsTableViewCell

ProductDetailsData *productDetailsData;
- (void)awakeFromNib {
    [super awakeFromNib];
    [self setCollectionView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

- (void)setCollectionView{
    self.ratingCollectionView.delegate = self;
    self.ratingCollectionView.dataSource = self;
    self.productImageCollectionView.delegate = self;
    self.productImageCollectionView.dataSource = self;
    
    [self.ratingCollectionView registerNib:[UINib nibWithNibName:@"RatingCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"RatingCollectionViewCell"];
    [self.productImageCollectionView registerNib:[UINib nibWithNibName:@"ProductDetailsImageCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"ProductDetailsImageCollectionViewCell"];
    
}

- (void)configureCellWithProductDetails: (ProductDetails*) productDetails{
    self.lblProductName.text = productDetails.data.name;
    self.lblProductCategory.text = productDetails.data.producer;
    self.lblProducer.text = productDetails.data.producer;
    self.lblPrice.text = [@"Rs: " stringByAppendingString:[productDetails.data.cost stringValue]];
    self.lblDescription.text = productDetails.data.dataDescription;
    productDetailsData = productDetails.data;
    [self.ratingCollectionView reloadData];
    [self.productImageCollectionView reloadData];
    [self layoutIfNeeded];
}

//MARK: - Collection View Functions
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (collectionView == self.ratingCollectionView){
        RatingCollectionViewCell *ratingCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RatingCollectionViewCell" forIndexPath:indexPath];
        [ratingCell configureCellWithSelection:(indexPath.row < [productDetailsData.rating intValue])];
        return ratingCell;
    }
    ProductDetailsImageCollectionViewCell *imageCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ProductDetailsImageCollectionViewCell" forIndexPath:indexPath];
    NSURL *imgURL = [[NSURL alloc] initWithString: productDetailsData.productImages[indexPath.item].image];
    [imageCell configureCellWithImageURL:imgURL];
    if (indexPath.item == 0){
        [self.productImg sd_setImageWithURL:imgURL];
        [imageCell setBorderColorWithColor:[UIColor colorNamed:@"secondary"]];
    } else {
        [imageCell setBorderColorWithColor:UIColor.clearColor];
    }
    return imageCell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSURL *imgURL = [[NSURL alloc] initWithString: productDetailsData.productImages[indexPath.item].image];
    [self.productImg sd_setImageWithURL:imgURL];
    ProductDetailsImageCollectionViewCell *imageCell = [collectionView cellForItemAtIndexPath:indexPath];
    [imageCell setBorderColorWithColor:[UIColor colorNamed:@"secondary"]];
    if (indexPath.item != 0){
        [[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]] setBorderColorWithColor:UIColor.clearColor];
    }
    [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    ProductDetailsImageCollectionViewCell *imageCell = [collectionView cellForItemAtIndexPath:indexPath];
    [imageCell setBorderColorWithColor:UIColor.clearColor];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (collectionView == self.ratingCollectionView){
        return 5;
    }
    return productDetailsData.productImages.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (collectionView == self.ratingCollectionView){
        return CGSizeMake(collectionView.frame.size.width/5, collectionView.frame.size.width/5);
    }
    return CGSizeMake(collectionView.frame.size.width/2.5, collectionView.frame.size.height);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    if (collectionView == self.ratingCollectionView){
        return 0;
    }
    return 20;
}

@end
