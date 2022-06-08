//
//  IntroViewController.swift
//  RxFlowSample
//
//  Created by Chad.H on 2022/06/08.
//

import UIKit

final class IntroViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Main"
        view.backgroundColor = .systemBackground
        setupUI()
    }
    
    private func setupUI() {
        let button = UIButton(configuration: .borderedTinted(), primaryAction: buttonAction)
        button.setTitle("go Next!", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private var buttonAction: UIAction {
        UIAction(handler: { _ in
            print("dododoo")
        })
    }
}
