//
//  SceneDelegate.swift
//  RxFlowSample
//
//  Created by Chad.H on 2022/06/08.
//

import UIKit
import RxSwift
import RxCocoa
import RxFlow

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private let coordinator = FlowCoordinator()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let flow = AppFlow()
        coordinator.coordinate(flow: flow, with: AppStepper())
        Flows.use(flow, when: .created) { [weak self] flowRoot in
            self?.window?.backgroundColor = .systemBackground
            self?.window?.rootViewController = flowRoot
            self?.window?.makeKeyAndVisible()
        }
    }
}
