//
//  UIButton+Extension.swift
//  PandaScreen
//
//  Created by Alyona Bedrosova on 07.09.2023.
//

import UIKit

class CustomButton: UIButton {
    override var isEnabled: Bool {
        didSet {
            alpha = isEnabled ? 1.0 : 0.4
        }
    }
}
