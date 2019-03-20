//
//  arrayCollectionViewCell.swift
//  TokenApp
//
//  Created by Sahilpasha on 2/15/19.
//  Copyright © 2019 Sahilpasha. All rights reserved.
//

import UIKit

class arrayCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var outerView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.outerView.round(enable: true, withRadius: 10)
    }
    
}

extension UIView {
    func round(enable: Bool = true, withRadius radius: CGFloat? = 5) {
        let cornerRadius = radius ?? bounds.height/2
        layer.cornerRadius = enable ? cornerRadius : 0
        layer.masksToBounds = enable
    }
}
