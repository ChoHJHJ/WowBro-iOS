//
//  ViewController.swift
//  WowBro
//
//  Created by HyunJoong on 2022/02/21.
//

import UIKit
import Alamofire
import SwiftyJSON
import Toast_Swift

class ViewController: UIViewController {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var joinButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var appleLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewInit()
    }
    
    // 로그인 뷰의 초기화 함수
    func viewInit() {
        mainView.roundCorners(cornerRadius: 50, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        idTextField.textFieldBorder()
        passwordTextField.textFieldBorder()
        loginButton.layer.cornerRadius = 20
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        if let insertedId = idTextField.text, let insertedPassword = passwordTextField.text {
            if (insertedId == "" || insertedPassword == "") {
                let alert = UIAlertController(title: "입력 오류", message: "ID와 비밀번호 모두 입력해주세요.", preferredStyle: UIAlertController.Style.alert)
                let action = UIAlertAction(title: "OK", style: .default)
                alert.addAction(action)
                present(alert, animated: true, completion: nil)
            } else {
                let urlString = "http://localhost:3000/userInfo/\(insertedId)"
                let encodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
                let url = URL(string: encodedString)!
                let alamo = AF.request(url, method: .get, encoding: JSONEncoding.default)
                alamo.validate().responseJSON { response in
                    switch response.result {
                    case .success(_):
                        if let json = try? JSON(data: response.data!) {
                            let result = json
                            if result.count != 1 {
                                let alert = UIAlertController(title: "없는 ID", message: "입력하신 ID가 존재하지 않습니다.", preferredStyle: UIAlertController.Style.alert)
                                let action = UIAlertAction(title: "OK", style: .default)
                                alert.addAction(action)
                                self.present(alert, animated: true, completion: nil)
                            } else {
                                if (insertedPassword != result[0]["userPassword"].stringValue) {
                                    let alert = UIAlertController(title: "틀린 비밀번호", message: "비밀번호가 틀렸습니다.", preferredStyle: UIAlertController.Style.alert)
                                    let action = UIAlertAction(title: "OK", style: .default)
                                    alert.addAction(action)
                                    self.present(alert, animated: true, completion: nil)
                                } else {
                                    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                                    guard let mainViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController" ) as? MainViewController else { return }
                                    
                                    self.show(mainViewController, sender: nil)
                                    
                                    let preferences = UserDefaults.standard
                                    preferences.set(insertedId, forKey: "insertedId")
                                }
                            }
                        }
                    case .failure(let error):
                        debugPrint(error)
                    }
                }
            }
        }
    }
}
