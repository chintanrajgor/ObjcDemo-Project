//
//  ProductDetails.m
//  ObjcDemo Project
//
//  Created by Neosoft on 05/04/24.
//

#import "ProductDetails.h"

// ProductDetails
@implementation ProductDetails
- (instancetype)initWithData:(NSData *)data error:(NSError **)error {
    self = [super init];
    if (self) {
        NSError *jsonError;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError) {
            *error = jsonError;
            return nil;
        }

        _status = json[@"status"];
        _message = json[@"message"];
        _userMsg = json[@"user_msg"];

        NSDictionary *userDataArray = json[@"data"];

        ProductDetailsData *productData = [[ProductDetailsData alloc] initWithDictionary:userDataArray];
        _data = productData;
    }
    return self;
}
@end

// ProductDetailsData
@implementation ProductDetailsData
- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        _id = dict[@"id"];
        _productCategoryID = dict[@"product_category_id"];
        _name = dict[@"name"];
        _producer = dict[@"producer"];
        _dataDescription = dict[@"description"];
        _cost = dict[@"cost"];
        _rating = dict[@"rating"];
        _viewCount = dict[@"view_count"];
        _created = dict[@"created"];
        _modified = dict[@"modified"];
        
        NSMutableArray<ProductImage *> *images = [NSMutableArray array];
        for (NSDictionary *imageDict in dict[@"product_images"]) {
            ProductImage *image = [[ProductImage alloc] initWithDictionary:imageDict];
            [images addObject:image];
        }
        _productImages = [images copy];
    }
    return self;
}
@end

// ProductImage
@implementation ProductImage
- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        _id = dict[@"id"];
        _productID = dict[@"product_id"];
        _image = dict[@"image"];
        _created = dict[@"created"];
        _modified = dict[@"modified"];
    }
    return self;
}
@end

