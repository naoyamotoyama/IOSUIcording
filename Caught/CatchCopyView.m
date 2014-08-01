//
//  CatchCopyView.m
//  Caught
//
//  Created by c1348 on 2014/07/31.
//  Copyright (c) 2014年 motoyama. All rights reserved.
//

#import "CatchCopyView.h"

@implementation CatchCopyView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.frame = self.bounds;
        self.backgroundColor = [UIColor grayColor];
        _hogeLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height/2-40, self.frame.size.width, 40)];
        _hogeLabel.font = [UIFont systemFontOfSize:16.0];
        _hogeLabel.text = @"CatchCopyView";
        _hogeLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_hogeLabel];
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

@end
