//
//  SideMenuViewController.swift
//  WowBro
//
//  Created by HyunJoong on 2022/02/23.
//

import UIKit
import Alamofire
import SwiftyJSON

class SideMenuViewController: UIViewController {
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet var userIdLabel: UILabel!
    @IBOutlet var nickNameLabel: UILabel!
    
    var currentId: String?
    
    override func viewDidLoad() {
        photo.layer.cornerRadius = 30
        
        let preferences = UserDefaults.standard

        if preferences.object(forKey: "insertedId") == nil {
            print("Doesn't exist!")
        } else {
            currentId = preferences.string(forKey: "insertedId")
        }
        
        let urlString = "http://localhost:3000/userInfo/\(currentId!)"
        let encodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = URL(string: encodedString)!
        let alamo = AF.request(url, method: .get, encoding: JSONEncoding.default)
        alamo.validate().responseJSON { response in
            switch response.result {
            case .success(_):
                if let json = try? JSON(data: response.data!) {
                    let result = json
                    self.userIdLabel.text = result[0]["userID"].stringValue
                    self.nickNameLabel.text = result[0]["userNickName"].stringValue + "님"
                }
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
    
    @IBAction func dismiss(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
