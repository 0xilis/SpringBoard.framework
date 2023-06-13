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
 
 
 //Another part of the init method
 #if 0
 UIColor* secondaryLabelColor = [UIColor secondaryLabelColor];
 _silentModeLabel = [[UILabel alloc]init];
 [_silentModeLabel setFont:[[BSUIFontProvider defaultFontProvider]preferredFontForTextStyle:UIFontTextStyleFootnote hiFontStyle:0x4]];
 [_silentModeLabel setTextColor:secondaryLabelColor];
 [_silentModeLabel setText:[[[NSBundle mainBundle]localizedStringForKey:@"RINGER_SILENT" value:@"" table:@"SpringBoard"]];
 [self addSubview:_silentModeLabel];
 _ringerLabel = [[UILabel alloc]init];
 [_ringerLabel setFont:[[BSUIFontProvider defaultFontProvider]preferredFontForTextStyle:UIFontTextStyleFootnote hiFontStyle:0x4]];
 [_ringerLabel setTextColor:secondaryLabelColor];
 [_ringerLabel setText:[[[NSBundle mainBundle]localizedStringForKey:@"RINGER_VOLUME" value:@"" table:@"SpringBoard"]];
 [self addSubview:_ringerLabel];
 _onLabel = [[UILabel alloc]init];
 [_onLabel setFont:[[BSUIFontProvider defaultFontProvider]preferredFontForTextStyle:UIFontTextStyleFootnote hiFontStyle:0x4]];
 [_onLabel setTextColor:[UIColor tertiaryLabelColor]];
 [_onLabel setText:[[[NSBundle mainBundle]localizedStringForKey:@"RINGER_ON" value:@"" table:@"SpringBoard"]];
 _offLabel = [[UILabel alloc]init]
 [_offLabel setFont:[[BSUIFontProvider defaultFontProvider]preferredFontForTextStyle:UIFontTextStyleFootnote hiFontStyle:0x4]];
 [_offLabel setTextColor:[UIColor tertiaryLabelColor]];
 [_offLabel setText:[[[NSBundle mainBundle]localizedStringForKey:@"RINGER_OFF" value:@"" table:@"SpringBoard"]];
 _slider = [[SBRingerVolumeSliderView alloc]init];
 [_slider setValue:0.7];
 [self addSubview:_slider];
 #endif
 
}

/*

looks like in the layoutSubviews, depending on if silent is on or not, it sets something to [UIColor systemRedColor] or [UIColor secondaryLabelColor].

it does this via [something _setGlyphTintColor:theUIColor animationDuration:0.25];

0.25 is if theUIColor is [UIColor systemRedColor], and if it is [UIColor secondaryLabelColor] it is then 0.2155

*/

-(void)_setGlyphTintColor:(id)tintColor animationDuration:(double)animationDuration {
 if ((_glyphTintColor != tintColor) && ![tintColor isEqual:tintColor]) {
  _glyphTintColor = tintColor;
  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
  [BSAnimationSettings settingsWithDuration:rax timingFunction:animationDuration];
  id daColor = [[_glyphTintColor resolvedColorWithTraitCollection:[self traitCollection]];
  [self _updateGlyphWithStaticColor:daColor animationSettings:animationDuration];
 }
}

@end
