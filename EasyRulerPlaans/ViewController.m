//
//  ViewController.m
//  EasyRulerPlaans
//
//  Created by Johannes Heinke Business on 11.10.18.
//  Copyright © 2018 Mikavaa. All rights reserved.
//

#import <ARKit/ARKit.h>
#import "ViewController.h"
#import "EasyRulerPlaans-Swift.h"

@interface ViewController () <ARSCNViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    MeasureController *m = [[MeasureController alloc] initWithViewController: self];
    [m setupMeasurement];
}


@end
