//
//  ViewController.m
//  aaass
//
//  Created by Raj on 20/11/18.
//  Copyright © 2018 Raj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

NSMutableArray *  array;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//   array  =  [[NSMutableArray alloc]init];
////    array = [4,6,2,2,6,6,1, nil];
//    [array addObject: [NSNumber numberWithInt:4 ]];
//    [array addObject: [NSNumber numberWithInt: 6]];
//    [array addObject: [NSNumber numberWithInt: 2]];
//    [array addObject: [NSNumber numberWithInt: 2]];
//    [array addObject: [NSNumber numberWithInt: 6]];
//    [array addObject: [NSNumber numberWithInt: 1]];
    
    NSString *text = @"Random string that won't be backed up.";
    NSString *destinationPath = [NSTemporaryDirectory()
                                 stringByAppendingPathComponent:@"MyFile.txt"];
    NSError *error = nil;
    [text writeToURL:destinationPath atomically:<#(BOOL)#> encoding:<#(NSStringEncoding)#> error:@error]
    BOOL succeeded = [text writeToFile:destinationPath
                              encoding:NSUTF8StringEncoding
                                 error:&error];
    if (succeeded) {
        NSLog(@"Successfully stored the file at: %@", destinationPath);
    } else {
        NSLog(@"Failed to store the file. Error = %@", error);
    }
  
    
    [self solution:array];
}

-(int) solution:(NSMutableArray *)A {
    int N = [A count];
    int result = 0;
    int i, j;
    for (i = 0; i < N; i++)
        for (j = 0; j < N; j++)
            if ([[A objectAtIndex: i] intValue] == [[A objectAtIndex: j] intValue])
                if (abs(i - j) > result)
                    result = abs(i - j);
    return result;
}

@end
