import ZendeskSDKMessaging
import ZendeskSDK

@objc(ZendeskLiveChat)
class ZendeskLiveChat: NSObject {
    
    @objc(multiply:withB:withResolver:withRejecter:)
    func multiply(a: Float, b: Float, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
        resolve(a*b)
    }
    
    @objc(initZendesk:withResolver:withRejecter:)
    func initZendesk(apiKey: String,resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
        Zendesk.initialize(withChannelKey: apiKey, messagingFactory: DefaultMessagingFactory()) { result in
            if case let .failure(error) = result {
                print("Messaging did not initialize.\nError: \(error.localizedDescription)")
            } else {
                print("Successfully initialized")
            }
        }
    }
    
    @objc(openZendeskChat)
    func openZendeskChat() -> Void {
        DispatchQueue.main.async {
            guard let viewController = Zendesk.instance?.messaging?.messagingViewController() else { return }
                
            let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first

            let rootViewController = keyWindow?.rootViewController

            rootViewController?.present(viewController, animated: true, completion: nil)
        }
    }
}
