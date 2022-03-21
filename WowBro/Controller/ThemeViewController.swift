//
//  ThemeViewController.swift
//  WowBro
//
//  Created by HyunJoong on 2022/02/22.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class ThemeViewController: UIViewController {
    @IBOutlet weak var themeImageView: UIImageView!
    @IBOutlet weak var themeListTableView: UITableView!
    var tourName: String?
    var tourThemeList: [TourVO] = []
    var currentId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont(name: "S-Core Dream", size: 20)!, NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        self.navigationItem.title = tourName!
        themeImageView.layer.cornerRadius = 30
        themeListTableView.delegate = self
        themeListTableView.dataSource = self
        
        let preferences = UserDefaults.standard
        if preferences.object(forKey: "insertedId") == nil {
            print("Doesn't exist!")
        } else {
            currentId = preferences.string(forKey: "insertedId")
        }
        
        let nibName = UINib(nibName: "TourTableViewCell", bundle: nil)
        
        themeListTableView.register(nibName, forCellReuseIdentifier: "TourTableViewCell")
        
        let urlString = "http://192.168.0.9:3000/userInfo/\(currentId!)/tourInfo/\(tourName!)"
        let encodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = URL(string: encodedString)!
        let alamo = AF.request(url, method: .get)
        
        alamo.responseDecodable(of: [TourVO].self) {[weak self] response in
            self?.tourThemeList = response.value ?? []
            print(self!.tourThemeList)
            self?.themeListTableView.reloadData()
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is MapViewController {
            let mapVC = segue.destination as? MapViewController
            mapVC?.mapList = tourThemeList
        }
    }
    
}

extension ThemeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tourThemeList.count
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TourTableViewCell", for: indexPath) as? TourTableViewCell else { return UITableViewCell() }
        let url = URL(string: tourThemeList[indexPath.item].tourPhotoUrl)
        cell.tourPhoto?.kf.setImage(with: url)
        cell.tourName.text = tourThemeList[indexPath.row].tourName
        cell.tourAddress.text = tourThemeList[indexPath.row].tourAddress
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController" ) as? DetailViewController else { return }
        
        let tourRow = tourThemeList[indexPath.row]
        detailViewController.name = tourRow.tourName
        detailViewController.sTitle = tourRow.tourTitle
        detailViewController.story = tourRow.tourStory
        detailViewController.detailImageUrl = tourRow.tourPhotoDetailUrl
        detailViewController.webUrl = tourRow.tourWebUrl
        detailViewController.qrUrl = tourRow.tourQRAddress
        detailViewController.theme = tourRow.tourTheme
        self.show(detailViewController, sender: nil)
    }
}
