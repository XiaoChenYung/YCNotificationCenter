//
//  FirstViewController.m
//  YCNotificationCenter
//
//  Created by xiaochen yang on 2017/12/1.
//  Copyright © 2017年 xiaochen yang. All rights reserved.
//

#import "FirstViewController.h"
#import "YCNotificationCenter.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UILabel *countLable;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[YCNotificationCenter defaultCenter] addObserver:self selector:@selector(test:) name:@"test" object:@"1"];
    // Do any additional setup after loading the view.
}
- (IBAction)sendNotiificationButton:(UIButton *)sender {
    [[YCNotificationCenter defaultCenter] postNotificationName:@"test" object:@"1"];
}

- (void)test:(NSNotification *)no {
    NSInteger count = self.countLable.text.integerValue;
    self.countLable.text = [NSString stringWithFormat:@"%zu", ++count];
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
