//
//  ProductDetailsService.m
//  ObjcDemo Project
//
//  Created by Neosoft on 08/04/24.
//

#import "ProductDetailsService.h"
#import "API Services.h"
#import "API Manager.h"

//MARK: - ProductDetailsService
@implementation ProductDetailsService
//Static API Call Function
+ (void)productDetailsFromProductID:(NSNumber *)productId completion:(void (^)(ProductDetails *, NSError *))completion {
    
    NSNumber *productIdNumber = @([productId intValue]);
    NSDictionary *params = @{@"product_id" : productId};
        
    APIServices *apiService = [[APIServices alloc] initWithService:APIServiceFetchProductsDetails param:params];
    
    [[APIManager sharedInstance] callRequestWithAPICallType:apiService completion:^(NSData *data, NSError *error){
            if (error) {
            completion(nil, error);
        } else {
            ProductDetails *productDetails = [[ProductDetails alloc] initWithData:data error:&error];
            if (error) {
                completion(nil, error);
            } else {
                completion(productDetails, nil);
            }
        }
    }];
}

@end
