//
//  BlogPost.m
//  BlogReader
//
//  Created by admin on 14/8/18.
//  Copyright (c) 2014年 YEHKUO. All rights reserved.
//

#import "BlogPost.h"

@implementation BlogPost

- (id) initWithTitle:(NSString *)title {
   // self = [super init];
    
    if (self) {
        
     self.title = title;
   //  self.thumbnail = nil;
    }
    return self;
}

+ (id) blogPostWithTitle:(NSString *)title {
    return [[self alloc]initWithTitle:title];
}

-(NSURL *) thumbnailURL {
    
    //NSLog(@"%@", [self.thumbnail class]);
    return [NSURL URLWithString:self.thumbnail];
}

-(NSString *) formattedDate {
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc]init];
    [dateformatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *tmpdate = [dateformatter dateFromString:self.date];
    [dateformatter setDateFormat:@"EE MMM,dd"];
    return [dateformatter stringFromDate:tmpdate];
}

@end
