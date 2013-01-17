//
//  MFCalendarView.m
//  MFCalendar
//
//  Created by Matteo Fiandesio on 1/16/13.
//  Copyright (c) 2013 Matteo Fiandesio. All rights reserved.
//

#import "MFCalendarView.h"


@interface MFCalendarView()

-(NSUInteger) currentMonth;
@end


@implementation MFCalendarView

static const CGFloat kGridMargin = 6;

@synthesize dayBackgroundColor = _dayBackgroundColor;
@synthesize highlightedDaysBackground = _highlightedDaysBackground;
@synthesize headerBackgroundColor = _headerBackgroundColor;
@synthesize prevMonthButton = _prevMonthButton;
@synthesize nextMonthButton = _nextMonthButton;
@synthesize cells = _cells;
@synthesize highlightedDaysCache = _highlightedDaysCache;

@synthesize calendar = _calendar;
@synthesize currentDate = _currentDate;

@synthesize onDayDraw = _onDayDraw;

- (NSUInteger) currentMonth {
    NSDateComponents *components = [self.calendar components: NSMonthCalendarUnit
                                                    fromDate: self.currentDate];
    
    return components.month;
}

- (NSUInteger) currentYear {
    NSDateComponents *components = [self.calendar components: NSYearCalendarUnit
                                                    fromDate: self.currentDate];
    return components.year;
}




-(NSDate*)currentDate {
    if(!_currentDate){
        _currentDate = [NSDate new];
    }
    return _currentDate;
}

-(NSDate*)displayedMonthStartDate {
    NSDateComponents *components = [self.calendar components: NSMonthCalendarUnit|NSYearCalendarUnit
                                                    fromDate: self.currentDate];
    components.day = 1;
    return [self.calendar dateFromComponents: components];
}

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        _currentDate = [NSDate new];
        _calendar = [NSCalendar currentCalendar];
    }
    return self;
}
-(id)initWithStartDate:(NSDate*)startDate{
    self = [super initWithFrame:CGRectMake(0,0,280,200)];
    if(self){
        _currentDate = startDate;
        _calendar = [NSCalendar currentCalendar];
    }
    return self;
}

-(void)onChangeDateFrom:(NSDate *) from to:(NSDate *) to {
    self.currentDate = to;
    
}

-(void)onChangeDateFrom:(NSDate *) from to:(NSDate *) to highlightingDays:(NSArray*) days{
    
    self.currentDate = to;

}

-(void)addMonth{
    NSDateComponents *monthStep = [NSDateComponents new];
    monthStep.month = 1;
    self.currentDate = [self.calendar dateByAddingComponents: monthStep toDate: self.currentDate options: 0];
    [self setNeedsLayout];
}

-(void)subMonth{
    NSDateComponents *monthStep = [NSDateComponents new];
    monthStep.month = -1;
    self.currentDate = [self.calendar dateByAddingComponents: monthStep toDate: self.currentDate options: 0];
    [self setNeedsLayout];
}

-(void)layoutSubviews {
    
    CGRect headerRect = CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, 40);
    UIView * header = [[UIView alloc] initWithFrame:headerRect];
    
    
    UIButton * prevMonth = [UIButton buttonWithType:UIButtonTypeCustom];
    prevMonth.frame = CGRectMake(0,0,40,40);
    [prevMonth setTitle:@"<<" forState:UIControlStateNormal];
    prevMonth.titleLabel.textColor = [UIColor whiteColor];
    
    
    [prevMonth addTarget:self action:@selector(subMonth) forControlEvents:UIControlEventTouchDown];
    
    
    prevMonth.backgroundColor = [UIColor blackColor];
    [header addSubview:prevMonth];
    
    UILabel * monthLabel = [[UILabel alloc] init];
    NSString *monthName = [[[NSDateFormatter new] standaloneMonthSymbols] objectAtIndex: self.currentMonth - 1];
    monthLabel.text = [NSString  stringWithFormat:@"%@ / %d",monthName,[self currentYear]];
    
    monthLabel.frame = CGRectMake(40, 0, self.bounds.size.width-80, 40);
    [header addSubview:monthLabel];
    
    
    header.backgroundColor = self.headerBackgroundColor ? self.headerBackgroundColor : [UIColor yellowColor];
    [self addSubview:header];
    
    UIButton * nextMonth = [UIButton buttonWithType:UIButtonTypeCustom];
    nextMonth.frame = CGRectMake(CGRectGetMaxX(monthLabel.bounds)+40,0,40,40);
    [nextMonth setTitle:@">>" forState:UIControlStateNormal];
    nextMonth.titleLabel.textColor = [UIColor whiteColor];
    nextMonth.backgroundColor = [UIColor blackColor];
    
    [nextMonth addTarget:self action:@selector(addMonth) forControlEvents:UIControlEventTouchDown];
    [header addSubview:nextMonth];
    
    
    
    CGRect calendarViewFrame = CGRectMake(self.bounds.origin.x, self.bounds.origin.y + CGRectGetMaxY(headerRect), self.bounds.size.width, self.bounds.size.height - CGRectGetHeight(headerRect));
    
    calendarGridView = [[UIView alloc] initWithFrame:calendarViewFrame];
    calendarGridView.backgroundColor = [UIColor clearColor];
    [self addSubview:calendarGridView];
    
    NSDateComponents *components = [self.calendar components: NSWeekdayCalendarUnit
                                                    fromDate: [self displayedMonthStartDate]];
    NSInteger shift = components.weekday - self.calendar.firstWeekday;
    if (shift < 0) {
        shift = 7 + shift;
    }
    
    // Calculate range
    NSRange range = [self.calendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit
                                       forDate:self.currentDate];
    CGFloat cellHeight = (calendarGridView.bounds.size.height - kGridMargin * 2) / 6.0;
    CGFloat cellWidth = (calendarGridView.bounds.size.width - kGridMargin * 2) / 7.0;
    cellHeight = cellWidth = MIN(cellWidth,cellHeight);
    for (NSUInteger i = 0; i < [self.cells count]; ++i) {
        UILabel *cellView = [self.cells objectAtIndex:i];
        cellView.frame = CGRectMake(cellWidth * (((shift + i) % 7))+kGridMargin, cellHeight * ((shift + i) / 7) + kGridMargin,
                                    cellWidth, cellHeight);
        NSLog(@"%@", CGRectCreateDictionaryRepresentation(cellView.frame));
        cellView.hidden = i >= range.length;
        
    }
    
}

- (NSArray *) cells {
    if(!_cells){
        NSMutableArray *cells = [NSMutableArray array];
        for (NSUInteger i = 1; i <= 31; ++i) {
            MFCalendarCell *cell = [MFCalendarCell new];
            cell.backgroundColor = [UIColor whiteColor];
            cell.day = i;
            [cell setTitleColor: [UIColor redColor] forState:UIControlStateNormal];
            //[cell addTarget: self
            //         action: @selector(touchedCellView:)
           //forControlEvents: UIControlEventTouchUpInside];
            [cells addObject:cell];
            if(self.onDayDraw){
                NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
                [formatter setDateFormat:@"dd/MM/yyyy"];
                NSDate * d = [formatter dateFromString:[NSString stringWithFormat:@"%d/%d/%d",i,[self currentMonth],[self currentYear]]];
                self.onDayDraw(d,cell);
            }
            [calendarGridView addSubview: cell];
        }
        _cells = cells;
    }
    
    return _cells;
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
