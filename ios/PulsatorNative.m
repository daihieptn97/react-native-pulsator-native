#import "React/RCTViewManager.h"

@interface RCT_EXTERN_MODULE(PulsatorNative, RCTViewManager)
RCT_EXPORT_VIEW_PROPERTY(pulsatorColor  ,NSString )
RCT_EXPORT_VIEW_PROPERTY(sizeCenterPulsator  ,NSNumber )
RCT_EXPORT_VIEW_PROPERTY(isRunning  ,BOOL )

@end


