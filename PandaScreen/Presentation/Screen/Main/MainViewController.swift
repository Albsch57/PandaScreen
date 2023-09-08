//
//  ViewController.swift
//  PandaScreen
//
//  Created by Alyona Bedrosova on 07.09.2023.
//

import UIKit

class MainViewController: UIViewController {

    private var cardView: MainView {
        view as! MainView
    }
    
    override func loadView() {
        view = MainView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
        cardView.lockButton.addTarget(self, action: #selector(lockButtonTapped), for: .touchUpInside)
        cardView.openButton.addTarget(self, action: #selector(openButtonTapped), for: .touchUpInside)
        cardView.openFullButton.addTarget(self, action: #selector(fullButtonTapped), for: .touchUpInside)
    }
}

extension MainViewController {
    
    @objc
    private func lockButtonTapped() {
        cardView.openButton.isEnabled = !cardView.openButton.isEnabled
        if cardView.openButton.isEnabled {
            cardView.lockButton.setTitle("Lock", for: .normal)
        } else {
            cardView.lockButton.setTitle("Unlock", for: .normal)
        }
    }
    
    
    @objc
    private func openButtonTapped() {
        let fromTopViewController = FromTopViewController()
        fromTopViewController.modalTransitionStyle = .coverVertical
        fromTopViewController.backgroundImage = cardView.imageFont
        present(fromTopViewController, animated: true, completion: nil)
    }
    
    @objc
    private func fullButtonTapped() {
        
        let fullViewController = FullViewController()
        fullViewController.modalTransitionStyle = .coverVertical
        
        fullViewController.backgroundImage = cardView.imageFont
        
        present(fullViewController, animated: true, completion: nil)
    }
}

