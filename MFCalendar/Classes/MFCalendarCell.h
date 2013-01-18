//
//  MFCalendarCell.h
//  MFCalendar
//
//  Created by Matteo Fiandesio on 1/17/13.
//  Copyright (c) 2013 Matteo Fiandesio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MFCalendarCellConfiguration.h"
@interface MFCalendarCell : UIButton 

@property(nonatomic) NSUInteger day;

@property(nonatomic,strong) MFCalendarCellConfiguration * configuration;



@end
