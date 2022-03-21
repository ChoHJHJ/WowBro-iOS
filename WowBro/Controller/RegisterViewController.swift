//
//  RegisterViewController.swift
//  WowBro
//
//  Created by HyunJoong on 2022/02/21.
//

import UIKit
import Alamofire
import Toast_Swift

class RegisterViewController: UIViewController {
    @IBOutlet weak var registerView: UIView!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var password2TextField: UITextField!
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    func initView() {
        registerView.roundCorners(cornerRadius: 50, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont(name: "S-Core Dream", size: 20)!, NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        idTextField.textFieldBorder()
        passwordTextField.textFieldBorder()
        password2TextField.textFieldBorder()
        nickNameTextField.textFieldBorder()
        registerButton.layer.cornerRadius = 20
    }
    
    @IBAction func registerButtonClicked(_ sender: UIButton) {
        if let userId = idTextField.text, let password = passwordTextField.text, let password2 = password2TextField.text, let nickName = nickNameTextField.text {
            if password != password2 {
                let alert = UIAlertController(title: "비밀번호 확인", message: "일치하는 비밀번호를 입력해주세요", preferredStyle: UIAlertController.Style.alert)
                let action = UIAlertAction(title: "OK", style: .default)
                alert.addAction(action)
                present(alert, animated: false, completion: nil)
            } else if (userId == "" || password == "" || password2 == "" || nickName == "") {
                let alert = UIAlertController(title: "입력 오류", message: "모든 항목을 입력해주세요", preferredStyle: UIAlertController.Style.alert)
                let action = UIAlertAction(title: "OK", style: .default)
                alert.addAction(action)
                present(alert, animated: true, completion: nil)
            } else  {
                let url = "http://192.168.0.9:3000/register"
                let param: Parameters = [
                    "userID":userId,
                    "userPassword":password,
                    "userNickName":nickName]
                let alamo = AF.request(url, method: .post,
                            parameters: param,
                            encoding: URLEncoding.httpBody)
                
                alamo.responseJSON() {
                    response in
                    print("전송 성공")
                }
                self.navigationController?.popToRootViewController(animated: true)
                self.view.makeToast("회원가입이 완료 되었습니다.", duration: 2)

            }
        }
    }
}
