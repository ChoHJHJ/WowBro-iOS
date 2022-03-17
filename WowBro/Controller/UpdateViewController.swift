//
//  UpdateViewController.swift
//  WowBro
//
//  Created by HyunJoong on 2022/02/24.
//

import UIKit

class UpdateViewController: UIViewController {
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var password2TextField: UITextField!
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet weak var withdrawButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
    }
    
    func initView() {
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont(name: "S-Core Dream", size: 20)!, NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        
        updateButton.layer.cornerRadius = 20
        withdrawButton.layer.cornerRadius = 20
        
        passwordTextField.textFieldBorder()
        password2TextField.textFieldBorder()
        nickNameTextField.textFieldBorder()
    }
    
    @IBAction func btnWithdraw(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
