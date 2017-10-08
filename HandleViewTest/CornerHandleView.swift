//
//  CornerHandleView.swift
//  HandleViewTest
//
//  Created by Louis D'hauwe on 01/10/2017.
//  Copyright © 2017 Silver Fox. All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics

@IBDesignable
class CornerHandleView: UIView {
	
	@IBInspectable
	var handleWidth: CGFloat = 6 {
		didSet {
			setNeedsDisplay()
		}
	}
	
	@IBInspectable
	var innerRadius: CGFloat = 24 {
		didSet {
			setNeedsDisplay()
		}
	}
	
	@IBInspectable
	var outerRadius: CGFloat = 28 {
		didSet {
			setNeedsDisplay()
		}
	}
	
	var position: Int = 0 {
		didSet {
			setNeedsDisplay()
		}
	}
	
	//	func innerRadius(for outerRadius: CGFloat, with handleWidth: CGFloat) -> CGFloat {
	//		return outerRadius - handleWidth / 2
	//	}
	
	//	func outerRadius(for innerRadius: CGFloat, with handleWidth: CGFloat) -> CGFloat {
	//		return innerRadius + handleWidth / 2
	//	}
	
	override func draw(_ rect: CGRect) {
		
		guard let context = UIGraphicsGetCurrentContext() else {
			return
		}
		
		context.saveGState()
		
		//		let outerRadius: CGFloat = self.outerRadius(for: innerRadius, with: handleWidth)
		
		let outerRadii = CGSize(width: outerRadius, height: outerRadius)
		let innerRadii = CGSize(width: innerRadius, height: innerRadius)
		
		let outerRect = CGRect(x: rect.origin.x, y: rect.origin.y, width: rect.width * 2, height: rect.height * 2)
		
		let outerRoundedRect = UIBezierPath(roundedRect: outerRect, byRoundingCorners: .topLeft, cornerRadii: outerRadii)
		
//		let innerRect = CGRect(x: rect.origin.x + handleWidth, y: rect.origin.y + handleWidth, width: rect.width - handleWidth*1.5, height: rect.height - handleWidth*1.5)

		let clipRect = UIBezierPath(rect: CGRect(x: 0, y: 0, width: rect.width - handleWidth/2, height: rect.height - handleWidth/2))
		
		clipRect.addClip()

		let innerRect = CGRect(x: rect.origin.x + handleWidth, y: rect.origin.y + handleWidth, width: rect.width*2, height: rect.height*2)

		
		let innerRoundedRect = UIBezierPath(roundedRect: innerRect, byRoundingCorners: .topLeft, cornerRadii: innerRadii)
		
		
		outerRoundedRect.append(innerRoundedRect)
		outerRoundedRect.usesEvenOddFillRule = true
		
		outerRoundedRect.addClip()
		
		
		self.tintColor.setFill()
		
	
		context.fill(rect)
		
//		context.restoreGState()
//
//		UIColor.red.setFill()
//		innerRoundedRect.fill()
		
		
		context.restoreGState()
		
		self.tintColor.setFill()
		
		context.fillEllipse(in: CGRect(x: 0, y: rect.height - handleWidth, width: handleWidth, height: handleWidth))
		
		context.fillEllipse(in: CGRect(x: rect.width - handleWidth, y: 0, width: handleWidth, height: handleWidth))
		
		//		context.rotate(by: CGFloat(position) * .pi/2)
		
	}
	
	override var intrinsicContentSize: CGSize {
		return CGSize(width: 38, height: 38)
	}
	
}

