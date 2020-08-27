//
//  PulsatorViewControler.swift
//  PulsatorNative
//
//  Created by Trần Hiệp on 8/24/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

import Foundation
import Pulsator
import UIKit

class PulsatorViewControler: UIControl {
    var radarState = false
    let pulsator = Pulsator()

    @objc var pulsatorColor: NSString = "" {
        didSet {
            pulsator.backgroundColor = hexStringToCGColor(hex: pulsatorColor  as String)
            buttonT.backgroundColor = hexStringToUIColor(hex: pulsatorColor as String)
            self.setNeedsDisplay()
        }
    }

    @objc var isRunning: Bool = false {
        didSet {
            if isRunning {
                pulsator.start()
            }else {
                pulsator.stop()
            }
        }
    }

    @objc var sizeCenterPulsator: NSNumber = 10 {
        didSet {
            print("sizeCenterPulsator", sizeCenterPulsator)
        }
    }

    func hexStringToCGColor (hex:String) -> CGColor {
        return hexStringToUIColor(hex: hex).cgColor
    }

    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }


    override func layoutSubviews() {
        super.layoutSubviews();
        let widthCircle = bounds.size.width * 0.5;
        let x = bounds.size.width / 2 - widthCircle / 2;
        let y = bounds.size.height / 2 - widthCircle / 2;

        buttonT.frame = CGRect(x: x, y: y, width: widthCircle, height: widthCircle)
        buttonT.layer.cornerRadius = (widthCircle * 0.5)
        setUpPulsator()

    }

    private let buttonT : UIButton = {
        let btn = UIButton();
        btn.setTitleColor(.black, for: .normal)
        btn.layer.masksToBounds = true;
        btn.titleLabel?.font = .systemFont(ofSize: 20, weight : .bold);
        return btn;
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)


        //buttonT.addTarget(self, action: #selector(onButtonPressed), for: .touchUpInside)
        self.addSubview(buttonT)

    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func setUpPulsator() {
        pulsator.frame = CGRect(x: bounds.size.width / 2 , y: bounds.size.height / 2 , width: 0, height: 0)
        self.layer.addSublayer(pulsator)
        pulsator.numPulse = 10
        pulsator.radius = bounds.size.width - 100
        //        pulsator.backgroundColor = UIColor(red: 98/255, green: 0/255, blue: 243/255, alpha: 1).cgColor
        pulsator.animationDuration = 6.0
        pulsator.pulseInterval = 1.0
    }

    @objc func onButtonPressed() {

        if radarState {
            pulsator.stop()
            radarState = false
        } else {
            pulsator.start()
            radarState = true
        }
    }


}

