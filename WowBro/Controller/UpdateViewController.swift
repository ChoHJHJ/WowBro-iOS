//
//  UpdateViewController.swift
//  WowBro
//
//  Created by HyunJoong on 2022/02/24.
//

import UIKit
import Alamofire

class UpdateViewController: UIViewController {
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var password2TextField: UITextField!
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet weak var withdrawButton: UIButton!
    
    var currentId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        
        let preferences = UserDefaults.standard

        if preferences.object(forKey: "insertedId") == nil {
            print("Doesn't exist!")
        } else {
            currentId = preferences.string(forKey: "insertedId")
        }
    }
    
    func initView() {
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont(name: "S-Core Dream", size: 20)!, NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        
        updateButton.layer.cornerRadius = 20
        withdrawButton.layer.cornerRadius = 20
        
        passwordTextField.textFieldBorder()
        password2TextField.textFieldBorder()
        nickNameTextField.textFieldBorder()
    }
    
    @IBAction func btnUpdate(_ sender: UIButton) {
        if let userPassword = passwordTextField.text, let userPassword2 = password2TextField.text, let nickName = nickNameTextField.text {
            if userPassword != userPassword2 {
                let alert = UIAlertController(title: "비밀번호 확인", message: "일치하는 비밀번호를 입력해주세요", preferredStyle: UIAlertController.Style.alert)
                let action = UIAlertAction(title: "OK", style: .default)
                alert.addAction(action)
                present(alert, animated: false, completion: nil)
            } else if (userPassword == "" || userPassword2 == "" || nickName == "") {
                let alert = UIAlertController(title: "입력 오류", message: "모든 항목을 입력해주세요", preferredStyle: UIAlertController.Style.alert)
                let action = UIAlertAction(title: "OK", style: .default)
                alert.addAction(action)
                present(alert, animated: true, completion: nil)
            } else {
                let url = "http://192.168.0.9:3000/userInfo/\(currentId!)"
                let param: Parameters = [
                    "userPassword": passwordTextField.text!,
                    "userNickName": nickNameTextField.text!]
                let alamo = AF.request(url, method: .patch,
                            parameters: param,
                            encoding: URLEncoding.httpBody)
                
                alamo.responseJSON() {
                    response in
                    print("전송 성공")
                }
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    @IBAction func btnWithdraw(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: "insertedId")
        let alert = UIAlertController(title: "회원탈퇴", message: "탈퇴하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "예", style: .destructive) { action in
            self.dismiss(animated: true) {
                let url = "http://192.168.0.9:3000/userInfo/\(self.currentId!)"
                let alamo = AF.request(url, method: .delete,
                            encoding: URLEncoding.httpBody)
                alamo.responseJSON() {
                    response in
                    print("전송 성공")
                }
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
        let cancel = UIAlertAction(title: "아니오", style: .cancel, handler : nil)
        alert.addAction(okAction)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
}
