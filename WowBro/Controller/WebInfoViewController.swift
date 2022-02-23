//
//  WebInfoViewController.swift
//  WowBro
//
//  Created by HyunJoong on 2022/02/23.
//

import UIKit
import WebKit

class WebInfoViewController: UIViewController {
    var tourUrl: String?
    
    @IBOutlet weak var tourWebView: WKWebView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tourWebView.navigationDelegate = self
        loadWebPage(tourUrl!)
    }
    
    // 여행정보 페이지 구현
    func loadWebPage(_ url: String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        tourWebView.load(myRequest)
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        tourWebView.stopLoading()
    }
    
    @IBAction func btnRefresh(_ sender: UIBarButtonItem) {
        tourWebView.reload()
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        tourWebView.goBack()
    }
    
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        tourWebView.goForward()
    }
}

// 액티비티 인디게이터 설정
extension WebInfoViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
}
