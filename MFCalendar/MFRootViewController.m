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
        
    __block MFCalendarView* bView = self.calView;
    self.calView.onDateChange = ^(NSDate * from,NSDate * to){
        NSDateComponents * comps = [[NSCalendar currentCalendar] components: NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit
                                                    fromDate: to];
        
        NSUInteger month = comps.month;
        NSUInteger year = comps.year;
        NSString * intFormat = @"%d"
        ;
        MFCalendarCellConfiguration * conf = [[MFCalendarCellConfiguration alloc] initWithTextColor:[UIColor whiteColor]backgroundColor:[UIColor darkGrayColor] selectable:YES];
        
        
        NSString * monthS = [NSString stringWithFormat:intFormat,month];
        NSString * yearS = [NSString stringWithFormat:intFormat,year];
        if([[yearS substringFromIndex:3] isEqualToString:monthS]){
            for(int i=0;i<=2;i++){
                NSString * key = [NSString stringWithFormat:@"%d%d/0%d/%d",i,month-1,month,year];
                [bView addToHighlightedDay:key configuration:conf];
                
            }
        }
    [bView setNeedsLayout];
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
