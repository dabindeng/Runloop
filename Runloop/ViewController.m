//
//  ViewController.m
//  Runloop
//
//  Created by DB_MAC on 2017/6/14.
//  Copyright © 2017年 db. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (assign, nonatomic) BOOL isFinished;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.isFinished = NO;
    
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(demo1) object:nil];
    [thread start];
    
    
    
    [self performSelector:@selector(demo2) onThread:thread withObject:nil waitUntilDone:NO];
    
}


-(void)demo1
{
    NSLog(@"11");
//    当前线程 也有一个runloop  但是默认不循环 需要自己启动循环
//    [[NSRunLoop currentRunLoop] run];  这是个死循环
    //oc中使用比较多的退出循环的方式
    while (!self.isFinished) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];//每0.1秒 跑一次循环
    }
    
    
}
-(void)demo2{
    NSLog(@"22");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
