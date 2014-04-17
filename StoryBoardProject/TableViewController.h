//
//  TableViewController.h
//  StoryBoardProject
//
//  Created by ming on 13-5-30.
//  Copyright (c) 2013年 ming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddPlayerViewController.h"
@interface TableViewController : UITableViewController<AddPlayerDelegate>
@property(retain,nonatomic)NSMutableArray *players;
@end
