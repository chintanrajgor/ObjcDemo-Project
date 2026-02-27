//
//  ProductDetailsViewModel.h
//  ObjcDemo Project
//
//  Created by Neosoft on 05/04/24.
//

#import <Foundation/Foundation.h>
#import "ProductDetails.h"
#import "Protocols.h"

NS_ASSUME_NONNULL_BEGIN
//MARK: - ProductDetailsViewModel
@interface ProductDetailsViewModel : NSObject

- (void) getProductDetailsForProductId: (NSNumber*) productId;
@property (weak,nonatomic) id<ResultMessageDelegate> resultMessageDelegate;
@property (strong,nonatomic) ProductDetails *productDetailsData;

@end

NS_ASSUME_NONNULL_END
