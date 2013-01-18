//
//  MFCalendarCellConfiguration.h
//  MFCalendar
//
//  Created by Matteo Fiandesio on 1/17/13.
//  Copyright (c) 2013 Matteo Fiandesio. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MFCalendarCellConfiguration : NSObject

@property(nonatomic,strong) UIColor * backgroundColor;
@property(nonatomic,strong) UIColor * titleColor;
@property BOOL selectable;

-(id) initWithTextColor:(UIColor *) textColor
          backgroundColor: (UIColor *) bgColor
        selectable:(BOOL)selectable;

+(id) defaultConf;



@end
