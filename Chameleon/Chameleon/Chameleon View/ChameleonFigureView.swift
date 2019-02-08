//
//  chameleonGroupFigure.swift
//  chameleonGroup
//
//  Created by Morten Gustafsson on 08/02/2019.
//  Copyright © 2019 com.mortengustafsson. All rights reserved.
//

import UIKit

class ChameleonFigureView: UIView {
    private var bodyLayer = CAShapeLayer()
    private let eyeLayer = CAShapeLayer()
    private let irisLayer = CAShapeLayer()
    private let eyeHolderLayer = CALayer()
    private var previousColor: UIColor = .black

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public var shouldBlink: Bool = false {
        didSet {
            guard shouldBlink else { return }
            animateEyeBlink()
        }
    }

    public var bodyColor: UIColor = .black {
        didSet {
            animateColorChange()
        }
    }

    private func animateEyeBlink(){
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 1
        opacityAnimation.toValue = 0
        opacityAnimation.duration = 0.15
        opacityAnimation.autoreverses = true
        eyeHolderLayer.add(opacityAnimation, forKey: "opacity")
    }

    private func animateColorChange(){
        let colorAnimation = CABasicAnimation(keyPath: "fillColor")
        colorAnimation.fromValue = previousColor.cgColor
        colorAnimation.toValue = bodyColor.cgColor
        colorAnimation.duration = 4.0
        colorAnimation.fillMode = CAMediaTimingFillMode.forwards
        colorAnimation.isRemovedOnCompletion = false
        bodyLayer.add(colorAnimation, forKey: "fillColor")
        previousColor = bodyColor
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        // Color Declarations
        let irisColor: UIColor = .black
        let eyeColor: UIColor = .white

        let chameleonGroup: CGRect = CGRect(x: rect.minX + floor(rect.width * 0.20941 - 0.24) + 0.74, y: rect.minY + floor(rect.height * 0.22653 + 0.34) + 0.16, width: floor(rect.width * 0.82783 - 0.36) - floor(rect.width * 0.20941 - 0.24) + 0.12, height: floor(rect.height * 0.78244 + 0.42) - floor(rect.height * 0.22653 + 0.34) - 0.07)

        // Chemeleon Drawing
        let chemeleonPath = UIBezierPath()
        chemeleonPath.move(to: CGPoint(x: chameleonGroup.minX + 0.75720 * chameleonGroup.width, y: chameleonGroup.minY + 0.14105 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.37505 * chameleonGroup.width, y: chameleonGroup.minY + 0.11635 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 0.63484 * chameleonGroup.width, y: chameleonGroup.minY + 0.07357 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.52961 * chameleonGroup.width, y: chameleonGroup.minY + 0.05800 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.20932 * chameleonGroup.width, y: chameleonGroup.minY + 0.01093 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 0.37830 * chameleonGroup.width, y: chameleonGroup.minY + 0.08240 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.31890 * chameleonGroup.width, y: chameleonGroup.minY + -0.03623 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.08716 * chameleonGroup.width, y: chameleonGroup.minY + 0.08969 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 0.10978 * chameleonGroup.width, y: chameleonGroup.minY + -0.02752 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.08716 * chameleonGroup.width, y: chameleonGroup.minY + 0.08969 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.00139 * chameleonGroup.width, y: chameleonGroup.minY + 0.22679 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 0.08716 * chameleonGroup.width, y: chameleonGroup.minY + 0.08969 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.01014 * chameleonGroup.width, y: chameleonGroup.minY + 0.18586 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.02245 * chameleonGroup.width, y: chameleonGroup.minY + 0.27357 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + -0.00441 * chameleonGroup.width, y: chameleonGroup.minY + 0.25425 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.00897 * chameleonGroup.width, y: chameleonGroup.minY + 0.26536 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.22320 * chameleonGroup.width, y: chameleonGroup.minY + 0.29354 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 0.10544 * chameleonGroup.width, y: chameleonGroup.minY + 0.24429 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.17044 * chameleonGroup.width, y: chameleonGroup.minY + 0.27139 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.29402 * chameleonGroup.width, y: chameleonGroup.minY + 0.31356 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 0.25072 * chameleonGroup.width, y: chameleonGroup.minY + 0.30506 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.27441 * chameleonGroup.width, y: chameleonGroup.minY + 0.31495 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.30710 * chameleonGroup.width, y: chameleonGroup.minY + 0.32643 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 0.30077 * chameleonGroup.width, y: chameleonGroup.minY + 0.31296 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.30675 * chameleonGroup.width, y: chameleonGroup.minY + 0.31881 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.29570 * chameleonGroup.width, y: chameleonGroup.minY + 0.34102 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 0.30764 * chameleonGroup.width, y: chameleonGroup.minY + 0.33395 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.30241 * chameleonGroup.width, y: chameleonGroup.minY + 0.34042 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.21444 * chameleonGroup.width, y: chameleonGroup.minY + 0.31922 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 0.27073 * chameleonGroup.width, y: chameleonGroup.minY + 0.34278 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.24472 * chameleonGroup.width, y: chameleonGroup.minY + 0.33177 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.03833 * chameleonGroup.width, y: chameleonGroup.minY + 0.29736 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 0.16718 * chameleonGroup.width, y: chameleonGroup.minY + 0.29946 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.10944 * chameleonGroup.width, y: chameleonGroup.minY + 0.27575 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.37760 * chameleonGroup.width, y: chameleonGroup.minY + 0.44498 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 0.07644 * chameleonGroup.width, y: chameleonGroup.minY + 0.42968 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.23700 * chameleonGroup.width, y: chameleonGroup.minY + 0.50972 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.47509 * chameleonGroup.width, y: chameleonGroup.minY + 0.47851 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 0.40396 * chameleonGroup.width, y: chameleonGroup.minY + 0.45310 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.43799 * chameleonGroup.width, y: chameleonGroup.minY + 0.46598 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.45892 * chameleonGroup.width, y: chameleonGroup.minY + 0.52633 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 0.48194 * chameleonGroup.width, y: chameleonGroup.minY + 0.48071 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.47043 * chameleonGroup.width, y: chameleonGroup.minY + 0.50353 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.35748 * chameleonGroup.width, y: chameleonGroup.minY + 0.54071 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 0.45491 * chameleonGroup.width, y: chameleonGroup.minY + 0.53418 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.36064 * chameleonGroup.width, y: chameleonGroup.minY + 0.53374 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.44324 * chameleonGroup.width, y: chameleonGroup.minY + 0.57408 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 0.35145 * chameleonGroup.width, y: chameleonGroup.minY + 0.55399 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.43896 * chameleonGroup.width, y: chameleonGroup.minY + 0.56293 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.42554 * chameleonGroup.width, y: chameleonGroup.minY + 0.64869 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 0.44737 * chameleonGroup.width, y: chameleonGroup.minY + 0.58532 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.42171 * chameleonGroup.width, y: chameleonGroup.minY + 0.62575 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.49169 * chameleonGroup.width, y: chameleonGroup.minY + 0.62975 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 0.42804 * chameleonGroup.width, y: chameleonGroup.minY + 0.66402 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.47349 * chameleonGroup.width, y: chameleonGroup.minY + 0.65981 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.49007 * chameleonGroup.width, y: chameleonGroup.minY + 0.56445 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 0.50086 * chameleonGroup.width, y: chameleonGroup.minY + 0.61466 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.48202 * chameleonGroup.width, y: chameleonGroup.minY + 0.57613 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.53858 * chameleonGroup.width, y: chameleonGroup.minY + 0.49810 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 0.51450 * chameleonGroup.width, y: chameleonGroup.minY + 0.52948 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.53607 * chameleonGroup.width, y: chameleonGroup.minY + 0.49731 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.59062 * chameleonGroup.width, y: chameleonGroup.minY + 0.51015 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 0.55599 * chameleonGroup.width, y: chameleonGroup.minY + 0.50282 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.57354 * chameleonGroup.width, y: chameleonGroup.minY + 0.50701 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.69320 * chameleonGroup.width, y: chameleonGroup.minY + 0.52584 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 0.62619 * chameleonGroup.width, y: chameleonGroup.minY + 0.51681 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.66104 * chameleonGroup.width, y: chameleonGroup.minY + 0.52127 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.70456 * chameleonGroup.width, y: chameleonGroup.minY + 0.56367 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 0.69739 * chameleonGroup.width, y: chameleonGroup.minY + 0.52628 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.70096 * chameleonGroup.width, y: chameleonGroup.minY + 0.54370 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.64300 * chameleonGroup.width, y: chameleonGroup.minY + 0.57946 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 0.70629 * chameleonGroup.width, y: chameleonGroup.minY + 0.57269 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.64143 * chameleonGroup.width, y: chameleonGroup.minY + 0.57048 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.71974 * chameleonGroup.width, y: chameleonGroup.minY + 0.62556 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 0.64642 * chameleonGroup.width, y: chameleonGroup.minY + 0.59793 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.70343 * chameleonGroup.width, y: chameleonGroup.minY + 0.59959 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.73969 * chameleonGroup.width, y: chameleonGroup.minY + 0.71820 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 0.73625 * chameleonGroup.width, y: chameleonGroup.minY + 0.65139 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.72593 * chameleonGroup.width, y: chameleonGroup.minY + 0.70813 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.78754 * chameleonGroup.width, y: chameleonGroup.minY + 0.66730 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 0.74738 * chameleonGroup.width, y: chameleonGroup.minY + 0.72370 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.78768 * chameleonGroup.width, y: chameleonGroup.minY + 0.70428 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.74724 * chameleonGroup.width, y: chameleonGroup.minY + 0.53432 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 0.78720 * chameleonGroup.width, y: chameleonGroup.minY + 0.61338 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.74438 * chameleonGroup.width, y: chameleonGroup.minY + 0.53382 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.83771 * chameleonGroup.width, y: chameleonGroup.minY + 0.56914 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 0.78632 * chameleonGroup.width, y: chameleonGroup.minY + 0.54163 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.81802 * chameleonGroup.width, y: chameleonGroup.minY + 0.55122 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.57492 * chameleonGroup.width, y: chameleonGroup.minY + 0.94087 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 0.91045 * chameleonGroup.width, y: chameleonGroup.minY + 0.63598 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.78309 * chameleonGroup.width, y: chameleonGroup.minY + 0.97217 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.46813 * chameleonGroup.width, y: chameleonGroup.minY + 0.76367 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 0.46173 * chameleonGroup.width, y: chameleonGroup.minY + 0.92377 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.44357 * chameleonGroup.width, y: chameleonGroup.minY + 0.81575 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.60063 * chameleonGroup.width, y: chameleonGroup.minY + 0.71440 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 0.49227 * chameleonGroup.width, y: chameleonGroup.minY + 0.71225 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.55948 * chameleonGroup.width, y: chameleonGroup.minY + 0.69724 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.61652 * chameleonGroup.width, y: chameleonGroup.minY + 0.80241 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 0.64181 * chameleonGroup.width, y: chameleonGroup.minY + 0.73144 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.64106 * chameleonGroup.width, y: chameleonGroup.minY + 0.77720 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.60604 * chameleonGroup.width, y: chameleonGroup.minY + 0.81134 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 0.61327 * chameleonGroup.width, y: chameleonGroup.minY + 0.80567 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.60969 * chameleonGroup.width, y: chameleonGroup.minY + 0.80868 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.58003 * chameleonGroup.width, y: chameleonGroup.minY + 0.79115 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 0.60036 * chameleonGroup.width, y: chameleonGroup.minY + 0.80132 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.59107 * chameleonGroup.width, y: chameleonGroup.minY + 0.79379 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.53113 * chameleonGroup.width, y: chameleonGroup.minY + 0.82616 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 0.55774 * chameleonGroup.width, y: chameleonGroup.minY + 0.78582 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.53588 * chameleonGroup.width, y: chameleonGroup.minY + 0.80155 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.56277 * chameleonGroup.width, y: chameleonGroup.minY + 0.88060 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 0.52635 * chameleonGroup.width, y: chameleonGroup.minY + 0.85095 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.54048 * chameleonGroup.width, y: chameleonGroup.minY + 0.87527 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.60961 * chameleonGroup.width, y: chameleonGroup.minY + 0.85206 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 0.58283 * chameleonGroup.width, y: chameleonGroup.minY + 0.88539 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.60243 * chameleonGroup.width, y: chameleonGroup.minY + 0.87279 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.64379 * chameleonGroup.width, y: chameleonGroup.minY + 0.84003 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 0.62090 * chameleonGroup.width, y: chameleonGroup.minY + 0.85165 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.63278 * chameleonGroup.width, y: chameleonGroup.minY + 0.84841 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.63127 * chameleonGroup.width, y: chameleonGroup.minY + 0.68737 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 0.68826 * chameleonGroup.width, y: chameleonGroup.minY + 0.80668 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.69489 * chameleonGroup.width, y: chameleonGroup.minY + 0.72957 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.42142 * chameleonGroup.width, y: chameleonGroup.minY + 0.75840 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 0.56011 * chameleonGroup.width, y: chameleonGroup.minY + 0.64001 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.44214 * chameleonGroup.width, y: chameleonGroup.minY + 0.66814 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.58608 * chameleonGroup.width, y: chameleonGroup.minY + 0.99611 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 0.40082 * chameleonGroup.width, y: chameleonGroup.minY + 0.84871 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.45530 * chameleonGroup.width, y: chameleonGroup.minY + 0.97336 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.99327 * chameleonGroup.width, y: chameleonGroup.minY + 0.63406 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 0.78058 * chameleonGroup.width, y: chameleonGroup.minY + 1.02966 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.96146 * chameleonGroup.width, y: chameleonGroup.minY + 0.84085 * chameleonGroup.height))
        chemeleonPath.addCurve(to: CGPoint(x: chameleonGroup.minX + 0.75720 * chameleonGroup.width, y: chameleonGroup.minY + 0.14105 * chameleonGroup.height), controlPoint1: CGPoint(x: chameleonGroup.minX + 1.02011 * chameleonGroup.width, y: chameleonGroup.minY + 0.45903 * chameleonGroup.height), controlPoint2: CGPoint(x: chameleonGroup.minX + 0.97162 * chameleonGroup.width, y: chameleonGroup.minY + 0.25881 * chameleonGroup.height))
        chemeleonPath.close()

        let maskLayer = CAShapeLayer()

        bodyLayer.path = chemeleonPath.cgPath
        maskLayer.path = chemeleonPath.cgPath

        bodyLayer.fillColor = bodyColor.cgColor
        bodyLayer.fillRule = CAShapeLayerFillRule.evenOdd
        layer.addSublayer(bodyLayer)

        maskLayer.fillRule = CAShapeLayerFillRule.evenOdd
        layer.mask = maskLayer

        // Eye Drawing
        let eyePath = UIBezierPath(ovalIn: CGRect(x: chameleonGroup.minX + floor(chameleonGroup.width * 0.16405 - 0.01) + 0.51, y: chameleonGroup.minY + floor(chameleonGroup.height * 0.09137 + 0.46) + 0.04, width: floor(chameleonGroup.width * 0.31687 + 0.39) - floor(chameleonGroup.width * 0.16405 - 0.01) - 0.4, height: floor(chameleonGroup.height * 0.26138 - 0.14) - floor(chameleonGroup.height * 0.09137 + 0.46) + 0.6))
        eyePath.fill()

        eyeLayer.path = eyePath.cgPath
        eyeLayer.fillColor = eyeColor.cgColor
        eyeHolderLayer.addSublayer(eyeLayer)

        // Iris Drawing
        let irisPath = UIBezierPath(ovalIn: CGRect(x: chameleonGroup.minX + floor(chameleonGroup.width * 0.24663 - 0.41) + 0.91, y: chameleonGroup.minY + floor(chameleonGroup.height * 0.14697 + 0.31) + 0.19, width: floor(chameleonGroup.width * 0.29102 + 0.09) - floor(chameleonGroup.width * 0.24663 - 0.41) - 0.5, height: floor(chameleonGroup.height * 0.20063 - 0.19) - floor(chameleonGroup.height * 0.14697 + 0.31) + 0.5))
        irisPath.fill()

        irisLayer.path = irisPath.cgPath
        irisLayer.fillColor = irisColor.cgColor
        eyeHolderLayer.addSublayer(irisLayer)

        layer.addSublayer(eyeHolderLayer)
    }
}
