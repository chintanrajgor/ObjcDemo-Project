//
//  HomeViewModel.m
//  ObjcDemo Project
//
//  Created by Neosoft on 03/04/24.
//

#import "HomeViewModel.h"
#import "HomeService.h"
//MARK: - HomeViewModel
@implementation HomeViewModel

Products *productList;
dispatch_group_t group;
- (instancetype)init{
    self = [super init];
    self.categoryIdDict = @{
        @1 : @"Table",
        @2 : @"Chair",
        @3 : @"Sofa",
        @4 : @"Cupboard"
    };
    self.categoryProductList = [[NSMutableArray alloc] init];
    group = dispatch_group_create();
    return self;
}
 
- (void) callForGetProductList{
    for (NSNumber *key in self.categoryIdDict) {
        dispatch_group_enter(group);
        [self getProductListForCategoryId:key];
    }
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"CategoryId" ascending:YES];
        self.categoryProductList = (NSMutableArray *)[self.categoryProductList sortedArrayUsingDescriptors:@[sortDescriptor]];
        [self.resultMessageDelegate resultWithMessage:@"Products Fetched SuccessFully"];
        
    });
}

- (void) getProductListForCategoryId: (NSNumber*) categoryId{
    [HomeService fetchProductsListWithProductCategoryId:categoryId completion:^(Products* products, NSError* error) {
            if (products) {
                [self updatingDictionaryWithCategory:categoryId products:products];
                dispatch_group_leave(group);
                
            } else if (error) {
                NSLog(@"%@", error.localizedDescription);
                [self.resultMessageDelegate resultWithMessage:error.localizedDescription];
            }
    }];
}

- (void) updatingDictionaryWithCategory: (NSNumber*) categoryId products: (Products *) productList{
    NSMutableDictionary *categoryDict = [[NSMutableDictionary alloc] init];
    [categoryDict setValue: categoryId forKey:@"CategoryId"];
    [categoryDict setObject:self.categoryIdDict[categoryId] forKey:@"CategoryName"];
    [categoryDict setObject:productList.data forKey:@"CategoryProducts"];

    [self.categoryProductList addObject:categoryDict];
}

@end
