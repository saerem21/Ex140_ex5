//
//  ViewController.m
//  Ex140_ex5
//
//  Created by SDT-1 on 2014. 1. 6..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation ViewController
{
    NSTimer *timer;
    BOOL timerWorking;
    
}

- (void)tickDown:(NSTimer *)timer{
    self.datePicker.countDownDuration = self.datePicker.countDownDuration -60;
    
    if(self.datePicker.countDownDuration <= 60 ){
        NSLog(@"done!");
        [self stopTimer];
    }
}

- (void)startTimer{
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tickDown:) userInfo:Nil repeats:YES];
}
- (void)stopTimer{
    [timer invalidate];
    timer = Nil;
    timerWorking = NO;
}

- (IBAction)toggleBtn:(id)sender {
    NSString *title = timerWorking ? @"statr" : @"stop";
    [sender setTitle:title forState:UIControlStateNormal];
    timerWorking = !timerWorking;
    
    if(timerWorking){
        [self startTimer];
    }
    else{
        [self stopTimer];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
