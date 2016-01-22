//
//  CLPhotoCategory.h
//  Client500
//
//  Created by Aleksey Novikov on 21/01/16.
//  Copyright © 2016 Aleksey Novikov. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, CLPhotoCategoryID)
{
    CLPhotoCategoryUncategorized = 0,
    CLPhotoCategoryAbstract = 10,
    CLPhotoCategoryAnimals = 11,
    CLPhotoCategoryBlackAndWhite = 5,
    CLPhotoCategoryCelbrities = 1,
    CLPhotoCategoryCityAndArchitecture = 9,
    CLPhotoCategoryCommercial = 15,
    CLPhotoCategoryConcert = 16,
    CLPhotoCategoryFamily = 20,
    CLPhotoCategoryFashion = 14,
    CLPhotoCategoryFilm = 2,
    CLPhotoCategoryFineArt = 24,
    CLPhotoCategoryFood = 23,
    CLPhotoCategoryJournalism = 3,
    CLPhotoCategoryLandscapes = 8,
    CLPhotoCategoryMacro = 12,
    CLPhotoCategoryNature = 18,
    CLPhotoCategoryNude = 4,
    CLPhotoCategoryPeople = 7,
    CLPhotoCategoryPerformingArts = 19,
    CLPhotoCategorySport = 17,
    CLPhotoCategoryStillLife = 6,
    CLPhotoCategoryStreet = 21,
    CLPhotoCategoryTransportation = 26,
    CLPhotoCategoryTravel = 13,
    CLPhotoCategoryUnderwater = 22,
    CLPhotoCategoryUrbanExploration = 27,
    CLPhotoCategoryWedding = 25
};

@interface CLPhotoCategory : NSObject

@property(nonatomic, assign) CLPhotoCategoryID categoryID;
@property(nonatomic, strong) NSString *categoryName;
@property(nonatomic, strong) NSArray *photos;

- (instancetype)initWithID:(CLPhotoCategoryID)categoryID;

+ (NSString *)categoryNameByID:(CLPhotoCategoryID)categoryID;

+ (NSArray *)allCategories;

//- (NSArray *)fillWithPhotos

@end
