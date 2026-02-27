//
//  ProductDetailsService.h
//  ObjcDemo Project
//
//  Created by Neosoft on 08/04/24.
//

#import <Foundation/Foundation.h>
#import "ProductDetails.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProductDetailsService : NSObject

+ (void)productDetailsFromProductID: (NSNumber *) productId
                   completion:(void (^)(ProductDetails * productDetails, NSError * error))completion;

@end

NS_ASSUME_NONNULL_END
