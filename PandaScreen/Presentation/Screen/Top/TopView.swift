//
//  TopView2.swift
//  PandaScreen
//
//  Created by Alyona Bedrosova on 07.09.2023.
//

import UIKit

class TopView: BaseView {

    override func makeLayout() {
        super.makeLayout()
        
        NSLayoutConstraint.activate([
            imageFont.topAnchor.constraint(equalTo: topAnchor),
            imageFont.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageFont.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
