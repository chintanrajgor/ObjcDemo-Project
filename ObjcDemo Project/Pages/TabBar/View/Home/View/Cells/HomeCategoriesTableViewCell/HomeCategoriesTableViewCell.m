//
//  HomeCategoriesTableViewCell.m
//  ObjcDemo Project
//
//  Created by Neosoft on 03/04/24.
//

#import "HomeCategoriesTableViewCell.h"
#import "HomeProductListCollectionViewCell.h"

//MARK: - HomeCategoriesTableViewCell
@implementation HomeCategoriesTableViewCell
//Lifecycle
- (void)awakeFromNib {
    [super awakeFromNib];
    [self setCollectionView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

//Functions
- (void) setCollectionView{
    self.homeProductListCollectionView.delegate = self;
    self.homeProductListCollectionView.dataSource = self;
    
    [self.homeProductListCollectionView registerNib:[UINib nibWithNibName:@"HomeProductListCollectionViewCell" bundle:nil] forCellWithReuseIdentifier: @"HomeProductListCollectionViewCell"];
}

//MARK: - Configure
- (void) configureCellWithProductList: (NSArray<ProductsData *>*) productList{
    self.productsList = productList;
    [self.homeProductListCollectionView reloadData];
}

//MARK: - Collection View Functions
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeProductListCollectionViewCell *productListCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeProductListCollectionViewCell" forIndexPath:indexPath];
    [productListCell configureCellWithProductData:self.productsList[indexPath.row]];
    productListCell.layer.cornerRadius = 5;
    return productListCell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.cellTappedHandler(self.productsList[indexPath.item].id);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.productsList.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(collectionView.frame.size.width/2.5, collectionView.frame.size.height - 20);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 10, -10, 10);
}

@end
