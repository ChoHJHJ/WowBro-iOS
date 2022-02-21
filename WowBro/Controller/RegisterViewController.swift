//
//  RegisterViewController.swift
//  WowBro
//
//  Created by HyunJoong on 2022/02/21.
//

import UIKit

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
}
