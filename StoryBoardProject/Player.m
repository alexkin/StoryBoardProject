//
//  Player.m
//  StoryBoardProject
//
//  Created by ming on 13-5-30.
//  Copyright (c) 2013年 ming. All rights reserved.
//

#import "Player.h"

@implementation Player
@synthesize name;
@synthesize psd;
@synthesize lev;


-(void)dealloc
{
    name=nil;
    psd=nil;
    [super dealloc];
}
@end
