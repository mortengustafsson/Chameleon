//
//  ChameleonViewController.swift
//  Chameleon
//
//  Created by Morten Gustafsson on 12/10/2019.
//  Copyright © 2019 com.mortengustafsson. All rights reserved.
//

import UIKit
import AVFoundation

class ChameleonViewController: UIViewController {

    private var chameleonView = ChameleonView()
    private var averageColorService: AverageColorServiceProtocol
    private var blinkTimer: Timer?
    private var getAverageColorTimer: Timer?

    init(averageColorService: AverageColorServiceProtocol) {
        self.averageColorService = averageColorService
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(chameleonView)
        setupConstraints()

        startTimers()
    }

    private func startTimers() {
        // Blink the eye of the chameleon every 5th. second.
        blinkTimer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(blink), userInfo: nil, repeats: true)

        // Get the average color form the camera feed every 4th. second.
        getAverageColorTimer = Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(changeColor), userInfo: nil, repeats: true)
    }

    private func setupConstraints() {
        chameleonView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            chameleonView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chameleonView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            chameleonView.widthAnchor.constraint(equalToConstant: Layout.ChameleonView.size.width),
            chameleonView.heightAnchor.constraint(equalToConstant: Layout.ChameleonView.size.height)
            ])
    }

    @objc private func blink() {
        chameleonView.blink = true
    }

    @objc func changeColor(){
        guard let nextColor = averageColorService.getColor() else { return }
        self.chameleonView.chameleonColor = nextColor
    }

    deinit {
        blinkTimer = nil
        getAverageColorTimer = nil
    }
}

extension ChameleonViewController {
    private struct Layout {
        struct ChameleonView {
            static let size = CGSize(width: 140, height: 140)
        }
    }
}
