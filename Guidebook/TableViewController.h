//
//  ViewController.h
//  Guidebook
//
//  Created by Justin Lee on 6/7/16.
//  Copyright © 2016 Justin Lee. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface TableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray *dictionaryKeyArray;
@property (strong, nonatomic) NSMutableDictionary *guideSectionDictionary;

@end

