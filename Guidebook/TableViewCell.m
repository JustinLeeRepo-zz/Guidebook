//
//  TableViewCell.m
//  Guidebook
//
//  Created by Justin Lee on 6/7/16.
//  Copyright © 2016 Justin Lee. All rights reserved.
//


#import "TableViewCell.h"

@interface TableViewCell()

@end

@implementation TableViewCell

#pragma mark - init

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
	if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
		[self setFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 60)];
		
		self.backgroundColor = [UIColor whiteColor];
		
		self.label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, [UIScreen mainScreen].bounds.size.width - 30, self.frame.size.height - 25)];
		[self.label setFont:[UIFont systemFontOfSize:17]];
		[self.label setTextColor:[UIColor blackColor]];
		[self.label setTextAlignment:NSTextAlignmentLeft];
		[self.label setNumberOfLines:1];
		
		self.substringLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, self.label.frame.origin.y + self.label.frame.size.height, [UIScreen mainScreen].bounds.size.width - 30, 25)];
		[self.substringLabel setFont:[UIFont systemFontOfSize:10]];
		[self.substringLabel setTextColor:[UIColor lightGrayColor]];
		[self.substringLabel setTextAlignment:NSTextAlignmentLeft];
		[self.substringLabel setNumberOfLines:1];
		
		[self addSubview:self.label];
		[self addSubview:self.substringLabel];
	}
	
	return self;
}

#pragma mark - Set Values

-(void)setLabelText:(NSString *)name withEndDate:(NSString *)endDate withCity:(NSString *)city withState:(NSString *)state {
	UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 1, self.frame.size.width, 1)];
	[bottomLine setBackgroundColor:[UIColor lightGrayColor]];
	[self addSubview:bottomLine];
	city = city != nil ? city : @"N/A";
	state = state != nil ? state : @"N/A";
	NSString *substring = [NSString stringWithFormat:@"Ends - %@ : %@, %@", endDate, city, state];

//if using only one uilabel to center both lines of text vertically, but then long names will extend past first lin
	
//	NSString *labelText = [NSString stringWithFormat:@"%@\n%@", name, substring];
//	NSDictionary *attribs = @{
//							  NSForegroundColorAttributeName: self.label.textColor,
//							  NSFontAttributeName: self.label.font
//							  };
//	
//	NSMutableAttributedString *attributedLabelText = [[NSMutableAttributedString alloc] initWithString:labelText attributes:attribs];
//	
//	UIColor *substringColor = [UIColor lightGrayColor];
//	UIFont *substringFont = [UIFont systemFontOfSize:10];
//	NSRange substringTextRange = [labelText rangeOfString:substring];
//	
//	[attributedLabelText setAttributes:@{
//										 NSForegroundColorAttributeName:substringColor,
//										 NSFontAttributeName: substringFont
//										 } range:substringTextRange];
//
	
	
	[self.label setText:name];
	[self.substringLabel setText:substring];
}


@end