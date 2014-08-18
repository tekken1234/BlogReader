//
//  TableViewController.m
//  BlogReader
//
//  Created by admin on 14/8/18.
//  Copyright (c) 2014年 YEHKUO. All rights reserved.
//

#import "TableViewController.h"
#import "BlogPost.h"
#import "webViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL *blogURL = [NSURL URLWithString:@"http://blog.teamtreehouse.com/api/get_recent_summary/"];
    NSData *jsonData = [NSData dataWithContentsOfURL:blogURL];
    
    NSError *error = nil;
    
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
   // NSLog(@"what dataDictionary looks like : %@", dataDictionary);
    if (error) {
        NSLog(@"error : %@", error);
    }
    else {
        
        // in case we dont know how many artical in the mutablearray, so just set it array
        self.blogPosts = [NSMutableArray array];
    
        // create a tmp array to store only post key from the dataDictionary
        NSArray *blogPostArray = [dataDictionary objectForKey:@"posts"];
       
        
        // loop thought blogPostArray and store to our BlogPost class
        for (NSDictionary *bpDictionary in blogPostArray) {
            BlogPost *blogPost = [BlogPost blogPostWithTitle:[bpDictionary objectForKey:@"title"]];
            blogPost.author = [bpDictionary objectForKey:@"author"];
            blogPost.thumbnail = [bpDictionary objectForKey:@"thumbnail"];
            blogPost.date = [bpDictionary objectForKey:@"date"];
            blogPost.url = [NSURL URLWithString:[bpDictionary objectForKey:@"url"]];
            
            // add info to Mutablearray to display
            [self.blogPosts addObject:blogPost];
        }

    // self.blogPosts = [dataDictionary objectForKey:@"post"];

    }
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [self.blogPosts count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
    
    if ([blogPost.thumbnail isKindOfClass:[NSString class]]){
        
        NSData *imageData = [NSData dataWithContentsOfURL:[blogPost thumbnailURL]];
        cell.imageView.image = [UIImage imageWithData:imageData];
    }
    else {
        cell.imageView.image = [UIImage imageNamed:@"AppIcon50X50.png"];
    }
    
    cell.textLabel.text = blogPost.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@",[blogPost author],
                                                                      [blogPost formattedDate]];
   return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   
    if ([segue.identifier isEqualToString:@"showBlog"]) {
      
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
        [segue.destinationViewController setBlogPostURL:blogPost.url];
        
       /* or type casting
          webViewController *wbc = (webViewController *)segue.destinationViewController;
          wbc.blogPostURL = blogPost.url;    */
    }
}

/*   BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
     // open in sarafi
     UIApplication *application = [UIApplication sharedApplication];
     [application openURL:blogPost.url]; } */
 
@end