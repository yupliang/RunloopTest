//
//  ViewController.m
//  RunloopTest
//
//  Created by Qiqiuzhe on 2019/5/14.
//  Copyright © 2019 Qiqiuzhe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    CFRunLoopObserverRef runLoopObserver;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CFRunLoopObserverContext context = {0,(__bridge void*)self,NULL,NULL};
    runLoopObserver = CFRunLoopObserverCreate(kCFAllocatorDefault,kCFRunLoopAllActivities,YES,0,&runLoopObserverCallBack,&context);
    
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), runLoopObserver, kCFRunLoopCommonModes);

}

void runLoopObserverCallBack (CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info) {
    NSString *runloopActivity = @"";
    switch (activity) {
        case kCFRunLoopEntry:
            runloopActivity = @"entry";
            break;
        case kCFRunLoopBeforeTimers:
            runloopActivity = @"beforetimers";
            break;
        case kCFRunLoopBeforeSources:
            runloopActivity = @"beforesources";
            break;
        case kCFRunLoopBeforeWaiting:
            runloopActivity = @"beforewaiting";
            break;
        case kCFRunLoopAfterWaiting:
            runloopActivity = @"afterwaiting";
            break;
        case kCFRunLoopAllActivities:
            runloopActivity = @"allactivity";
            break;
        case kCFRunLoopExit:
            runloopActivity = @"exit";
            break;
        default:
            break;
    }
    if ([runloopActivity isEqualToString:@"afterwaiting"]) {
        NSLog(@"");
    }
    //    NSLog(@"loop %@ activity %@ info %@", CFRunLoopGetCurrent(),runloopActivity, info);
    NSLog(@"activity %@ info %@", runloopActivity, info);
}


@end
