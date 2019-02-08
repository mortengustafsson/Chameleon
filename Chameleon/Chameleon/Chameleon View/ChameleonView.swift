//
//  ChameleonView.swift
//  Chameleon
//
//  Created by Morten Gustafsson on 08/02/2019.
//  Copyright © 2019 com.mortengustafsson. All rights reserved.
//

import UIKit

class ChameleonView: UIView {

    private let backgroundView = ChameleonBackgroundView()
    private let chameleonFigureView = ChameleonFigureView()
    private let forgroundView = ChameleonForgroundView()

    public var chameleonColor: UIColor = .black {
        didSet {
            chameleonFigureView.bodyColor = chameleonColor
        }
    }

    public var blink = false {
        didSet {
            chameleonFigureView.shouldBlink = blink
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        backgroundColor = .clear

        addSubview(backgroundView)
        addSubview(chameleonFigureView)
        addSubview(forgroundView)

        setupConstraints()
    }

    private func setupConstraints() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        chameleonFigureView.translatesAutoresizingMaskIntoConstraints = false
        forgroundView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),

            chameleonFigureView.leadingAnchor.constraint(equalTo: leadingAnchor),
            chameleonFigureView.topAnchor.constraint(equalTo: topAnchor),
            chameleonFigureView.trailingAnchor.constraint(equalTo: trailingAnchor),
            chameleonFigureView.bottomAnchor.constraint(equalTo: bottomAnchor),

            forgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            forgroundView.topAnchor.constraint(equalTo: topAnchor),
            forgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            forgroundView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }
}
