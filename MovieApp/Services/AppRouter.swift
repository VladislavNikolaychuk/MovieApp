//
//  AppRouter.swift
//  MovieApp
//
//  Created by Vladislav Nikolaychuk on 11.02.2022.
//

import UIKit

final class AppRouter {
    
    static func runOnLoadFlow() {
        AppRouter.runMainFlow()
    }
    
    static func runMainFlow() {
        let mainController = MovieConfigurator.create()
        let navigation = UINavigationController(rootViewController: mainController)
        changeFlowTo(controller: navigation)
    }
    
    static private func runFadeAnimationForWindow(_ window: UIWindow?) {
        guard let window = UIApplication.shared.keyWindow else {return}
        let options: UIView.AnimationOptions = .transitionCrossDissolve
        let duration: TimeInterval = 0.5
        UIView.transition(with: window, duration: duration,
                          options: options, animations: {},
                          completion: { _ in })
    }
    
    static func changeFlowTo(controller: UIViewController) {
        let window = UIApplication.shared.keyWindow
        window?.rootViewController = controller
        runFadeAnimationForWindow(window)
    }
}
