//
//  AppDelegate.swift
//  Chameleon
//
//  Created by Morten Gustafsson on 12/10/2019.
//  Copyright © 2019 com.mortengustafsson. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.window = UIWindow(frame: UIScreen.main.bounds)

        let cameraFeedService = CameraFeedService()
        let averageCameraFeedColorService = AverageCameraFeedColorService(from: cameraFeedService)
        let chameleonViewController = ChameleonViewController(averageColorService: averageCameraFeedColorService)

        self.window?.rootViewController = chameleonViewController
        self.window?.makeKeyAndVisible()

        return true
    }
}
