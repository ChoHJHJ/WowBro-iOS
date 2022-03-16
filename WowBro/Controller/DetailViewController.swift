//
//  DetailViewController.swift
//  WowBro
//
//  Created by HyunJoong on 2022/02/22.
//

import UIKit

class DetailViewController: UIViewController {
    
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
        storyTitle.text = ""
        tourStory.text = ""
    }
    
    // 웹뷰로 세그웨이 URL 데이터 보내기
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is WebInfoViewController {
            let webVC = segue.destination as? WebInfoViewController
            webVC?.tourUrl = nil
        }
    }
}
