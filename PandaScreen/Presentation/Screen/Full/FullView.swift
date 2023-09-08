//
//  FullView.swift
//  PandaScreen
//
//  Created by Alyona Bedrosova on 07.09.2023.
//

import UIKit

class FullView: BaseView {
    
    override func makeLayout() {
        super.makeLayout()
        
        openFullButton.removeFromSuperview()
    }
    
    override func layoutSubviews() {
            super.layoutSubviews()
    
            imageFont.frame = bounds
        }
}

