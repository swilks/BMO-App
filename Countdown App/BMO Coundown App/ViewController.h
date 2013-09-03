//
//  ViewController.h
//  BMO Coundown App
//
//  Created by user on 2013-08-02.
//  Copyright (c) 2013 samwilks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDFlipNumberView.h"

@interface ViewController : UIViewController

@property (nonatomic, strong) JDFlipNumberView *seconds;
@property (nonatomic, strong) JDFlipNumberView *years;
@property (nonatomic, strong) JDFlipNumberView *months;
@property (nonatomic, strong) JDFlipNumberView *days;

@end
