//
//  webViewController.m
//  BlogReader
//
//  Created by admin on 14/8/18.
//  Copyright (c) 2014年 YEHKUO. All rights reserved.
//

#import "webViewController.h"


@interface webViewController ()

@end

@implementation webViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
   
    /* use defalut webpage
    NSURL *url = [NSURL URLWithString:@"https://www.google.com"];     */

    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:self.blogPostURL];
    [self.webView loadRequest:urlRequest];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
