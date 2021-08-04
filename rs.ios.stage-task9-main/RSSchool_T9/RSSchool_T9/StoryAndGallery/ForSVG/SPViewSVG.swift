//
// 
// Project: RSSchool_T9
// 
// Author: Mikhail Skuratov
// On: 4.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class SPViewSVG: UIView {

    var paths = [CGPath]()
    var time = true
    var type = 1
    let layerSVG = CAShapeLayer()
    var numberImage = 0
    var color = UIColor.white
    
    override func draw(_ rect: CGRect) {
        
      
           
        
        let timerCheck = UserDefaults.standard.string(forKey: "timerCheck")
        if timerCheck == "0"{
            time = false
        }
        
        let data = FillingData.data
        switch data[type] {
        case .gallery( _ ):
            break
        case .story(let story):
            paths = story.paths
        }
        
        layerSVG.strokeEnd = 0
        layer.addSublayer(layerSVG)
        
        layerSVG.fillColor = UIColor.black.cgColor
        layerSVG.strokeColor = color.cgColor
        layerSVG.path = paths[numberImage]
        
        change()
        
    }
    
    func timer(){
        let myTimer = Timer(timeInterval: 0.016, target: self, selector: #selector(change), userInfo: nil, repeats: false)
        RunLoop.current.add(myTimer, forMode: .common)
    }
    
    
    
    @objc func change(){
        if(time){
            layerSVG.strokeEnd += 0.0055
        } else {
            layerSVG.strokeEnd += 1
        }
        if(layerSVG.strokeEnd < 1){
            timer()
        }
        
    }

}
