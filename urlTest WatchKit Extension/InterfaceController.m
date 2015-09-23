//
//  InterfaceController.m
//  urlTest WatchKit Extension
//

#import "InterfaceController.h"


@interface InterfaceController()

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (void)speedTest
{
    NSString *urlServerString = @"https://www.apple.com";
    //NSString *urlServerString = @"https://www.google.com";
    //NSString *urlServerString = @"https://www.facebook.com";
    
    NSString *urlString = [NSString stringWithFormat:@"%@?%d", urlServerString, arc4random_uniform(1000000000)];
    
    NSDate *start1 = [NSDate date];
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString: urlString] options:NSDataReadingUncached error:nil];
    NSDate *end1 = [NSDate date];
    
    CGFloat runTime1 = [end1 timeIntervalSinceDate:start1];
    
    [self.dataTime setText:[NSString stringWithFormat:@"%.3fs", runTime1]];
    
    
    /// NSURLSession
    urlString = [NSString stringWithFormat:@"%@?%d",urlServerString, arc4random_uniform(1000000000)];
    NSURL * url = [NSURL URLWithString: urlString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                                       timeoutInterval:1];

    NSURLSession *session = [NSURLSession sharedSession];
    
    NSDate *start2 = [NSDate date];

    __weak typeof (self)weakSelf = self;
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
                                          {
                                              NSDate *end2 = [NSDate date];
                                              CGFloat runTime2 = [end2 timeIntervalSinceDate:start2];
                                              
                                              [weakSelf.urlTime setText:[NSString stringWithFormat:@"%.3fs", runTime2]];
                                          }];
        
        [dataTask resume];
}

- (IBAction) onTestBtn:(id)sender
{
    [self speedTest];
}


@end