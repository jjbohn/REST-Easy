//
//  AppDelegate.m
//  REST Easy
//
//  Created by John Bohn on 8/19/12.
//  Copyright (c) 2012 John Bohn. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
@synthesize url;
@synthesize method;
@synthesize followRedirect;
@synthesize result;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (IBAction)send:(id)sender {
    NSURL *aUrl = [NSURL URLWithString:[self.url stringValue]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL: aUrl];
    
    [request setHTTPMethod:[self.method stringValue]];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [self.result setString:@"Loading..."];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Fail: %@", [error localizedDescription]);
    [self.result setString:@""];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"Good");

}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    [self.result setEditable:TRUE];
    
    if ([[[self.result textStorage] string] isEqualToString:@"Loading..."]) {
        [self.result setString:@""];
    }
    
    [self.result insertText:str];
    [self.result setEditable:FALSE];
}

@end
