//
//  ProductDetailsFooterView.m
//  ObjcDemo Project
//
//  Created by Neosoft on 22/04/24.
//

#import "ProductDetailsFooterView.h"

@implementation ProductDetailsFooterView

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setUpUI];
}

- (void) setUpUI{
    self.btnRateNow.layer.borderWidth = 1;
    self.btnAddtoCart.layer.borderWidth = 1;
    self.btnRateNow.layer.borderColor = [UIColor colorNamed:@"secondary"].CGColor;
    self.btnAddtoCart.layer.borderColor = [UIColor colorNamed:@"secondary"].CGColor;
}

- (IBAction)btnRateNowTapped:(UIButton *)sender {
    [self rateNowHandler];
}

- (IBAction)btnAddToCartTapped:(UIButton *)sender {
    [self addToCartHandler];
}


@end
