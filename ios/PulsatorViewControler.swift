//
//  PulsatorViewControler.swift
//  PulsatorNative
//
//  Created by Trần Hiệp on 8/24/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

import Foundation
import Pulsator

class PulsatorViewControler: UIView {
    var radarState = false
    let pulsator = Pulsator()
    
    
    private let buttonT : UIButton = {
        let btn = UIButton();
        //        btn.setTitle("hello", for: .normal)
        btn.backgroundColor = UIColor(red: 98/255, green: 0/255, blue: 243/255, alpha: 1)
        btn.setTitleColor(.black, for: .normal)
        btn.layer.masksToBounds = true;
        btn.titleLabel?.font = .systemFont(ofSize: 20, weight : .bold);
        
        //        Start Icon
        btn.setImage( UIImage(named: "search"), for: .normal)
        //        End setup icon
        
        return btn;
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpPulsator()
        self.addSubview(buttonT)
        
        let widthCircle = self.frame.width * 0.3;
        buttonT.frame = CGRect(x: 30, y: 30, width:widthCircle, height:widthCircle);
        buttonT.layer.cornerRadius = (widthCircle * 0.5)
        buttonT.center = self.center
        
        buttonT.addTarget(self, action: #selector(onButtonPressed), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    private func setUpPulsator() {
        pulsator.frame = CGRect(x: self.frame.width / 2, y: self.frame.height / 2, width: 0, height: 0)
        self.layer.addSublayer(pulsator)
        pulsator.numPulse = 10
        pulsator.radius = 200.0
        pulsator.backgroundColor = UIColor(red: 98/255, green: 0/255, blue: 243/255, alpha: 1).cgColor
        pulsator.animationDuration = 6.5
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

