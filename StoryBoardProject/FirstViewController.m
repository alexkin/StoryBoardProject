//
//  FirstViewController.m
//  StoryBoardProject
//
//  Created by ming on 13-6-3.
//  Copyright (c) 2013年 ming. All rights reserved.
//

#import "FirstViewController.h"
#import <PassKit/PassKit.h>
@interface FirstViewController ()<UITableViewDataSource,UITableViewDelegate,PKAddPassesViewControllerDelegate>
{
    NSMutableArray *_passlist;
}

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // 1 initialize objects
    _passlist = [[NSMutableArray alloc] init];
    
    //2 load the passes from the resource folder
    NSString* resourcePath =
    [[NSBundle mainBundle] resourcePath];
    
    NSArray* passFiles = [[NSFileManager defaultManager]
                          contentsOfDirectoryAtPath:resourcePath
                          error:nil];
    
    //3 loop over the resource files
    for (NSString* passFile in passFiles) {
        if ( [passFile hasSuffix:@".pkpass"] ) {
            [_passlist addObject: passFile];
        }
    }
	// Do any additional setup after loading the view.

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_passTable release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setPassTable:nil];
    [super viewDidUnload];
}
#pragma datasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _passlist.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    NSString *object = _passlist[indexPath.row];
    cell.textLabel.text = object;
    return cell;
}

#pragma delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{   //1
    NSString* passName = _passlist[indexPath.row];
    [self openPassWithName:passName];
}

-(void)openPassWithName:(NSString*)name
{
    //2
    NSString* passFile = [[[NSBundle mainBundle] resourcePath]
                          stringByAppendingPathComponent: name];
    
    //3
    NSData *passData = [NSData dataWithContentsOfFile:passFile];
    
    //4
    NSError* error = nil;
    PKPass *newPass = [[PKPass alloc] initWithData:passData
                                             error:&error];
    //5
    if (error!=nil) {
        [[[UIAlertView alloc] initWithTitle:@"Passes error"
                                    message:[error
                                             localizedDescription]
                                   delegate:nil
                          cancelButtonTitle:@"Ooops"
                          otherButtonTitles: nil] show];
        return;
    }
    
    //6
    PKAddPassesViewController *addController =[[PKAddPassesViewController alloc] initWithPass:newPass];
    addController.delegate = self;
    [self presentViewController:addController
                       animated:YES
                     completion:nil];
}

#pragma mark - Pass controller delegate

-(void)addPassesViewControllerDidFinish: (PKAddPassesViewController*) controller
{
    //pass added
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end


