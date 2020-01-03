#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"

#import "GoogleMaps/GoogleMaps.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   [FIRApp configure];

   FlutterViewController *controller = (FlutterViewController *) self.window.rootViewController;
   FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"Mychannel"
   binaryMessenger:controller];
   [channel] setMethodCallHandler:^(FlutterMethodCall * call, FlutterResult result){
        NSString *from = call.arguments[@"from"];
       if([@"myNativeFunction" isEqualToString:call.method]){
            NSString *messageToFlutter = [self myNativeFunction];
            messageToFlutter = [NSString stringWithFormat:@"%@, Back to %", messageToFlutter, from];
            result(messageToFlutter);
       }
  }];
  [GMSServices.provideAPIKey:@"AIzaSyDvt_fsj6h7d6zOfRmFOSt3ijmh0pdLTLw"]
  [GeneratedPluginRegistrant registerWithRegistry:self];

  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}
-(NSString *) myNativeFunction{
        return @"Message from ios";
}

@end
