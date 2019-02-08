//
//  ChameleonBackgroundView.swift
//  Chameleon
//
//  Created by Morten Gustafsson on 08/02/2019.
//  Copyright © 2019 com.mortengustafsson. All rights reserved.
//

import UIKit

class ChameleonBackgroundView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        let backgroundColor = UIColor(red: 0.600, green: 0.875, blue: 0.878, alpha: 1.000)
        let branchenColor = UIColor(red: 0.600, green: 0.310, blue: 0.090, alpha: 1.000)
        let lightLeaveColor = UIColor(red: 0.314, green: 0.710, blue: 0.071, alpha: 1.000)
        let darkLeaveColor = UIColor(red: 0.259, green: 0.549, blue: 0.075, alpha: 1.000)

        // backgroundGroup
        let backgroundGroup: CGRect = CGRect(x: rect.minX + floor(rect.width * 0.00716 + 0.5), y: rect.minY + floor(rect.height * 0.00716 - 0.4) + 0.9, width: floor(rect.width * 0.98353 + 0.4) - floor(rect.width * 0.00716 + 0.5) + 0.1, height: floor(rect.height * 0.98353 + 0.5) - floor(rect.height * 0.00716 - 0.4) - 0.9)

        // background Drawing
        let backgroundPath = UIBezierPath(ovalIn: CGRect(x: backgroundGroup.minX + floor(backgroundGroup.width * 0.00000 + 0.5), y: backgroundGroup.minY + floor(backgroundGroup.height * 0.00000 + 0.5), width: floor(backgroundGroup.width * 1.00000 + 0.4) - floor(backgroundGroup.width * 0.00000 + 0.5) + 0.1, height: floor(backgroundGroup.height * 1.00000 + 0.4) - floor(backgroundGroup.height * 0.00000 + 0.5) + 0.1))
        backgroundColor.setFill()
        backgroundPath.fill()

        // darkLeave01 Drawing
        let darkLeave01 = UIBezierPath()
        darkLeave01.move(to: CGPoint(x: backgroundGroup.minX + 0.30870 * backgroundGroup.width, y: backgroundGroup.minY + 0.54246 * backgroundGroup.height))
        darkLeave01.addCurve(to: CGPoint(x: backgroundGroup.minX + 0.19526 * backgroundGroup.width, y: backgroundGroup.minY + 0.53371 * backgroundGroup.height), controlPoint1: CGPoint(x: backgroundGroup.minX + 0.30625 * backgroundGroup.width, y: backgroundGroup.minY + 0.54989 * backgroundGroup.height), controlPoint2: CGPoint(x: backgroundGroup.minX + 0.25322 * backgroundGroup.width, y: backgroundGroup.minY + 0.55279 * backgroundGroup.height))
        darkLeave01.addCurve(to: CGPoint(x: backgroundGroup.minX + 0.09880 * backgroundGroup.width, y: backgroundGroup.minY + 0.47337 * backgroundGroup.height), controlPoint1: CGPoint(x: backgroundGroup.minX + 0.13730 * backgroundGroup.width, y: backgroundGroup.minY + 0.51463 * backgroundGroup.height), controlPoint2: CGPoint(x: backgroundGroup.minX + 0.09880 * backgroundGroup.width, y: backgroundGroup.minY + 0.47337 * backgroundGroup.height))
        darkLeave01.addCurve(to: CGPoint(x: backgroundGroup.minX + 0.21224 * backgroundGroup.width, y: backgroundGroup.minY + 0.48212 * backgroundGroup.height), controlPoint1: CGPoint(x: backgroundGroup.minX + 0.09880 * backgroundGroup.width, y: backgroundGroup.minY + 0.47337 * backgroundGroup.height), controlPoint2: CGPoint(x: backgroundGroup.minX + 0.15428 * backgroundGroup.width, y: backgroundGroup.minY + 0.46304 * backgroundGroup.height))
        darkLeave01.addCurve(to: CGPoint(x: backgroundGroup.minX + 0.30870 * backgroundGroup.width, y: backgroundGroup.minY + 0.54246 * backgroundGroup.height), controlPoint1: CGPoint(x: backgroundGroup.minX + 0.27020 * backgroundGroup.width, y: backgroundGroup.minY + 0.50119 * backgroundGroup.height), controlPoint2: CGPoint(x: backgroundGroup.minX + 0.31086 * backgroundGroup.width, y: backgroundGroup.minY + 0.53590 * backgroundGroup.height))
        darkLeave01.close()
        darkLeaveColor.setFill()
        darkLeave01.fill()

        // lightLeave01 Drawing
        let lightLeave01 = UIBezierPath()
        lightLeave01.move(to: CGPoint(x: backgroundGroup.minX + 0.23961 * backgroundGroup.width, y: backgroundGroup.minY + 0.60394 * backgroundGroup.height))
        lightLeave01.addCurve(to: CGPoint(x: backgroundGroup.minX + 0.30638 * backgroundGroup.width, y: backgroundGroup.minY + 0.55910 * backgroundGroup.height), controlPoint1: CGPoint(x: backgroundGroup.minX + 0.23766 * backgroundGroup.width, y: backgroundGroup.minY + 0.59700 * backgroundGroup.height), controlPoint2: CGPoint(x: backgroundGroup.minX + 0.26575 * backgroundGroup.width, y: backgroundGroup.minY + 0.57057 * backgroundGroup.height))
        lightLeave01.addCurve(to: CGPoint(x: backgroundGroup.minX + 0.38673 * backgroundGroup.width, y: backgroundGroup.minY + 0.56241 * backgroundGroup.height), controlPoint1: CGPoint(x: backgroundGroup.minX + 0.34700 * backgroundGroup.width, y: backgroundGroup.minY + 0.54763 * backgroundGroup.height), controlPoint2: CGPoint(x: backgroundGroup.minX + 0.38673 * backgroundGroup.width, y: backgroundGroup.minY + 0.56241 * backgroundGroup.height))
        lightLeave01.addCurve(to: CGPoint(x: backgroundGroup.minX + 0.31997 * backgroundGroup.width, y: backgroundGroup.minY + 0.60725 * backgroundGroup.height), controlPoint1: CGPoint(x: backgroundGroup.minX + 0.38673 * backgroundGroup.width, y: backgroundGroup.minY + 0.56241 * backgroundGroup.height), controlPoint2: CGPoint(x: backgroundGroup.minX + 0.36060 * backgroundGroup.width, y: backgroundGroup.minY + 0.59578 * backgroundGroup.height))
        lightLeave01.addCurve(to: CGPoint(x: backgroundGroup.minX + 0.23961 * backgroundGroup.width, y: backgroundGroup.minY + 0.60394 * backgroundGroup.height), controlPoint1: CGPoint(x: backgroundGroup.minX + 0.27934 * backgroundGroup.width, y: backgroundGroup.minY + 0.61872 * backgroundGroup.height), controlPoint2: CGPoint(x: backgroundGroup.minX + 0.24134 * backgroundGroup.width, y: backgroundGroup.minY + 0.61006 * backgroundGroup.height))
        lightLeave01.close()
        lightLeaveColor.setFill()
        lightLeave01.fill()

        // treeBranchePath Drawing
        let treeBranchePath = UIBezierPath()
        treeBranchePath.move(to: CGPoint(x: backgroundGroup.minX + 0.14721 * backgroundGroup.width, y: backgroundGroup.minY + 0.54284 * backgroundGroup.height))
        treeBranchePath.addCurve(to: CGPoint(x: backgroundGroup.minX + 0.98218 * backgroundGroup.width, y: backgroundGroup.minY + 0.62482 * backgroundGroup.height), controlPoint1: CGPoint(x: backgroundGroup.minX + 0.14721 * backgroundGroup.width, y: backgroundGroup.minY + 0.54284 * backgroundGroup.height), controlPoint2: CGPoint(x: backgroundGroup.minX + 0.53671 * backgroundGroup.width, y: backgroundGroup.minY + 0.53774 * backgroundGroup.height))
        branchenColor.setStroke()
        treeBranchePath.lineWidth = 9
        treeBranchePath.stroke()

        // lightLeave02 Drawing
        let lightLeave02 = UIBezierPath()
        lightLeave02.move(to: CGPoint(x: backgroundGroup.minX + 0.22383 * backgroundGroup.width, y: backgroundGroup.minY + 0.54302 * backgroundGroup.height))
        lightLeave02.addCurve(to: CGPoint(x: backgroundGroup.minX + 0.14097 * backgroundGroup.width, y: backgroundGroup.minY + 0.53663 * backgroundGroup.height), controlPoint1: CGPoint(x: backgroundGroup.minX + 0.22204 * backgroundGroup.width, y: backgroundGroup.minY + 0.54845 * backgroundGroup.height), controlPoint2: CGPoint(x: backgroundGroup.minX + 0.18331 * backgroundGroup.width, y: backgroundGroup.minY + 0.55057 * backgroundGroup.height))
        lightLeave02.addCurve(to: CGPoint(x: backgroundGroup.minX + 0.07052 * backgroundGroup.width, y: backgroundGroup.minY + 0.49256 * backgroundGroup.height), controlPoint1: CGPoint(x: backgroundGroup.minX + 0.09864 * backgroundGroup.width, y: backgroundGroup.minY + 0.52270 * backgroundGroup.height), controlPoint2: CGPoint(x: backgroundGroup.minX + 0.07052 * backgroundGroup.width, y: backgroundGroup.minY + 0.49256 * backgroundGroup.height))
        lightLeave02.addCurve(to: CGPoint(x: backgroundGroup.minX + 0.15338 * backgroundGroup.width, y: backgroundGroup.minY + 0.49895 * backgroundGroup.height), controlPoint1: CGPoint(x: backgroundGroup.minX + 0.07052 * backgroundGroup.width, y: backgroundGroup.minY + 0.49256 * backgroundGroup.height), controlPoint2: CGPoint(x: backgroundGroup.minX + 0.11104 * backgroundGroup.width, y: backgroundGroup.minY + 0.48501 * backgroundGroup.height))
        lightLeave02.addCurve(to: CGPoint(x: backgroundGroup.minX + 0.22383 * backgroundGroup.width, y: backgroundGroup.minY + 0.54302 * backgroundGroup.height), controlPoint1: CGPoint(x: backgroundGroup.minX + 0.19571 * backgroundGroup.width, y: backgroundGroup.minY + 0.51288 * backgroundGroup.height), controlPoint2: CGPoint(x: backgroundGroup.minX + 0.22540 * backgroundGroup.width, y: backgroundGroup.minY + 0.53823 * backgroundGroup.height))
        lightLeave02.close()
        lightLeaveColor.setFill()
        lightLeave02.fill()
    }
}
