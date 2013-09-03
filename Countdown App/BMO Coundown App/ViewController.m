//
//  ViewController.m
//  BMO Coundown App
//
//  Created by user on 2013-08-02.
//  Copyright (c) 2013 samwilks. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) NSDate *now;
@property (nonatomic, strong) NSCalendar *calendar;
@property (nonatomic, strong) NSDateComponents *dateComponents;
@property (nonatomic, strong) NSInvocation *invocation;
@property (nonatomic, strong) NSMethodSignature *methodSignature;


@end

static NSDate *endDate = nil;

@implementation ViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self) {
        if (!endDate) {
            endDate = [NSDate dateWithTimeIntervalSince1970:4530643200]; //Time interval Starting september 1st 2013
        }
        self.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BMO-App.png"]]];
    self.seconds = [[JDFlipNumberView alloc] initWithDigitCount:2];
    self.days = [[JDFlipNumberView alloc] initWithDigitCount:3];
    self.years = [[JDFlipNumberView alloc] initWithDigitCount:2];
    
    [self setCurrentTimeWithAnimations:NO];
    
    [self.view addSubview:_seconds];
    [self.view addSubview:_days];
    [self.view addSubview:_years];
    CGPoint point = self.view.center;
    
    _seconds.frame = CGRectMake(point.x - 35, 40, 70, 100);
    _days.frame = CGRectMake(point.x - 52, 200, 105, 100);
    _years.frame = CGRectMake(point.x - 35, 400, 70, 100);
    [self startTimerWithInterval:1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setCurrentTimeWithAnimations:(BOOL)animate {
    self.dateComponents = [self.calendar components:NSYearCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit
                                           fromDate:[NSDate date]
                                             toDate:endDate options:0];
    
    [_years setValue:self.dateComponents.year animated:animate];
    [_days setValue:self.dateComponents.day animated:animate];
    [_seconds setValue:self.dateComponents.second animated:animate];
}

- (void)updateTimerValues {
    [self setCurrentTimeWithAnimations:YES];
}

- (void) startTimerWithInterval:(NSTimeInterval)seconds {
    SEL selector = @selector(updateTimerValues);
    _methodSignature = [self methodSignatureForSelector:selector];
    _invocation = [NSInvocation invocationWithMethodSignature:_methodSignature];
    [_invocation setSelector:selector];
    [_invocation setTarget:self];
    [NSTimer scheduledTimerWithTimeInterval:seconds invocation:_invocation repeats:YES];
}

@end
