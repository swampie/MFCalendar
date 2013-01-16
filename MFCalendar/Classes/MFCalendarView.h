//
//  MFCalendarView.h
//  MFCalendar
//
//  Created by Matteo Fiandesio on 1/16/13.
//  Copyright (c) 2013 Matteo Fiandesio. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^OnDayDraw)(NSCalendar * day);

@protocol MFCalendarViewDelegate
-(void) onDaySelect:(NSCalendar *)day;
@end


@interface MFCalendarView : UIView

#pragma mark Configuration







@property(nonatomic,strong) UIColor * dayBackgroundColor;
@property(nonatomic,strong) UIColor * highlightedDaysBackground;
@property(nonatomic,strong) UIColor * headerBackgroundColor;
@property(nonatomic,strong) UIImage * prevMonthButton;
@property(nonatomic,strong) UIImage * nextMonthButton;

@property(nonatomic,strong) NSDictionary * highlightedDaysCache;

@property(nonatomic,strong) NSCalendar * startDate;
@property(nonatomic,strong) NSCalendar * currentDate;


-(id)initWithStartDate:(NSCalendar*)startDate;

-(void)onChangeDateFrom:(NSCalendar *) from to:(NSCalendar *) to;

-(void)onChangeDateFrom:(NSCalendar *) from to:(NSCalendar *) to highlightingDays:(NSArray *) daysToHighlight;






@end
