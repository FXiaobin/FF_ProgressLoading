//
//  DemoViewController.m
//  FF_CircleLoading
//
//  Created by fanxiaobin on 2017/4/13.
//  Copyright © 2017年 fanxiaobin. All rights reserved.
//

#import "DemoViewController.h"
#import "UIViewController+CircleLoading.h"
#import <AFNetworking.h>

@interface DemoViewController ()

@property (nonatomic,strong) UIWindow *window;

@property (nonatomic) CGFloat progress;

@property  (nonatomic,strong) AFHTTPSessionManager *manager;

@end

@implementation DemoViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self showLoading];
    _progress = 0.6;
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(updateProgress:) userInfo:nil repeats:YES];
    
    
    //[self queryData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
 
    
    
}


- (void)updateProgress:(NSTimer *)timer{
    
    _progress += 0.1;
    NSLog(@"---- progress = %.1f",_progress);
    [self updateCircleProgress:_progress];
    if (_progress >= 1.0) {
        [timer invalidate];
        [self hiddenLoading];
    }
    
    
}


- (void)queryData{
    
    [self showLoading];

    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 15.f;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    _manager = manager;
    NSSet *set = [NSSet setWithObjects:@"text/plain",@"text/html",@"application/json",@"application/json;charset=UTF-8", @"application/x-www-form-urlencoded", nil];
    manager.responseSerializer.acceptableContentTypes = set;
    
    
    
    NSDictionary *par = @{@"currPage" : @(1), @"pageSize" : @"6"};
    
  
    [manager POST:@"http://192.168.0.121/eqMobile/delegateHandleRequest?OPT=7030" parameters:par progress:^(NSProgress * _Nonnull uploadProgress) {
        
        [self updateCircleProgress:0.9];
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        [self hiddenLoading];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
 
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
