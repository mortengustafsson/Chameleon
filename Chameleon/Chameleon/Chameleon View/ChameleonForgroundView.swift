//
//  ChameleonForgroundView.swift
//  Chameleon
//
//  Created by Morten Gustafsson on 08/02/2019.
//  Copyright © 2019 com.mortengustafsson. All rights reserved.
//

import UIKit

class ChameleonForgroundView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        let bushColor = UIColor(red: 0.314, green: 0.710, blue: 0.071, alpha: 1.000)

        let bushGroup: CGRect = CGRect(x: rect.minX + floor(rect.width * 0.06903 - 0.42) + 0.92, y: rect.minY + floor(rect.height * 0.65395 - 0.4) + 0.9, width: floor(rect.width * 0.89822 + 0.15) - floor(rect.width * 0.06903 - 0.42) - 0.57, height: floor(rect.height * 0.98353 - 0.49) - floor(rect.height * 0.65395 - 0.4) + 0.09)


        let bushPath = UIBezierPath()
        bushPath.move(to: CGPoint(x: bushGroup.minX + 0.00000 * bushGroup.width, y: bushGroup.minY + 0.23038 * bushGroup.height))
        bushPath.addCurve(to: CGPoint(x: bushGroup.minX + 0.51647 * bushGroup.width, y: bushGroup.minY + 1.00000 * bushGroup.height), controlPoint1: CGPoint(x: bushGroup.minX + 0.10006 * bushGroup.width, y: bushGroup.minY + 0.68905 * bushGroup.height), controlPoint2: CGPoint(x: bushGroup.minX + 0.29382 * bushGroup.width, y: bushGroup.minY + 1.00000 * bushGroup.height))
        bushPath.addCurve(to: CGPoint(x: bushGroup.minX + 1.00000 * bushGroup.width, y: bushGroup.minY + 0.36392 * bushGroup.height), controlPoint1: CGPoint(x: bushGroup.minX + 0.71675 * bushGroup.width, y: bushGroup.minY + 1.00000 * bushGroup.height), controlPoint2: CGPoint(x: bushGroup.minX + 0.89364 * bushGroup.width, y: bushGroup.minY + 0.74834 * bushGroup.height))
        bushPath.addCurve(to: CGPoint(x: bushGroup.minX + 0.76031 * bushGroup.width, y: bushGroup.minY + 0.21291 * bushGroup.height), controlPoint1: CGPoint(x: bushGroup.minX + 0.93520 * bushGroup.width, y: bushGroup.minY + 0.26970 * bushGroup.height), controlPoint2: CGPoint(x: bushGroup.minX + 0.85160 * bushGroup.width, y: bushGroup.minY + 0.21291 * bushGroup.height))
        bushPath.addCurve(to: CGPoint(x: bushGroup.minX + 0.57067 * bushGroup.width, y: bushGroup.minY + 0.30263 * bushGroup.height), controlPoint1: CGPoint(x: bushGroup.minX + 0.69104 * bushGroup.width, y: bushGroup.minY + 0.21291 * bushGroup.height), controlPoint2: CGPoint(x: bushGroup.minX + 0.62623 * bushGroup.width, y: bushGroup.minY + 0.24571 * bushGroup.height))
        bushPath.addCurve(to: CGPoint(x: bushGroup.minX + 0.26836 * bushGroup.width, y: bushGroup.minY + 0.00000 * bushGroup.height), controlPoint1: CGPoint(x: bushGroup.minX + 0.49004 * bushGroup.width, y: bushGroup.minY + 0.11441 * bushGroup.height), controlPoint2: CGPoint(x: bushGroup.minX + 0.38427 * bushGroup.width, y: bushGroup.minY + 0.00000 * bushGroup.height))
        bushPath.addCurve(to: CGPoint(x: bushGroup.minX + 0.00000 * bushGroup.width, y: bushGroup.minY + 0.23038 * bushGroup.height), controlPoint1: CGPoint(x: bushGroup.minX + 0.16810 * bushGroup.width, y: bushGroup.minY + 0.00000 * bushGroup.height), controlPoint2: CGPoint(x: bushGroup.minX + 0.07538 * bushGroup.width, y: bushGroup.minY + 0.08549 * bushGroup.height))

        bushPath.close()
        bushColor.setFill()
        bushPath.fill()
    }
}
