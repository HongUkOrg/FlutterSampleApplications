#import "FlutterAdbrixRemasterPlugin.h"
#import <flutter_adbrix_remaster/flutter_adbrix_remaster-Swift.h>

@implementation FlutterAdbrixRemasterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterAdbrixRemasterPlugin registerWithRegistrar:registrar];
}
@end
