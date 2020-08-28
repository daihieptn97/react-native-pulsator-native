# react-native-pulsator-native

Pulsator for React Native. This library binds iOS and Android libraries from below repositories:

- iOS: https://github.com/shu223/Pulsator.
-  Not working android

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
import {TouchableOpacity, View} from "react-native";
import PulsatorNative from "react-native-pulsator-native";
import Icon from "react-native-vector-icons/Ionicons";
import React from "react";

export default function () {

    const [isRunning, setRunning] = React.useState(true)

    return <View style={{
        justifyContent: 'center',
        alignContent: 'center',
        alignItems: 'center',
        flex: 1
    }}>
        <TouchableOpacity
            onPress={() => setRunning(!isRunning)}
        >
            <PulsatorNative pulsatorColor={'#4c77cb'}
                            isRunning={isRunning}>
                <Icon name='ios-search'
                      color={'#fff'}
                      size={100}/>
            </PulsatorNative>
        </TouchableOpacity>
    </View>
}


```

## Props
### pulsatorColor
Color of pulsation. Note color type hex.
### style
style of pulsation
### isRunning
set Sate for pulsation. True is running, false is stop

## Demo
![image info](./Demo/demo02.gif)
![image info](./Demo/demo01.png)

