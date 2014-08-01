//
//  SecondaryView.h
//  Caught
//
//  Created by c1348 on 2014/07/31.
//  Copyright (c) 2014年 motoyama. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondaryView : UIView

@property(strong, nonatomic)UILabel *hogeLabel;
//閉じるボタン宣言
@property(strong, nonatomic)UIButton *viewCloseButton;
////////////////前回からの変更点////////////////
//ViewControllerの changeボタンがタップされたときに呼び出されるメソッド
-(void)viewClose:(UIButton*)button;
@end
