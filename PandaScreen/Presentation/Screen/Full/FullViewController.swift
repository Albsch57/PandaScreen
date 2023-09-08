//
//  FullViewController.swift
//  PandaScreen
//
//  Created by Alyona Bedrosova on 07.09.2023.
//

import UIKit

class FullViewController: UIViewController {
    
    var backgroundImage: UIImageView?
    
    private var cardView: FullView {
        view as! FullView
    }
    
    override func loadView() {
        view = FullView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let backgroundImage = backgroundImage {
            cardView.imageFont.image = backgroundImage.image
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupCloseButton()
    }
}

extension FullViewController {
    func setupCloseButton() {
        
        let closeButton = UIButton()
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            closeButton.widthAnchor.constraint(equalToConstant: 32),
            closeButton.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        closeButton.layer.cornerRadius = 16
        closeButton.backgroundColor = UIColor.gray
        closeButton.contentEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        
        let xmarkImage = UIImage(systemName: "xmark")
        closeButton.setImage(xmarkImage, for: .normal)
        
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        closeButton.tintColor = UIColor.white
    }
    
    @objc
    private func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}
