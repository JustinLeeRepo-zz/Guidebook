//
//  Guide.m
//  Guidebook
//
//  Created by Justin Lee on 6/7/16.
//  Copyright © 2016 Justin Lee. All rights reserved.
//

#import "Guide.h"

@interface Guide ()

@end

@implementation Guide

#pragma mark - init

- (void)initGuide:(NSString *)startDate withEndDate:(NSString *)endDate withName:(NSString *)name withUrl:(NSURL *)url withVenue:(NSDictionary *)venue withObjType:(NSString *)objType withNSUrl:(NSURL *)iconUrl {
	self.startDate = startDate;
	self.endDate = endDate;
	self.name = name;
	self.url = url;
	self.city = [venue objectForKey:@"city"];
	self.state = [venue objectForKey:@"state"];
	self.objType = objType;
	self.iconUrl = iconUrl;
}

@end