import { NativeModules } from 'react-native';

type PulsatorNativeType = {
  multiply(a: number, b: number): Promise<number>;
};

const { PulsatorNative } = NativeModules;

export default PulsatorNative as PulsatorNativeType;
