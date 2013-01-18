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
@synthesize configuration = _configuration;

- (NSUInteger) day {
    return _day;
}

-(MFCalendarCellConfiguration*)configuration{
    if(!_configuration){
        _configuration = [MFCalendarCellConfiguration defaultConf];
    }
    return _configuration;
}

-(void)setConfiguration:(MFCalendarCellConfiguration *)configuration{
    _configuration = configuration;
    [self conf];
}


- (void) setDay: (NSUInteger) day {
    if (_day != day) {
        _day = day;
    }
    [self setTitle:[NSString stringWithFormat:@"%d",day]forState:UIControlStateNormal] ;
}

+(id) new{
    id ret = [[MFCalendarCell alloc] init];
    [ret conf];
    return ret;
}

-(void) conf{
    [self setTitleColor:self.configuration.titleColor forState:UIControlStateNormal];
    self.titleLabel.textColor = self.configuration.titleColor;
    [self setBackgroundColor:self.configuration.backgroundColor];
}


-(id) initWithConfiguration:(MFCalendarCellConfiguration*) configuration{
    self = [super init];
    if(self){
        _configuration = configuration;
        [self conf];
    }
    
    return self;
    
}



@end
