//
//  AppDelegate.h
//  REST Easy
//
//  Created by John Bohn on 8/19/12.
//  Copyright (c) 2012 John Bohn. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class SMLSyntaxColouring;

@interface AppDelegate : NSObject <NSApplicationDelegate, NSURLConnectionDataDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *url;
@property (weak) IBOutlet NSComboBox *method;
@property (weak) IBOutlet NSButton *followRedirect;
@property (unsafe_unretained) IBOutlet NSTextView *result;
@property (assign) SMLSyntaxColouring *syntaxColoring;

- (IBAction)send:(id)sender;

@end
