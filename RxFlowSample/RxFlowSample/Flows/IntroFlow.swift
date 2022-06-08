//
//  IntroFlow.swift
//  RxFlowSample
//
//  Created by Chad.H on 2022/06/08.
//

import RxFlow

final class IntroFlow: Flow {
    var root: Presentable {
        rootViewController
    }
    
    private let rootViewController = IntroViewController()
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }
        switch step {
        case .testStep:
            return .none
        default:
            return .none
        }
    }
}
