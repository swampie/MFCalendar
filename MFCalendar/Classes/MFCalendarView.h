//
//  MFCalendarView.h
//  MFCalendar
//
//  Created by Matteo Fiandesio on 1/16/13.
//  Copyright (c) 2013 Matteo Fiandesio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "MFCalendarCell.h"

#import "MFCalendarCellConfiguration.h"
@protocol MFCalendarViewDelegate
-(void) onDaySelect:(NSCalendar *)day;
@end

typedef void(^dayDraw)(NSDate * day,MFCalendarCell * cell);
@interface MFCalendarView : UIView {
    UIView* calendarGridView;
    dayDraw onDayDraw;
}

#pragma mark Configuration

@property(nonatomic,strong) UIColor * dayBackgroundColor;
@property(nonatomic,strong) UIColor * highlightedDaysBackground;
@property(nonatomic,strong) UIColor * headerBackgroundColor;
@property(nonatomic,strong) UIImage * prevMonthButton;
@property(nonatomic,strong) UIImage * nextMonthButton;
@property(nonatomic,strong) NSArray * cells;
@property(nonatomic,strong) NSDictionary * highlightedDaysCache;

@property(nonatomic,strong) NSCalendar * calendar;
@property(nonatomic,strong) NSDate * currentDate;

@property(nonatomic,copy) dayDraw onDayDraw;

-(id)initWithStartDate:(NSDate*)startDate;
-(void)onChangeDateFrom:(NSDate *) from to:(NSDate *) to;




-(void)onChangeDateFrom:(NSDate *) from to:(NSDate *) to highlightingDays:(NSArray *) daysToHighlight;



@end
