#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {



  // Override point for customization after application launch.
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"exercise_Flutter_Channel" binaryMessenger:((FlutterViewController *)self.window.rootViewController).binaryMessenger];
    [channel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        if ([@"callHotLines" isEqualToString:call.method]) {
            NSLog(@"iOS可以打电话了");
            result(Int(0));
        }else {
            result(FlutterMethodNotImplemented);
        }
    }];
    [GeneratedPluginRegistrant registerWithRegistry:self];
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
