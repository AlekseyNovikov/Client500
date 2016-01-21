//
//  CLPhotoCategory.m
//  Client500
//
//  Created by Aleksey Novikov on 21/01/16.
//  Copyright © 2016 Aleksey Novikov. All rights reserved.
//

#import "CLPhotoCategory.h"

@implementation CLPhotoCategory

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        self.categoryName = [dict[@"category"] integerValue];
        self.categoryStringName = [[self class] categoryStringNameForCategory:self.categoryName];
    }
    return self;
}


+ (NSString *)categoryStringNameForCategory:(CLPhotoCategoryName)categoryName
{
        NSString *categoryStringName;
        
        switch (categoryName) {
            case CLPhotoCategoryAbstract:
                categoryStringName = @"Abstract";
                break;
            case CLPhotoCategoryAnimals:
                categoryStringName = @"Animals";
                break;
            case CLPhotoCategoryBlackAndWhite:
                categoryStringName = @"Black and White";
                break;
            case CLPhotoCategoryCelbrities:
                categoryStringName = @"Celebrities";
                break;
            case CLPhotoCategoryCityAndArchitecture:
                categoryStringName = @"City and Architecture";
                break;
            case CLPhotoCategoryCommercial:
                categoryStringName = @"Commericial";
                break;
            case CLPhotoCategoryConcert:
                categoryStringName = @"Concert";
                break;
            case CLPhotoCategoryFamily:
                categoryStringName = @"Family";
                break;
            case CLPhotoCategoryFashion:
                categoryStringName = @"Fashion";
                break;
            case CLPhotoCategoryFilm:
                categoryStringName = @"Film";
                break;
            case CLPhotoCategoryFineArt:
                categoryStringName = @"Fine Art";
                break;
            case CLPhotoCategoryFood:
                categoryStringName = @"Food";
                break;
            case CLPhotoCategoryJournalism:
                categoryStringName = @"Journalism";
                break;
            case CLPhotoCategoryLandscapes:
                categoryStringName = @"Landscapes";
                break;
            case CLPhotoCategoryMacro:
                categoryStringName = @"Macro";
                break;
            case CLPhotoCategoryNature:
                categoryStringName = @"Nature";
                break;
            case CLPhotoCategoryNude:
                categoryStringName = @"Nude";
                break;
            case CLPhotoCategoryPeople:
                categoryStringName = @"People";
                break;
            case CLPhotoCategoryPerformingArts:
                categoryStringName = @"Performing Arts";
                break;
            case CLPhotoCategorySport:
                categoryStringName = @"Sport";
                break;
            case CLPhotoCategoryStillLife:
                categoryStringName = @"Still Life";
                break;
            case CLPhotoCategoryStreet:
                categoryStringName = @"Street";
                break;
            case CLPhotoCategoryTransportation:
                categoryStringName = @"Transportation";
                break;
            case CLPhotoCategoryTravel:
                categoryStringName = @"Travel";
                break;
            case CLPhotoCategoryUncategorized:
                categoryStringName = @"Uncategorized";
                break;
            case CLPhotoCategoryUnderwater:
                categoryStringName = @"Underwater";
                break;
            case CLPhotoCategoryUrbanExploration:
                categoryStringName = @"Urban Exploration";
                break;
            case CLPhotoCategoryWedding:
                categoryStringName = @"Wedding";
                break;
        }
        
        return categoryStringName;
}


@end
