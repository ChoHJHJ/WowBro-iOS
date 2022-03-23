//
//  TourRankingTableViewCell.swift
//  WowBro
//
//  Created by HyunJoong on 2022/03/23.
//

import UIKit

class TourRankingTableViewCell: UITableViewCell {
    @IBOutlet var tourRankingLabel: UILabel!
    @IBOutlet var tourNameLabel: UILabel!
    @IBOutlet var tourPopularityLabel: UILabel!
    @IBOutlet var tourPhoto: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.layer.cornerRadius = 15
        tourPhoto.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0))
    }
}
