//
//  ViewController.swift
//  WowBro
//
//  Created by HyunJoong on 2022/02/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
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
        emailTextField.textFieldBorder()
        passwordTextField.textFieldBorder()
        loginButton.layer.cornerRadius = 20
    }
}
