//
//  DetailViewController.swift
//  WowBro
//
//  Created by HyunJoong on 2022/02/22.
//

import UIKit

class DetailViewController: UIViewController {
    var tourDetail: TourDetail?
    var name: String?
    @IBOutlet weak var qrButton: UIButton!
    @IBOutlet weak var thumbButton: UIButton!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var tourName: UILabel!
    @IBOutlet weak var storyTitle: UILabel!
    @IBOutlet weak var tourStory: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        qrButton.roundButton()
        thumbButton.roundButton()
        infoButton.roundButton()
        tourStory.isEditable = false
        
        tourName.text = name
        storyTitle.text = tourDetail?.storyTitle
        tourStory.text = tourDetail?.tourStory
    }

}
