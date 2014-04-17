//
//  AddPlayerViewController.h
//  StoryBoardProject
//
//  Created by ming on 13-5-30.
//  Copyright (c) 2013年 ming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"
#import "PasswordViewController.h"
//委托代理方法
@class AddPlayerViewController;
@protocol AddPlayerDelegate <NSObject>
-(void)addPlayerDidCancel:(AddPlayerViewController *)addplayervc;
-(void)addPlayerDidDone:(AddPlayerViewController *)addplayervc didAddPlayer:(Player *)player;
@end




@interface AddPlayerViewController : UITableViewController <PasswordSelectDelegate>
@property(nonatomic,assign)id<AddPlayerDelegate>adddelegate;
@property (retain, nonatomic) IBOutlet UITextField *nameText;
@property(retain,nonatomic)IBOutlet UILabel *passwordlab;



-(IBAction)addCancel:(id)sender;
-(IBAction)addDone:(id)sender;
@end
