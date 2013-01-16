//
//  MFCalendarView.m
//  MFCalendar
//
//  Created by Matteo Fiandesio on 1/16/13.
//  Copyright (c) 2013 Matteo Fiandesio. All rights reserved.
//

#import "MFCalendarView.h"

@implementation MFCalendarView


@synthesize dayBackgroundColor = _dayBackgroundColor;
@synthesize highlightedDaysBackground = _highlightedDaysBackground;
@synthesize headerBackgroundColor = _headerBackgroundColor;
@synthesize prevMonthButton = _prevMonthButton;
@synthesize nextMonthButton = _nextMonthButton;

@synthesize highlightedDaysCache = _highlightedDaysCache;

@synthesize startDate = _startDate;
@synthesize currentDate = _currentDate;

-(NSCalendar*)currentDate {
    if(!_currentDate){
        _currentDate = [[NSCalendar alloc] init];
    }
    return _currentDate;
}


-(id)initWithStartDate:(NSCalendar*)startDate{
    self = [super initWithFrame:CGRectMake(0,0,300,300)];
    if(self){
        _currentDate = startDate;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)onChangeDateFrom:(NSCalendar *) from to:(NSCalendar *) to {
    self.currentDate = to;
    
}

-(void)onChangeDateFrom:(NSCalendar *) from to:(NSCalendar *) to highlightingDays:(NSArray*) days{
    
    self.currentDate = to;

}

-(void)layoutSubviews {
    
    CGRect headerRect = CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, 40);
    UIView * header = [[UIView alloc] initWithFrame:headerRect];
    header.backgroundColor = self.headerBackgroundColor ? self.headerBackgroundColor : [UIColor yellowColor];
    [self addSubview:header];

    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
