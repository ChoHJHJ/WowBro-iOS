//
//  ImageCell.swift
//  WowBro
//
//  Created by HyunJoong on 2022/02/26.
//

import UIKit

class ImageCell: UICollectionViewCell {
    @IBOutlet var themeImageView: UIImageView!
    @IBOutlet var themeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.cornerRadius = 20
    }

}
