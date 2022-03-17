//
//  CustomSideMenuNavigation.swift
//  WowBro
//
//  Created by HyunJoong on 2022/02/23.
//

import UIKit
import SideMenu

class CustomSideMenuNavigation: SideMenuNavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.menuWidth = self.view.frame.width * 0.5
        self.leftSide = true
    }
}
