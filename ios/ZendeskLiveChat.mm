#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(ZendeskLiveChat, NSObject)

RCT_EXTERN_METHOD(multiply:(float)a withB:(float)b
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(initZendesk:(NSString)accountKey
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(openZendeskChat)

+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

@end
