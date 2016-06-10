//
//  Guide.h
//  Guidebook
//
//  Created by Justin Lee on 6/7/16.
//  Copyright © 2016 Justin Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface Guide : NSObject

@property (strong, nonatomic) NSString *startDate;
@property (strong, nonatomic) NSString *endDate;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSURL *url;
//@property (strong, nonatomic) NSDictionary *venue;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *state;
@property (strong, nonatomic) NSString *objType;
@property (strong, nonatomic) NSURL *iconUrl;

- (void)initGuide:(NSString *)startDate withEndDate:(NSString *)endDate withName:(NSString *)name withUrl:(NSURL *)url withVenue:(NSDictionary *)url withObjType:(NSString *)objType withNSUrl:(NSURL *)iconUrl;

@end