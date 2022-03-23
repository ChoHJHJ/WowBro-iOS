//
//  TourTableViewCell.swift
//  WowBro
//
//  Created by HyunJoong on 2022/02/22.
//

import UIKit

class TourTableViewCell: UITableViewCell {
    @IBOutlet weak var tourPhoto: UIImageView!
    @IBOutlet weak var tourName: UILabel!
    @IBOutlet weak var tourAddress: UILabel!
    @IBOutlet var tourStamp: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tourAddress.numberOfLines = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
