//
//  MainView2.swift
//  PandaScreen
//
//  Created by Alyona Bedrosova on 07.09.2023.
//

import UIKit

class MainView: BaseView {
    
    func makeCustomButton(title: String) -> CustomButton {
        let button = CustomButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = UIFont.systemFont(ofSize: 26)
        button.layer.cornerCurve = .circular
        button.layer.cornerRadius = 18
        button.layer.borderColor = UIColor.indigoColor.cgColor
        button.layer.borderWidth = 3.0
        return button
    }
    
    lazy var lockButton: CustomButton = {
        let button = makeCustomButton(title: "Lock")
        return button
    }()
    
    lazy var openButton: CustomButton = {
        let button = makeCustomButton(title: "Open from top")
        return button
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    
    override func makeLayout() {
        super.makeLayout()
        
        stackView.addArrangedSubview(lockButton)
        stackView.addArrangedSubview(openButton)
        addSubview(stackView)
        
        lockButton.translatesAutoresizingMaskIntoConstraints = false
        openButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageFont.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageFont.topAnchor.constraint(equalTo: topAnchor, constant: 70),
            
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.topAnchor.constraint(equalTo: imageFont.bottomAnchor, constant: 8),
            
            lockButton.heightAnchor.constraint(equalToConstant: 56),
            lockButton.widthAnchor.constraint(equalToConstant: 170),
            openButton.heightAnchor.constraint(equalToConstant: 56),
            openButton.widthAnchor.constraint(equalToConstant: 170)
        ])
        
        setupImageConstraints()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageFont.image = UIImage(named: "panda")
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
