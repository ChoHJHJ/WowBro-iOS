//
//  SideMenuViewController.swift
//  WowBro
//
//  Created by HyunJoong on 2022/02/23.
//

import UIKit

class SideMenuViewController: UIViewController {
    @IBOutlet weak var photo: UIImageView!
    
    
    override func viewDidLoad() {
        photo.layer.cornerRadius = 30
    }
    
    @IBAction func dismiss(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
