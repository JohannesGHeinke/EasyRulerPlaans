//
//  ViewController.h
//  EasyRulerPlaans
//
//  Created by Johannes Heinke Business on 11.10.18.
//  Copyright © 2018 Mikavaa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ARKit/ARKit.h>

@interface ViewController : UIViewController <ARSCNViewDelegate>

- (void)handle: (float) distance;
@end

