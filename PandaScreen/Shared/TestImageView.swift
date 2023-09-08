//
//  Test.swift
//  PandaScreen
//
//  Created by Alyona Bedrosova on 07.09.2023.
//

import Foundation
import UIKit


final class TestImageView: UIImageView {
    
    private var innerImageView: UIImageView?
    
    private var realContentSize: CGSize {
        var size = bounds.size
        
        guard let image = image else { return size }
        
        let scaleX = size.width / image.size.width
        let scaleY = size.height / image.size.height
        
        switch contentMode {
        case .scaleAspectFill:
            let scale = max(scaleX, scaleY)
            size = CGSize(width: image.size.width * scale, height: image.size.height * scale)
            
        case .scaleAspectFit:
            let scale = min(scaleX, scaleY)
            size = CGSize(width: image.size.width * scale, height: image.size.height * scale)
            
        case .scaleToFill:
            size = CGSize(width: image.size.width * scaleX, height: image.size.height * scaleY)
            
        default:
            size = image.size
        }
        
        return size
    }
    
    override var image: UIImage? {
        set {
            innerImageView?.image = newValue
            setNeedsLayout()
        }
        get {
            return innerImageView?.image
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public override init(image: UIImage?) {
        super.init(image: image)
        setup(image: image)
    }
    
    public override init(image: UIImage?, highlightedImage: UIImage?) {
        super.init(image: image, highlightedImage: highlightedImage)
        setup(image: image, highlightedImage: highlightedImage)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup(image: UIImage? = nil, highlightedImage: UIImage? = nil) {
        innerImageView = UIImageView(image: image ?? super.image, highlightedImage: highlightedImage ?? super.highlightedImage)
        innerImageView?.frame = bounds
        innerImageView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        innerImageView?.contentMode = contentMode
        addSubview(innerImageView!)
    }
    
    private func updateLayout() {
        let realSize = realContentSize
        var realFrame = CGRect(
            origin: CGPoint(
                x: (bounds.size.width - realSize.width) / 2.0,
                y: (bounds.size.height - realSize.height) / 2.0),
            size: realSize
        )
        
        realFrame.origin.x = 0.0
        
        innerImageView?.frame = realFrame.integral
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutIfNeeded()
        updateLayout()
    }
    
}

