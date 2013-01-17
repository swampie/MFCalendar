//
//  MFCalendarCell.m
//  MFCalendar
//
//  Created by Matteo Fiandesio on 1/17/13.
//  Copyright (c) 2013 Matteo Fiandesio. All rights reserved.
//

#import "MFCalendarCell.h"

@implementation MFCalendarCell

@synthesize day = _day;




- (NSUInteger) day {
    return _day;
}

- (void) setDay: (NSUInteger) day {
    if (_day != day) {
        _day = day;
        [self setTitle: [NSString stringWithFormat: @"%d", _day] forState: UIControlStateNormal];
    }
}

@end
