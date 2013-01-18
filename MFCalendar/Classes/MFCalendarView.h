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
-(void) onDaySelect:(NSDate *)day;

@end

typedef void(^dayDraw)(NSDate * day,MFCalendarCell * cell);
typedef void(^dateChange)(NSDate* from,NSDate * to);
@interface MFCalendarView : UIView {
    UIView* calendarGridView;
    dayDraw onDayDraw;
    NSArray * cells;
}

#pragma mark Configuration

@property(nonatomic,strong) UIColor * dayBackgroundColor;
@property(nonatomic,strong) UIColor * highlightedDaysBackground;
@property(nonatomic,strong) UIColor * headerBackgroundColor;
@property(nonatomic,strong) UIImage * prevMonthButton;
@property(nonatomic,strong) UIImage * nextMonthButton;

@property(nonatomic,strong) NSMutableDictionary * highlightedDaysCache;


@property(nonatomic,weak) id<MFCalendarViewDelegate> delegate;
@property(nonatomic,strong) NSCalendar * calendar;
@property(nonatomic,strong) NSDate * currentDate;

@property(nonatomic,copy) dayDraw onDayDraw;
@property(nonatomic,copy) dateChange onDateChange;


-(id)initWithStartDate:(NSDate*)startDate;
-(void)onChangeDateFrom:(NSDate *) from to:(NSDate *) to;

-(void)addToHighlightedDay:(NSString*) date configuration:(MFCalendarCellConfiguration *) configuration;

@end
