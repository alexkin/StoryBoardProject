//
//  CustomCell.m
//  StoryBoardProject
//
//  Created by ming on 13-5-30.
//  Copyright (c) 2013年 ming. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell
@synthesize nametextlab;
@synthesize psdtextlab;
@synthesize levimgview;
-(void)dealloc
{
    nametextlab=nil;
    psdtextlab=nil;
    levimgview=nil;
    [super dealloc];
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
