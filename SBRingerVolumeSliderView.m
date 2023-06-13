#import "SBRingerVolumeSliderView.h"

@implementation SBRingerVolumeSliderView
-(instancetype)initWithFrame:(CGRect)frame {
 self = [super init];
 if (self) {
  [self setClipsToBounds:NO];
  _backgroundView = [[UIView alloc]init];
  [_backgroundView setBackgroundColor:[UIColor quaternaryLabelColor]];
  [_backgroundView setClipsToBounds:YES];
  [self addSubview:_backgroundView];
  _fillView = [[UIView alloc]init];
  [_fillView setBackgroundColor:[UIColor secondaryLabelColor]];
  [self->_backgroundView addSubview:_fillView]; //_fillView is a subview of _backgroundView, which is a subview of self
 }
 return self;
}
