//
//  MFCalendarCellConfiguration.m
//  MFCalendar
//
//  Created by Matteo Fiandesio on 1/17/13.
//  Copyright (c) 2013 Matteo Fiandesio. All rights reserved.
//

#import "MFCalendarCellConfiguration.h"

@implementation MFCalendarCellConfiguration

@synthesize backgroundColor = _backgroundColor;
@synthesize titleColor = _titleColor;
@synthesize selectable = _selectable;


-(id)initWithTextColor:(UIColor *)textColor backgroundColor:(UIColor *)bgColor selectable:(BOOL)selectable{
    self = [super init];
    if(self){
        _titleColor = textColor;
        _backgroundColor = bgColor;
        _selectable = selectable;
    }
    return self;
}

+(id)defaultConf{
    return [[MFCalendarCellConfiguration alloc] initWithTextColor:[UIColor blackColor] backgroundColor:[UIColor whiteColor] selectable:YES];
}
@end
