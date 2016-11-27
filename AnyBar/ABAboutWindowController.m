//
//  ABAboutWindowController.m
//  AnyBar
//
//  Created by Niklas Berglund on 2016-11-28.
//

#import "ABAboutWindowController.h"

@interface ABAboutWindowController ()

@end

@implementation ABAboutWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    [_linkButton setTarget:self];
    [_linkButton setAction:@selector(openIcons8Site)];
}

- (void)openIcons8Site {
    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:@"http://www.icons8.com"]];
}

@end
