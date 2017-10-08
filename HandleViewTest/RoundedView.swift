//
//  RoundedView.swift
//  HandleViewTest
//
//  Created by Louis D'hauwe on 07/10/2017.
//  Copyright © 2017 Silver Fox. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedView: UIView {

	@IBInspectable
	var cornerRadius: CGFloat = 16.0 {
		didSet {
			setNeedsDisplay()
		}
	}
	
    override func draw(_ rect: CGRect) {
		
		self.tintColor.setFill()

		let path = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
		
		path.fill()
		
    }

}
