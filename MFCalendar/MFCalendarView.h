//
//  MFCalendarView.h
//  MFCalendar
//
//  Created by Matteo Fiandesio on 1/16/13.
//  Copyright (c) 2013 Matteo Fiandesio. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^OnDayDraw)(NSCalendar * day);

@protocol MFCalendarDelegate
-(void) onDaySelect:(NSCalendar *)day;
@end


@interface MFCalendarView : UIView

#pragma mark Configuration

@property(nonatomic,strong) UIColor * backgroundColor;
@property(nonatomic,strong) UIColor * dayBackgroundColor;
@property(nonatomic,strong) UIColor * highlightedDays;
@property(nonatomic,strong) UIColor * headerBackgroundColor;
@property(nonatomic,strong) UIImage * prevMonthButton;
@property(nonatomic,strong) UIImage * nextMonthButton;

@property(nonatomic,strong) NSDictionary * highlightedDayCache;

@property(nonatomic,strong) NSCalendar * startDate;
@property(nonatomic,strong) NSCalendar * currentDate;


-(void)initWithStartDate:(NSCalendar*)startDate;


-(void)onChangeMonthFrom:(int) from to:(int) to;
-(void)onChangeMonthFrom:(int) from to:(int) to highlightingDays:(NSArray *) daysToHighlight;






@end
