import * as React from 'react';

import { StyleSheet, View, Button } from 'react-native';
import { initZendesk, openZendeskChat } from 'react-native-zendesk-live-chat';
import { ZENDESK_CHANNEL_KEY } from './keys';

export default function App() {

  React.useEffect(() => {
    initZendesk(ZENDESK_CHANNEL_KEY);
  }, []);

  return (
    <View style={styles.container}>
      <Button title="Open Chat" onPress={() => {
        console.log('Open Chat');
        openZendeskChat();
      }} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
