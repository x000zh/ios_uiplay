//
//  SubViewController.m
//  uiplay
//
//  Created by Zhang Xiang on 2017/4/14.
//  Copyright © 2017年 zhangxiang. All rights reserved.
//

#import "SubViewController.h"

@interface SubViewController ()

@property (nonatomic) CGRect initFrame;
@end

@implementation SubViewController

- (instancetype) initWithFrame:(CGRect) frame{
    if(self = [self init]){
        self.initFrame = frame;
    }
    return self;
}

- (void) loadView {
    [super loadView];
    if(self.viewLoaded && !CGRectIsEmpty(self.initFrame)){
        self.view.frame = self.initFrame;
        NSLog(@"great");
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    view.backgroundColor = [UIColor purpleColor];
    
    [self.view addSubview: view];
    
    NSLog(@"viewDidLoad w:%f h:%f", self.view.frame.size.width, self.view.frame.size.height);
}



- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear w:%f h:%f", self.view.frame.size.width, self.view.frame.size.height);

}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear w:%f h:%f", self.view.frame.size.width, self.view.frame.size.height);
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
