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
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        emailTextField.layer.cornerRadius = 20
        emailTextField.addLeftPadding()
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.cornerRadius = 20
        passwordTextField.addLeftPadding()
        loginButton.layer.cornerRadius = 20
    }
}

// 뷰의 모서리를 둥글게 하는 메서드
extension UIView {
    func roundCorners(cornerRadius: CGFloat, maskedCorners: CACornerMask) {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = CACornerMask(arrayLiteral: maskedCorners)
    }
}

// 텍스트 필드의 placeholder의 패딩 값 넣어주기
extension UITextField {
    func addLeftPadding() {
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = padding
        self.leftViewMode = ViewMode.always
    }
}
