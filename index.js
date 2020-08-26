import {requireNativeComponent, View, TouchableOpacity, StyleSheet} from 'react-native';
import React from 'react';

const PulsatorNative = requireNativeComponent('PulsatorNative', null);
let stylesDefault = {
  width: 300,
  height: 300,
};

export default function ({pulsatorColor = '#08400d', styles = stylesDefault}) {
  return <PulsatorNative style={styles} pulsatorColor={pulsatorColor}/>;
}
