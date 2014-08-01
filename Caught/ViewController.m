//
//  ViewController.m
//  Caught
//
//  Created by c1348 on 2014/07/31.
//  Copyright (c) 2014年 motoyama. All rights reserved.
//

#import "ViewController.h"
#import "CatchCopyView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    CGRect deviceScreenSize = [[UIScreen mainScreen] bounds];
    _screenW = deviceScreenSize.size.width;
    _screenH = deviceScreenSize.size.height;
    CatchCopyView *catchCopyView = [[CatchCopyView alloc] initWithFrame:CGRectMake(0, 0, _screenW, _screenH)];
    self.view = catchCopyView;
    
    _bottomToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, _screenH-44, _screenW, 44)];
    [self.view addSubview:_bottomToolbar];

    //viewChangeButtonを生成
    _viewChangeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //大きさ設定
    _viewChangeButton.frame = CGRectMake(0, 0, 100, 30);
    //ボタンラベル設定
    [_viewChangeButton setTitle:@"change" forState:UIControlStateNormal];
    //タップ時のメソッド呼び出し
    [_viewChangeButton addTarget:self action:@selector(viewChange:) forControlEvents:UIControlEventTouchDown];
    //ツールバーにはそのままのせられないので予め設定
    //ボタンを、UIToolBarにボタンを配置できる UIBarButtonItem にする
    UIBarButtonItem *toolbarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_viewChangeButton];
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    // 配列にボタンとスペーサーをセットする
    NSArray *toolbarItems =
    [NSArray arrayWithObjects:spacer,toolbarButtonItem,spacer, nil];
    // 配列をbottomToolBarにセットする
    [_bottomToolbar setItems:toolbarItems animated:YES];
    [self.view addSubview:_bottomToolbar];
    [super viewDidLoad];
}

-(void) viewChange:(UIButton *)button{
    NSLog(@"%@ called", NSStringFromSelector(_cmd));
    //ViewController上に_secondaryViewが存在しない場合（addSubviewされていない場合）
    if (![_secondaryView isDescendantOfView:self.view]) {
        //SecondaryViewの配置と大きさをセットする。
        //_bottomToolBarを隠してしまわないように、44px短くする
        _secondaryView = [[SecondaryView alloc]initWithFrame:CGRectMake(0, 0, _screenW, _screenH-44)];
        [self.view addSubview:_secondaryView];
        //ViewControllerに既に_secondaryViewが存在する場合
    }else{
        [self.secondaryView viewClose:button];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
