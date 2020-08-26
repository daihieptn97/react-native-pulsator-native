

import Foundation
@objc(PulsatorNative)
class PulsatorNative: RCTViewManager {

  override func view() -> UIControl! {
    return PulsatorViewControler()
  }

  override static func requiresMainQueueSetup() -> Bool {
    return true
  }
}
