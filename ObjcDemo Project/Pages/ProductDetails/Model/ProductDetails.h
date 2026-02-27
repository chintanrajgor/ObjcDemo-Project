//
//  ProductDetails.h
//  ObjcDemo Project
//
//  Created by Neosoft on 05/04/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// ProductImage
@interface ProductImage : NSObject
@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, strong) NSNumber *productID;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *created;
@property (nonatomic, strong) NSString *modified;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
@end

// ProductDetailsData
@interface ProductDetailsData : NSObject
@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, strong) NSNumber *productCategoryID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *producer;
@property (nonatomic, strong) NSString *dataDescription;
@property (nonatomic, strong) NSNumber *cost;
@property (nonatomic, strong) NSNumber *rating;
@property (nonatomic, strong) NSNumber *viewCount;
@property (nonatomic, strong) NSString *created;
@property (nonatomic, strong) NSString *modified;
@property (nonatomic, strong) NSArray<ProductImage *> *productImages;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
@end

// ProductDetails
@interface ProductDetails : NSObject
@property (nonatomic, strong) NSNumber *status;
@property (nonatomic, strong) ProductDetailsData *data;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *userMsg;

- (instancetype)initWithData:(NSData *)data error:(NSError **)error;
@end




NS_ASSUME_NONNULL_END
