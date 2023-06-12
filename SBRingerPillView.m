#import "SBRingerPillView.h"

@implementation SBRingerPillView
-(instancetype)init {
 self = [super init];
 if (!self) {
  return; //ERROR
 }
 MTMaterialShadowView* shadowView = [MTMaterialShadowView materialShadowViewWithRecipe:0x36 configuration:0x1]; //generate the _materialView iVar
  //yes i know its confusing... the _materialView is not a MTMaterialView but a MTMaterialShadowView :P
 _materialView = shadowView;
 [_materialView setShadowPathIsBounds:YES];
 [_materialView setShadowColor:[UIColor blackColor]]; //the MTMaterialShadowView will have a black shadow
 [_materialView setShadowRadius:100.0]; //this might not be 100.0 float, just a guess
 [_materialView _setContinuousCornerRadius:100.0]; //this might not be 100.0 float just a guess
 [_materialView setShadowOffset:8.0]; //this is prob right tho
 [_materialView setShadowOpacity:0.18];
 [self addSubview:_materialView];
 MTMaterialView* materialView = [_materialView materialView];
 _stylingProvider = [materialView visualStylingProviderForCategory:0x2];
 _glyphView = [[BSUICAPackageView alloc] initWithPackageName:@"Mute" inBundle:[NSBundle bundleForClass:[self class]]];
 [self addSubview:_glyphView];
 //finish latr
}
@end
