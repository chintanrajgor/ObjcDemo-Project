//
//  ProductDetailsViewModel.m
//  ObjcDemo Project
//
//  Created by Neosoft on 05/04/24.
//

#import "ProductDetailsViewModel.h"
#import "ProductDetailsService.h"
//MARK: - ProductDetailsViewModel
@implementation ProductDetailsViewModel

- (void) getProductDetailsForProductId: (NSNumber*) productId{
    [ProductDetailsService productDetailsFromProductID:productId completion:^(ProductDetails * productDetails, NSError * error) {
        if (productDetails) {
            self.productDetailsData = productDetails;
            [self.resultMessageDelegate resultWithMessage:@"ProductDetails Fetched Successfully"];
            } else if (error) {
                [self.resultMessageDelegate resultWithMessage:error.localizedDescription];
            }
    }];
}

@end
