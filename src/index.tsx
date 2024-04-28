import { NativeModules, Platform } from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-zendesk-live-chat' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

const ZendeskLiveChat = NativeModules.ZendeskLiveChat
  ? NativeModules.ZendeskLiveChat
  : new Proxy(
    {},
    {
      get() {
        throw new Error(LINKING_ERROR);
      },
    }
  );

export function initZendesk(channelKey: string): void {
  ZendeskLiveChat.initZendesk(channelKey);
}

export function openZendeskChat(): void {
  ZendeskLiveChat.openZendeskChat();
}
