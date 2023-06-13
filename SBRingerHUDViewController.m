#import "SBRingerHUDViewController.h"

@implementation SBRingerHUDViewController
-(void)loadView {
 [super loadView];
 CGRect daFrame;
 id selfView = [self view];
 if (selfView) {
  daFrame = [selfView frame];
 } else {
  daFrame = CGRectMake(0,0,0,0);
 }
 SBFTouchPassThroughView *touchPass = [[SBFTouchPassThroughView alloc]initWithFrame:daFrame];
 [touchPass setAutoresizingMask:0x12];
 [self setView:touchPass];
}
-(void)viewDidLoad {
 [super viewDidLoad];
 _pillView = [[SBRingerPillView alloc]init];
 [_pillView _setTouchInsets:CGRectMake(0,-30.0,0,0)]; //these are prob wrong but -30.0 does appear here somewhere
 [_pillView sizeToFit];
 id selfView = self.view;
 [selfView addSubview:_pillView];
 [self _layoutPillView];
 UISwipeGestureRecognizer* swipeGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeGesture:)];
 [swipeGesture setDirection:0x4];
 [_pillView addGestureRecognizer:swipeGesture];
 _ringerValueSpring = [[UIViewFloatAnimatableProperty alloc]init];
 [UIView _createTransformerWithInputAnimatableProperties:/* i have no fucknig idea */ presentationValueChangedCallback:^{
  id pillView = self->_pillView;
  [pillView setSliderValue:[self->_ringerValueSpring presentationValue]];
 }];
 [[UIView performWithoutAnimation:^{
  [_positionSpring setValue:rdx];
 }]; //i fucking hate blocks sometimes, i so fucking dont get them
 [self _updateVolumeSliderAnimated:NO];
}
-(void)viewWillAppear {
 [super viewWillAppear];
 [self _updateVolumeSliderAnimated:NO];
}
-(void)viewDidLayoutSubviews {
 [super viewDidLayoutSubviews];
 [self _layoutPillView];
}
-(BOOL)_canShowWhileLocked {
 return YES;
}
-(void)setRingerSilent:(BOOL)ringerSilent {
 if (_ringerSilent != ringerSilent) {
  _ringerSilent = ringerSilent;
  self->_lastEventIsAVolumeChange = NO;
  [self _updateStateAnimated:YES invert:NO];
 }
}
-(void)noteVolumeUpWasHit {
 return;
}
-(void)nudgeUp:(BOOL)nudgeUp {
 //i am so fucking confused i hate this i hate this i hate this
 id progressIndicatorFuckYou = [SBHUDViewController progressIndicatorStep];
 CGFloat vol = self->_volume;
 if (!nudgeUp) {
  int res = BSFloatLessThanOrEqualToFloat(progressIndicatorFuckYou, vol);
  
 } else {
  BSFloatIsOne(vol);
 }
 [self _updateVolumeSliderAnimated:YES];
}
-(void)buttonReleased {
 self->_overshoot = NO;
 [self _updateVolumeSliderAnimated:YES];
}
-(void)noteVolumeDownWasHit {
 return;
}
-(void)noteVolumeDidChange {
 return;
}
-(void)refreshAudioUI {
 return;
}
-(void)setVolume:(float)volume {
 //YES!! THIS METHOD SAYS FUCK YOU TO THE PASSED IN VOLUME, WE ARE SETTING VOLUME TO MAX!! FUCK YEAH!!
 [self setVolume:1 animated:NO forKeyPress:/* idk */];
}
-(BOOL)definesAnimatedDismissal {
 return YES;
}
@end
