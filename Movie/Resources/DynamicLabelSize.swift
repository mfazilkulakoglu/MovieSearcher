//
//  DynamicLabelHeiight.swift
//  Movie
//
//  Created by Mehmet  Kulakoğlu on 27.06.2022.
//

import UIKit

class DynamicLabelSize {
    
    static func height(text: String?, font: UIFont, width: CGFloat) -> CGFloat {
        
        var currentHeight: CGFloat!
        
        let label: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        
        currentHeight = label.height
        label.removeFromSuperview()
        
        return currentHeight
    }
    
}
