//
//  ViewController.h
//  Caught
//
//  Created by c1348 on 2014/07/31.
//  Copyright (c) 2014年 motoyama. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CatchCopyView.h"
#import "SecondaryView.h"

@interface ViewController : UIViewController

@property(strong,nonatomic)UIToolbar *bottomToolbar;
@property(strong,nonatomic)UIButton *viewChangeButton;


@property(nonatomic) int screenW;
@property(nonatomic) int screenH;


@property(strong, nonatomic) CatchCopyView *catchCopyView;

@property(strong,nonatomic) SecondaryView *secondaryView;


@end
