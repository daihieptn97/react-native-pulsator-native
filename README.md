# react-native-pulsator-native

Pulsator for React Native. This library binds iOS and Android libraries from below repositories:

- iOS: https://github.com/shu223/Pulsator.
- <b>Not working android<b>

## Installation

- Step 1:

```sh
yarn add react-native-pulsator-native
```
- Step 2:
```sh
cd ios && pod install
```

## Usage

```js
import React from 'react';
import {Text, View} from 'react-native';
import PulsatorNative from 'react-native-pulsator-native';

export default function () {
    return <View style={{flex: 1, justifyContent: 'center', alignItems: 'center'}}>
        <Text>Hello</Text>
        <PulsatorNative style={{width : 300, height : 300}}/>
    </View>;
}

```


