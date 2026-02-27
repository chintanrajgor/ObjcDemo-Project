//
//  ProductDetailsFooterView.h
//  ObjcDemo Project
//
//  Created by Neosoft on 22/04/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProductDetailsFooterView : UIView
@property (weak, nonatomic) IBOutlet UIButton *btnAddtoCart;
@property (weak, nonatomic) IBOutlet UIButton *btnRateNow;

@property (assign,nonatomic) void (^rateNowHandler)(void);
@property (assign,nonatomic) void (^addToCartHandler)(void);

- (void) setUpUI;
@end

NS_ASSUME_NONNULL_END
