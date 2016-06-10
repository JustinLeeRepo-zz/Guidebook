//
//  TableViewCell.h
//  Guidebook
//
//  Created by Justin Lee on 6/7/16.
//  Copyright © 2016 Justin Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface TableViewCell : UITableViewCell

@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UILabel *substringLabel;

-(void)setLabelText:(NSString *)name withEndDate:(NSString *)endDate withCity:(NSString *)city withState:(NSString *)state;

@end
