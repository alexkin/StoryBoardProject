//
//  PasswordViewController.h
//  StoryBoardProject
//
//  Created by ming on 13-5-30.
//  Copyright (c) 2013年 ming. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PasswordViewController;
@protocol PasswordSelectDelegate <NSObject>

-(void)passwordvc:(PasswordViewController *)pwdvc didselectPwd:(NSString *) pwd;

@end
@interface PasswordViewController : UITableViewController

{
        NSArray *passwords;
}
@property(nonatomic,retain)NSArray *passwords;
@property(nonatomic,assign)id <PasswordSelectDelegate> pwddelegate;
@property(nonatomic,assign) NSString *pwdselected;
@end
