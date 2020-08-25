//
//  PulsatorViewControler.swift
//  PulsatorNative
//
//  Created by Trần Hiệp on 8/24/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

import Foundation
import Pulsator

class PulsatorViewControler: UIControl {
    var radarState = false
    let pulsator = Pulsator()
    
    override func layoutSubviews() {
        super.layoutSubviews();
        
        
        //        setUpPulsator()
        
        
        let widthCircle = bounds.size.width * 0.3;
        let x = bounds.size.width / 2 - widthCircle / 2
        let y = bounds.size.height / 2 - widthCircle / 2
        print("frame.size.width", bounds.size.width, bounds.size.height)
        print("widthCircle x y", widthCircle, x, y)
        
        buttonT.frame = CGRect(x: x, y: y, width: widthCircle, height: widthCircle)
        buttonT.layer.cornerRadius = (widthCircle * 0.5)
        //buttonT.center = center
        setUpPulsator()
        
    }
    private let buttonT : UIButton = {
        let btn = UIButton();
        btn.backgroundColor = UIColor(red: 98/255, green: 0/255, blue: 243/255, alpha: 1)
        btn.setTitleColor(.black, for: .normal)
        btn.layer.masksToBounds = true;
        btn.titleLabel?.font = .systemFont(ofSize: 20, weight : .bold);
        //        Start Icon
        //        btn.setImage( UIImage(named: "search"), for: .normal)
        //        End setup icon
        return btn;
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        buttonT.addTarget(self, action: #selector(onButtonPressed), for: .touchUpInside)
        self.addSubview(buttonT)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
  
    private func setUpPulsator() {
        pulsator.frame = CGRect(x: bounds.size.width / 2 , y: bounds.size.height / 2 , width: 0, height: 0)
        self.layer.addSublayer(pulsator)
        pulsator.numPulse = 10
        pulsator.radius = 200.0
        pulsator.backgroundColor = UIColor(red: 98/255, green: 0/255, blue: 243/255, alpha: 1).cgColor
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

