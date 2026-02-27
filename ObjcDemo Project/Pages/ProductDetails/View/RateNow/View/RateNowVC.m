//
//  RateNowVC.m
//  ObjcDemo Project
//
//  Created by Neosoft on 23/04/24.
//

#import "RateNowVC.h"
#import "RatingCollectionViewCell.h"

@interface RateNowVC ()

@end

@implementation RateNowVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setUpUI];
    [self setCollectionView];
}

- (void) setCollectionView{
    self.ratingCollectionView.delegate = self;
    self.ratingCollectionView.dataSource = self;
    
    
    [self.ratingCollectionView registerNib:[UINib nibWithNibName:@"RatingCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"RatingCollectionViewCell"];
}

- (void) setUpUI{
    self.lblProductName.text = self.productDetails.name;
    
}

- (IBAction)btnRateTapped:(UIButton *)sender {
    
}

- (IBAction)btnCloseTapped:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (UICollectionViewCell *)collectionView:( UICollectionView *)collectionView cellForItemAtIndexPath:( NSIndexPath *)indexPath {
    RatingCollectionViewCell *ratingCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RatingCollectionViewCell" forIndexPath:indexPath];
    [ratingCell configureCellWithSelection:(indexPath.row < [self.productDetails.rating intValue])];
    return ratingCell;
}

- (NSInteger)collectionView:( UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}


@end
