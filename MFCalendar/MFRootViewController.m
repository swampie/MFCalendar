//
//  MFRootViewController.m
//  MFCalendar
//
//  Created by Matteo Fiandesio on 1/16/13.
//  Copyright (c) 2013 Matteo Fiandesio. All rights reserved.
//

#import "MFRootViewController.h"

@interface MFRootViewController ()

@end

@implementation MFRootViewController

@synthesize calView = _calView;
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
    
    self.calView = [[MFCalendarView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    self.calView.backgroundColor = [UIColor redColor];
    self.calView.onDayDraw = ^(NSDate* d,MFCalendarCell * cell){
        NSDateComponents *components = [[NSCalendar currentCalendar] components: NSDayCalendarUnit
                                                        fromDate: d];
        
        NSUInteger day = components.day;
        if(day>10 && day < 20){
            [cell setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            [cell setBackgroundColor:[UIColor greenColor]];
        }
    };
    [self.view addSubview:self.calView];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
