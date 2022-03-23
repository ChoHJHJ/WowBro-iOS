//
//  DetailViewController.swift
//  WowBro
//
//  Created by HyunJoong on 2022/02/22.
//

import UIKit
import Kingfisher
import Alamofire

class DetailViewController: UIViewController {
    
    var name: String?
    var story: String?
    var sTitle: String?
    var detailImageUrl: String?
    var webUrl: String?
    var qrUrl: String?
    var theme: String?
    var qrAuth: Bool?
    
    @IBOutlet weak var qrButton: UIButton!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var tourName: UILabel!
    @IBOutlet weak var storyTitle: UILabel!
    @IBOutlet weak var tourStory: UITextView!
    @IBOutlet var detailImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        qrButton.roundButton()
        heartButton.roundButton()
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
    
    @IBAction func btnLike(_ sender: UIButton) {
        heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        let urlString = "http://192.168.0.9:3000/tourInfo/\(name!)"
        let encodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = URL(string: encodedString)!
        let alamo = AF.request(url, method: .patch,
                    encoding: URLEncoding.httpBody)
        
        alamo.responseJSON() {
            response in
            print("업데이트 성공")
            print(url)
        }
        
    }
    
    // 웹뷰로 세그웨이 URL 데이터 보내기
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is WebInfoViewController {
            let webVC = segue.destination as? WebInfoViewController
            webVC?.tourUrl = webUrl
        } else if segue.destination is QRViewController {
            if qrAuth! {
                let alert = UIAlertController(title: "QR인증 완료", message: "QR코드 인증을 완료하셨습니다.", preferredStyle: UIAlertController.Style.alert)
                let action = UIAlertAction(title: "OK", style: .default)
                alert.addAction(action)
                present(alert, animated: true, completion: nil)
            } else {
                let qrVC = segue.destination as? QRViewController
                qrVC?.themeName = theme
                qrVC?.qrString = qrUrl
                qrVC?.tourName = name
            }
        }
    }
}
