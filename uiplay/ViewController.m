//
//  ViewController.m
//  uiplay
//
//  Created by Zhang Xiang on 2017/4/7.
//  Copyright © 2017年 zhangxiang. All rights reserved.
//

#import "ViewController.h"
#import "SubViewController.h"

NSArray* ConstraintView(UIView *targetView, UIView *superview, NSString* vfl, NSLayoutFormatOptions opts, NSDictionary<NSString *,id> *metrics, NSDictionary<NSString *, id> *views){
    
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:vfl options:opts metrics:metrics views:views];
    [superview addConstraints: constraints];
    targetView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints: constraints];
    return constraints;
}

@interface ViewController ()
@property (nonatomic, weak) NSLayoutConstraint *constraint2;
@end

@implementation ViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"superView viewDidLoad w:%f h:%f", self.view.frame.size.width, self.view.frame.size.height);
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *view  = [[UIView alloc] init];
    view.backgroundColor = [UIColor blueColor];
    [self.view addSubview: view];
    
    NSDictionary *views =  NSDictionaryOfVariableBindings(view);
    ConstraintView(view, self.view, @"V:|-0-[view(100)]->=20-|", NSLayoutFormatAlignAllCenterY, nil, views);
    ConstraintView(view, self.view, @"H:|-[view(100)]", NSLayoutFormatAlignAllCenterX, nil, views);
    
    
    NSLog(@"before init");
    SubViewController *subView = [[SubViewController alloc] initWithFrame:CGRectMake( 120, 120, 120, 120)];
    NSLog(@"after init");
    [subView didMoveToParentViewController:self];
    NSLog(@"after didMoveToParentViewController");
    //UIView *v = [[UIView alloc] initWithFrame:CGRectMake( 120, 120, 120, 120)];
    //[subView setView: v];
    subView.view.frame = CGRectMake( 120, 120, 120, 120);
    subView.view.backgroundColor = [UIColor greenColor];
    [self.view addSubview: subView.view];
    NSLog(@"after addSubView");
    [self addChildViewController:subView];

}
- (void)viewDidLoad0 {
    NSLog(@"view did load");
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSUInteger len = 5;
    NSMutableArray * views = [[NSMutableArray alloc] initWithCapacity: len];
    CGRect baseFrame = self.view.frame;
    
    
    UITextView *textView = [[UITextView alloc] init];
    //[textView setBackgroundColor: [self getColor: 12]];
    textView.text = @"fuckkkkkaaaaaaaaaakaaa 少时诵诗书所所k";
    textView.textColor = [UIColor blackColor];
    [textView setContentSize:CGSizeMake(100, 100)];
    textView.backgroundColor = [UIColor yellowColor];
    //textView.frame = CGRectMake(0, 0, self.view.frame.size.width, 100);
    //[self.view addSubview: textView ];
    textView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    NSLayoutConstraint *constraint =[NSLayoutConstraint constraintWithItem: textView attribute: NSLayoutAttributeHeight relatedBy: NSLayoutRelationEqual toItem: nil attribute: NSLayoutAttributeNotAnAttribute multiplier: 0 constant: 100];
    [constraint setActive:YES];
    [textView addConstraint: constraint];
    NSLayoutConstraint *constraint2 =[NSLayoutConstraint constraintWithItem: textView attribute: NSLayoutAttributeWidth relatedBy: NSLayoutRelationEqual toItem: nil attribute: NSLayoutAttributeNotAnAttribute multiplier: 0 constant: 100];
    [constraint2 setActive:YES];
    self.constraint2 = constraint;
    [textView setDelegate:self];
    [textView addConstraint: constraint2];

    [views addObject: textView];
    
    for( NSUInteger i = 0; i<len; ++i){
        UILabel *view = [[UILabel alloc] init];
        [view setBackgroundColor: [self getColor: i]];
        [view setText:[NSString stringWithFormat:@"order %lu", i+1]];
        
        [views addObject: view];
        
        NSLog(@"Add view");
    }
    NSLog(@"frame %f,%f", self.view.frame.size.height, self.view.frame.size.width );
    
    
    [self addStackView:views
             withFrame: CGRectMake(0, 100, baseFrame.size.width, baseFrame.size.height - 100)];
}

- (void) addStackView: (NSArray *)views withFrame: (CGRect) frame {
    UIStackView *stackView = [[UIStackView alloc] initWithFrame: frame];
    [stackView setAxis:UILayoutConstraintAxisVertical];
    [stackView setAlignment: UIStackViewAlignmentCenter];
    [stackView setDistribution: UIStackViewDistributionFillProportionally];
    [stackView setSpacing: 10];
    [stackView setAutoresizesSubviews:YES];
    for (id view in views) {
        [stackView addArrangedSubview: view];
    }
    [self.view addSubview: stackView];
}

- (UIColor *) getColor: (NSUInteger)n {
    NSArray *arr = @[ [UIColor blueColor], [UIColor orangeColor], [UIColor yellowColor], [UIColor redColor]];
    
    return arr[n % [arr count]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)textViewDidChange:(UITextView *)textView {
    self.constraint2.constant = textView.contentSize.height;
    [self.view layoutIfNeeded];
    NSLog(@"layout ");
}

-(BOOL)prefersStatusBarHidden {
    return NO;
}

-(UIStatusBarStyle) preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

@end
