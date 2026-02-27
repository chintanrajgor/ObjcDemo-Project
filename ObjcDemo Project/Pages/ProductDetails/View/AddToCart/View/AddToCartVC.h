//
//  AddToCart.h
//  ObjcDemo Project
//
//  Created by Neosoft on 23/04/24.
//

#import <UIKit/UIKit.h>
#import "ProductDetails.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddToCartVC : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lblProductName;
@property (weak, nonatomic) IBOutlet UILabel *lblEnterQuantity;
@property (weak, nonatomic) IBOutlet UILabel *lblStepperValue;
@property (weak, nonatomic) IBOutlet UIStepper *quantityStepper;
@property (weak, nonatomic) IBOutlet UIButton *btnClose;
@property (weak, nonatomic) IBOutlet UIButton *btnAddToCart;

@property (weak,nonatomic) ProductDetailsData * productDetails;
- (void) setUpUI;

@end

NS_ASSUME_NONNULL_END
