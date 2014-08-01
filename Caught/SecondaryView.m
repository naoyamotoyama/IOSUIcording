//
//  SecondaryView.m
//  Caught
//
//  Created by c1348 on 2014/07/31.
//  Copyright (c) 2014年 motoyama. All rights reserved.
//

#import "SecondaryView.h"
#import "CAKeyframeAnimation+AHEasing.h"

@implementation SecondaryView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //self.frame = self.bounds;
        //self.frame = CGRectMake(self.frame.size.width, 0, self.frame.size.width, self.frame.size.height);
        //self.alpha = 0.0;
        self.frame = self.bounds;
        
        self.backgroundColor = [UIColor colorWithRed:180/255.0f green:255/255.0f blue:235/255.0f alpha:0.2f];
        //ラベル設定
        _hogeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.frame.size.width, 40)];
        _hogeLabel.font = [UIFont systemFontOfSize:14.0];
        _hogeLabel.text = @"SecondaryView";
        _hogeLabel.textColor = [UIColor redColor];
        
        //自分（SecondaryView）にラベルを配置する
        [self addSubview:_hogeLabel];
        
        //閉じるボタン生成
        _viewCloseButton = [UIButton buttonWithType:UIButtonTypeCustom];
        //配置
        _viewCloseButton.frame = CGRectMake(self.frame.size.width/2-50, 150, 100, 30);
        //ボタンラベル設定
        [_viewCloseButton setTitle:@"close" forState:UIControlStateNormal];
        //タップ時のアクションメソッド
        [_viewCloseButton addTarget:self action:@selector(viewClose:) forControlEvents:UIControlEventTouchDown];
        //ボタン設置
        [self addSubview:_viewCloseButton];
        ////////////////前回からの変更点////////////////
        //viewOverメソッドを呼ぶ
        [self viewOver];

    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

////////////////前回からの変更点////////////////
//重なるときのアニメーション
-(void) viewOver{
    NSLog(@"%@ called", NSStringFromSelector(_cmd));
    //アニメーション: 0.4秒かけて画面中央に配置し、同時に透明度を1.0(不透明)にする
    //[UIView animateWithDuration:0.4 animations:^{self.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height); self.alpha = 1.0;}];
    CAKeyframeAnimation *slideInAnimation;
    {
        CGSize offSize = self.bounds.size;
        //画面出現時の横移動の始点と終点を定める
        CGPoint fromPoint = CGPointMake(offSize.width, offSize.height/2);
        CGPoint toFrame = CGPointMake(offSize.width*1.5, offSize.height/2);
        
        // "position" に対して "ExponentialEaseOut" で 始点から終点まで 秒間180コマのアニメーションを作成する
        slideInAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position" function:ExponentialEaseOut fromPoint:fromPoint toPoint:toFrame keyframeCount:180];
        //アニメーションは1秒間
        slideInAnimation.duration = 1.0;
        //アニメーションが完了しても、アニメーションの結果はそのままにする（この2つの設定がないとアニメーション完了時に巻き戻されてしまう）
        slideInAnimation.removedOnCompletion = NO;
        slideInAnimation.fillMode = kCAFillModeForwards;
        //アニメーションについてのイベント呼び出し先を自分に設定する
        slideInAnimation.delegate = self;
    }
    [self.layer addAnimation:slideInAnimation forKey:@"SlideInAnimation"];
    
    ////////////////前回からの変更点////////////////
    //出現時の透明度アニメーション
    CAKeyframeAnimation *opacityAnimation;
    {
        opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
        
    }
}

//viewCloseButtonが押されて呼び出されるメソッド
-(void) viewClose:(UIButton*)button{
    NSLog(@"%@ called", NSStringFromSelector(_cmd));
    //自分を画面から削除する
    //[self removeFromSuperview];
    ////////////////前回からの変更点////////////////
    //アニメーション: 0.25秒かけて画面右外へ移動させ、同時に透明度を0.0(透明)にする
    [UIView animateWithDuration:0.25
            animations:^{self.frame = CGRectMake(self.frame.size.width, 0, self.frame.size.width, self.frame.size.height); self.alpha = 0.0;}
            //アニメーション終了時
            completion:^(BOOL finished){
                //secondeview削除
                [self removeFromSuperview];
            }
    ];
}

@end
