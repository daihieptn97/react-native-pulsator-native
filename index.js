import { requireNativeComponent, View, TouchableOpacity, StyleSheet, Dimensions } from 'react-native';
import React from 'react';

const PulsatorNative = requireNativeComponent('PulsatorNative', null);
const SCREEN_WIDTH = Dimensions.get('window').width;

let stylesDefault = {
  width: SCREEN_WIDTH * 0.8,
  height: SCREEN_WIDTH * 0.8,
  justifyContent: 'center',
  alignItems: 'center',
  zIndex: -1,
};


export default function({ pulsatorColor = '#08400d', styles = stylesDefault, children, isRunning }) {
  return <PulsatorNative
    style={[styles]}
    pulsatorColor={pulsatorColor}
    isRunning={isRunning}
  >
    <View style={{
      zIndex: 1,
      justifyContent: 'center',
      alignItems: 'center',
      justifyItems: 'center',
      flex: 1,
    }}>
      {children}
    </View>
  </PulsatorNative>;
}

