//
//  ViewController.m
//  textInputMode
//
//  Created by 琦张 on 2018/1/6.
//  Copyright © 2018年 ZQ. All rights reserved.
//

#import "ViewController.h"
#import "ZQEmojiTextField.h"

@interface ViewController ()

@property (strong, nonatomic) ZQEmojiTextField *textField;
@property (strong, nonatomic) UIButton *hideBtn;
@property (strong, nonatomic) UITextField *normalTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.textField];
    [self.view addSubview:self.hideBtn];
    [self.view addSubview:self.normalTextField];

    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(logInputMode) userInfo:nil repeats:YES];
    
    //切换键盘时会调用此通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notify) name:UITextInputCurrentInputModeDidChangeNotification object:nil];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private
- (void)logInputMode
{
    NSLog(@"-----------");
    NSLog(@"%@", self.normalTextField.textInputMode);
    NSLog(@"%@", [self.normalTextField.textInputMode primaryLanguage]);
    NSLog(@"%@", self.textField.textInputContextIdentifier);
}

- (void)notify
{
    NSLog(@"~~~~~~ notify");
}

- (void)hidePressed
{
    [self.view endEditing:YES];
}

#pragma mark - getter
- (ZQEmojiTextField *)textField
{
    if (!_textField) {
        _textField = [[ZQEmojiTextField alloc] init];
        _textField.frame = CGRectMake(100, 100, 100, 40);
        _textField.layer.borderColor = [UIColor redColor].CGColor;
        _textField.layer.borderWidth = 0.5;
        _textField.layer.cornerRadius = 4;
    }
    return _textField;
}

- (UIButton *)hideBtn
{
    if (!_hideBtn) {
        _hideBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _hideBtn.frame = CGRectMake(100, 160, 100, 40);
        [_hideBtn setTitle:@"hide" forState:UIControlStateNormal];
        _hideBtn.layer.borderColor = [UIColor blueColor].CGColor;
        _hideBtn.layer.borderWidth = 0.5;
        _hideBtn.layer.cornerRadius = 4;
        [_hideBtn addTarget:self action:@selector(hidePressed) forControlEvents:UIControlEventTouchUpInside];
    }
    return _hideBtn;
}

- (UITextField *)normalTextField
{
    if (!_normalTextField) {
        _normalTextField = [[UITextField alloc] init];
        _normalTextField.frame = CGRectMake(100, 220, 100, 40);
        _normalTextField.layer.borderColor = [UIColor greenColor].CGColor;
        _normalTextField.layer.borderWidth = 0.5;
        _normalTextField.layer.cornerRadius = 4;
    }
    return _normalTextField;
}

@end
