//
//  CLPhotoCategory.m
//  Client500
//
//  Created by Aleksey Novikov on 21/01/16.
//  Copyright © 2016 Aleksey Novikov. All rights reserved.
//

#import "CLPhotoCategory.h"

@implementation CLPhotoCategory

- (instancetype)initWithID:(CLPhotoCategoryID)categoryID
{
    self = [super init];
    if (self) {
        self.categoryID = categoryID;
        self.categoryName = [CLPhotoCategory categoryNameByID:self.categoryID];
    }
    return self;
}

+ (NSString *)categoryNameByID:(CLPhotoCategoryID)categoryID
{
        NSString *categoryName;
        switch (categoryID) {
            case CLPhotoCategoryAbstract:
                categoryName = @"Abstract";
                break;
            case CLPhotoCategoryAnimals:
                categoryName = @"Animals";
                break;
            case CLPhotoCategoryBlackAndWhite:
                categoryName = @"Black and White";
                break;
            case CLPhotoCategoryCelbrities:
                categoryName = @"Celebrities";
                break;
            case CLPhotoCategoryCityAndArchitecture:
                categoryName = @"City and Architecture";
                break;
            case CLPhotoCategoryCommercial:
                categoryName = @"Commericial";
                break;
            case CLPhotoCategoryConcert:
                categoryName = @"Concert";
                break;
            case CLPhotoCategoryFamily:
                categoryName = @"Family";
                break;
            case CLPhotoCategoryFashion:
                categoryName = @"Fashion";
                break;
            case CLPhotoCategoryFilm:
                categoryName = @"Film";
                break;
            case CLPhotoCategoryFineArt:
                categoryName = @"Fine Art";
                break;
            case CLPhotoCategoryFood:
                categoryName = @"Food";
                break;
            case CLPhotoCategoryJournalism:
                categoryName = @"Journalism";
                break;
            case CLPhotoCategoryLandscapes:
                categoryName = @"Landscapes";
                break;
            case CLPhotoCategoryMacro:
                categoryName = @"Macro";
                break;
            case CLPhotoCategoryNature:
                categoryName = @"Nature";
                break;
            case CLPhotoCategoryNude:
                categoryName = @"Nude";
                break;
            case CLPhotoCategoryPeople:
                categoryName = @"People";
                break;
            case CLPhotoCategoryPerformingArts:
                categoryName = @"Performing Arts";
                break;
            case CLPhotoCategorySport:
                categoryName = @"Sport";
                break;
            case CLPhotoCategoryStillLife:
                categoryName = @"Still Life";
                break;
            case CLPhotoCategoryStreet:
                categoryName = @"Street";
                break;
            case CLPhotoCategoryTransportation:
                categoryName = @"Transportation";
                break;
            case CLPhotoCategoryTravel:
                categoryName = @"Travel";
                break;
            case CLPhotoCategoryUncategorized:
                categoryName = @"Uncategorized";
                break;
            case CLPhotoCategoryUnderwater:
                categoryName = @"Underwater";
                break;
            case CLPhotoCategoryUrbanExploration:
                categoryName = @"Urban Exploration";
                break;
            case CLPhotoCategoryWedding:
                categoryName = @"Wedding";
                break;
        }
        
        return categoryName;
}

+ (NSArray *)allCategories
{
    NSMutableArray *categories = [NSMutableArray new];
    for (int catID = 0; catID < 28; catID++)
    {
        CLPhotoCategory *category = [[CLPhotoCategory alloc]initWithID:catID];
        [categories addObject:category];
    }
    
    return categories;
}


@end
