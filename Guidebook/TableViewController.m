//
//  ViewController.m
//  Guidebook
//
//  Created by Justin Lee on 6/7/16.
//  Copyright © 2016 Justin Lee. All rights reserved.
//

#import "TableViewController.h"
#import <AFNetworking.h>
#import "Guide.h"
#import "TableViewCell.h"

@interface TableViewController ()

@end

@implementation TableViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	self.view.backgroundColor = [UIColor whiteColor];
	self.dictionaryKeyArray = [[NSMutableArray alloc] init];
	self.guideSectionDictionary = [[NSMutableDictionary alloc] init];
	[self.tableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"GuideIdentifier"];
	[self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];

	
	AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
	[manager GET:@"https://www.guidebook.com/service/v2/upcomingGuides/" parameters:nil progress:nil success:^(NSURLSessionTask *task, NSArray *responseObject){
//		NSLog(@"HTTP REQUEST SUCCESS %@", responseObject);
		dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^(void){
			[self parseData:(NSDictionary *)responseObject];
		});
	} failure:^(NSURLSessionTask *operation, NSError *error){
		NSLog(@"HTTP GET REQUEST FAILED %@", error);
		return;
	}];
}

#pragma mark - Data Parse

- (void)parseData:(NSDictionary *)response {
	for (NSDictionary *dict in [response objectForKey:@"data"]) {
		
		NSString *startDate = [dict objectForKey:@"startDate"];
		NSString *endDate = [dict objectForKey:@"endDate"];
		NSString *name = [dict objectForKey:@"name"];
		NSURL *url = [dict objectForKey:@"url"];
		NSDictionary *venue = [dict objectForKey:@"venue"];
		NSString *objType = [dict objectForKey:@"objType"];
		NSURL *iconUrl = [dict objectForKey:@"icon"];
		
		
		
		Guide *guide = [[Guide alloc] init];
		[guide initGuide:startDate withEndDate:endDate withName:name withUrl:url withVenue:venue withObjType:objType withNSUrl:iconUrl];
		NSMutableArray *sectionArray = [self.guideSectionDictionary objectForKey:startDate] != nil ? [self.guideSectionDictionary objectForKey:startDate] : [[NSMutableArray alloc] init];
		[sectionArray addObject:guide];
		
		[self.guideSectionDictionary setObject:sectionArray forKey:startDate];
	}
	
	dispatch_async(dispatch_get_main_queue(), ^{
		self.dictionaryKeyArray = [self.guideSectionDictionary allKeys];
		NSSortDescriptor *sd = [[NSSortDescriptor alloc] initWithKey:nil ascending:YES];
		self.dictionaryKeyArray = [self.dictionaryKeyArray sortedArrayUsingDescriptors:@[sd]];
		[self.tableView reloadData];
	});
}

#pragma mark - TableView Delegate / DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
	return self.guideSectionDictionary.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	NSString *key = [self.dictionaryKeyArray objectAtIndex:section];
	return ((NSArray *)[self.guideSectionDictionary objectForKey:key]).count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	NSInteger row = [indexPath row];
	NSInteger section = [indexPath section];
	static NSString *CellIdentifier = @"GuideIdentifier";
	TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

	
	if (cell == nil) {
		cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
	}
	NSString *sectionDate = [self.dictionaryKeyArray objectAtIndex:section];
	NSArray *guidePerSection = [self.guideSectionDictionary objectForKey:sectionDate];
	
	Guide *guide = [guidePerSection  objectAtIndex:row];
	[cell setLabelText:guide.name withEndDate:guide.endDate withCity:guide.city withState:guide.state];
	return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
	UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 15)];
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, tableView.frame.size.width, 15)];
	[label setFont:[UIFont boldSystemFontOfSize:12]];
	NSString *string = [self.dictionaryKeyArray objectAtIndex:section];
	[label setText:string];
	[view addSubview:label];
	[view setBackgroundColor:[UIColor grayColor]];
	
	return view;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}


#pragma mark - Memory Management

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
