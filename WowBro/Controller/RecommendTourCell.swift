//
//  RecommendTourCell.swift
//  WowBro
//
//  Created by HyunJoong on 2022/02/28.
//

import UIKit

class RecommendTourCell: UITableViewCell {
    @IBOutlet var RecommendTourImageView: UIImageView!
    @IBOutlet var RecommendTourName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0))
    }
    
}
