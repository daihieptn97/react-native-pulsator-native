import { requireNativeComponent, View, TouchableOpacity, StyleSheet } from 'react-native';
import React from 'react';

const PulsatorNative = requireNativeComponent('PulsatorNative', null);

export default function PulsatorNative({ pulsatorColor = '#08400d', styles = stylesDefault, children, isRunning }) {
  return <PulsatorNative
    style={[stylesDefault, styles]}
    pulsatorColor={pulsatorColor}
    isRunning={isRunning}
  >
    <View style={{ zIndex: 1 }}>
      {children}
    </View>

  </PulsatorNative>;
}

let stylesDefault = {
  width: 300,
  height: 300,
  justifyContent: 'center',
  alignItems: 'center',
  zIndex: -1,
};
