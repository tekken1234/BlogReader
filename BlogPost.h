//
//  BlogPost.h
//  BlogReader
//
//  Created by admin on 14/8/18.
//  Copyright (c) 2014年 YEHKUO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlogPost : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *thumbnail;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSURL *url;

// Designated Initializer
- (id) initWithTitle:(NSString *)title;
+ (id) blogPostWithTitle:(NSString *)title;

-(NSURL *) thumbnailURL;
-(NSString *) formattedDate;

@end
