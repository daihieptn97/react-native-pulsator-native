

import Foundation
@objc(PulsatorNative)
class PulsatorNative: RCTViewManager {

  override func view() -> UIView! {
    return PulsatorViewControler()
  }

  override static func requiresMainQueueSetup() -> Bool {
    return true
  }
}
