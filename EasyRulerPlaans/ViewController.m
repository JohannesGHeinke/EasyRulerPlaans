//
//  ViewController.m
//  EasyRulerPlaans
//
//  Created by Johannes Heinke Business on 11.10.18.
//  Copyright © 2018 Mikavaa. All rights reserved.
//

#import <ARKit/ARKit.h>
#import "EasyRulerPlaans-Swift.h"
#import "ViewController.h"

@interface ViewController () <ARSCNViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    MeasureController *m = [[MeasureController alloc] initWithViewController: self];
    [m setupMeasurement];
    
}

-(void)handle:(float)distance {
    // Hier wird die Distance übergeben (Callback)
    NSLog(@"Distance");
}

@end
