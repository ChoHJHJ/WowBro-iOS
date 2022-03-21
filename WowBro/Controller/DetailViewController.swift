//
//  DetailViewController.swift
//  WowBro
//
//  Created by HyunJoong on 2022/02/22.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    var name: String?
    var story: String?
    var sTitle: String?
    var detailImageUrl: String?
    var webUrl: String?
    var qrUrl: String?
    var theme: String?
    
    @IBOutlet weak var qrButton: UIButton!
    @IBOutlet weak var thumbButton: UIButton!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var tourName: UILabel!
    @IBOutlet weak var storyTitle: UILabel!
    @IBOutlet weak var tourStory: UITextView!
    @IBOutlet var detailImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        qrButton.roundButton()
        thumbButton.roundButton()
        infoButton.roundButton()
        tourStory.isEditable = false
        
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont(name: "S-Core Dream", size: 20)!, NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        self.navigationItem.title = name
        tourName.text = name
        storyTitle.text = sTitle
        tourStory.text = story
        let url = URL(string: detailImageUrl ?? "")
        detailImage?.kf.setImage(with: url)
    }
    
    // 웹뷰로 세그웨이 URL 데이터 보내기
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is WebInfoViewController {
            let webVC = segue.destination as? WebInfoViewController
            webVC?.tourUrl = webUrl
        } else if segue.destination is QRViewController {
            let qrVC = segue.destination as? QRViewController
            qrVC?.themeName = theme
            qrVC?.qrString = qrUrl
            qrVC?.tourName = name
        }
    }
}
