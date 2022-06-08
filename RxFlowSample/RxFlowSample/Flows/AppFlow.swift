//
//  AppFlow.swift
//  RxFlowSample
//
//  Created by Chad.H on 2022/06/08.
//

import UIKit
import RxSwift
import RxCocoa
import RxFlow

final class AppFlow: Flow {
    
    var root: Presentable {
        rootViewController
    }
    
    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        return viewController
    }()
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }
        switch step {
        case .appLaunched:
            return doesAppLaunched()
        }
    }
    
    private func doesAppLaunched() -> FlowContributors {
        let introFlow = IntroFlow()
        Flows.use(introFlow, when: .created) { [weak self] flowRoot in
            self?.rootViewController.pushViewController(flowRoot, animated: false)
        }
        return .one(flowContributor: .contribute(withNextPresentable: introFlow, withNextStepper: OneStepper(withSingleStep: AppStep.appLaunched)))
    }
}

final class AppStepper: Stepper {
    
    let steps = PublishRelay<Step>()
    
    var initialStep: Step {
        AppStep.appLaunched
    }
}
