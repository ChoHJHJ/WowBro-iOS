//
//  RankingViewController.swift
//  WowBro
//
//  Created by HyunJoong on 2022/03/01.
//

import UIKit

class RankingViewController: UIViewController {
    @IBOutlet var rankingTableView: UITableView!
    let rankingInfo = [Ranking(rankingNum: 1, profileImage: "chohj", userName: "chj113024"), Ranking(rankingNum: 2, profileImage: "chohj", userName: "whguswnd9087")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    func initView() {
        rankingTableView.delegate = self
        rankingTableView.dataSource = self
        rankingTableView.clipsToBounds = true
        
        let nibName = UINib(nibName: "RankingTableViewCell", bundle: nil)
        
        rankingTableView.register(nibName, forCellReuseIdentifier: "RankingTableViewCell")
        
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont(name: "S-Core Dream", size: 20)!, NSAttributedString.Key.foregroundColor: UIColor.darkGray]
    }
}

extension RankingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rankingInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RankingTableViewCell", for: indexPath) as? RankingTableViewCell else { return UITableViewCell() }
        cell.rankingLabel.text = String(rankingInfo[indexPath.row].rankingNum)
        cell.profileImage.image = UIImage(named: rankingInfo[indexPath.row].profileImage)
        cell.userNameLabel.text = rankingInfo[indexPath.row].userName
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
