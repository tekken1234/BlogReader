//
//  webViewController.h
//  BlogReader
//
//  Created by admin on 14/8/18.
//  Copyright (c) 2014年 YEHKUO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface webViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) NSURL *blogPostURL;

@end
