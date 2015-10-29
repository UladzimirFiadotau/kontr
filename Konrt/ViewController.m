//
//  ViewController.m
//  Konrt
//
//  Created by Admin on 29.10.15.
//  Copyright (c) 2015 DreamTeam. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController () {
    int current_index;
}
@property NSMutableArray* jokes;
@property (weak, nonatomic) IBOutlet UILabel *labelJoke;
@property (weak, nonatomic) IBOutlet UIButton *buttonPrev;
@property (weak, nonatomic) IBOutlet UIButton *buttonNext;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    current_index = 0;
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    _jokes = [appDelegate jokes];
    [self updateState];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonNextTouchDown:(id)sender {
    current_index++;
    [self updateState];
}

- (IBAction)buttonPrevTouchDown:(id)sender {
    current_index--;
    [self updateState];
}

- (void)updateState {
    if (current_index == 0)
        [_buttonPrev setHidden:true];
    else
        [_buttonPrev setHidden:false];
    if ((current_index + 1) == [_jokes count])
        [_buttonNext setHidden:true];
    else
        [_buttonNext setHidden:false];
    [_labelJoke setText:[_jokes objectAtIndex:current_index]];
    
}

@end
