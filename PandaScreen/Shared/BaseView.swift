//
//  BaseView.swift
//  PandaScreen
//
//  Created by Alyona Bedrosova on 07.09.2023.
//

import UIKit

class BaseView: UIView {
    
    let imageFont: TestImageView = {
        var image = TestImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()

    
    func setupImageConstraints() {
        NSLayoutConstraint.activate([
            imageFont.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3),
            imageFont.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    let openFullButton: CustomButton = {
        let button = CustomButton()
        button.setTitle("Open full", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerCurve = .circular
        button.titleLabel?.font = UIFont.systemFont(ofSize: 27)
        button.layer.cornerRadius = 18
        button.layer.borderColor = UIColor.indigoColor.cgColor
        button.layer.borderWidth = 3.0
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension BaseView {
    @objc func makeLayout() {
        addSubview(imageFont)
        addSubview(openFullButton)
        
        imageFont.translatesAutoresizingMaskIntoConstraints = false
        openFullButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            openFullButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            openFullButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            openFullButton.heightAnchor.constraint(equalToConstant: 56),
            openFullButton.widthAnchor.constraint(equalToConstant: 350)
        ])
    }
}
