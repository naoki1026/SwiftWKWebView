//
//  ViewController.swift
//  SwiftWKWebView
//
//  Created by Naoki Arakawa on 2019/02/18.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    
    @IBOutlet weak var webView: WKWebView!
    
    var urlString : String = "https://www.1101.com/home.html"
    var indicator : UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setIndicator()
        
        guard let url = URL (string: urlString) else {
            
            return
        }
        
        let req = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 100)
        
        self.webView.load(req)
        
        
    }
    
    @IBAction func back(_ sender: Any) {
        
        webView.goBack()
    }
    
    
    
    @IBAction func forward(_ sender: Any) {
        
        webView.goForward()
    }
    
    @IBAction func refresh(_ sender: Any) {
        
        webView.reload()
        
    }
    
    
    func setIndicator() {
        
        //インディケーターの初期化を行わなくてはいけない
        indicator = UIActivityIndicatorView()
        
        
        //サイズを決定する
        indicator.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        indicator.center = CGPoint(x: UIScreen.main.bounds.size.width/2, y: UIScreen.main.bounds.size.height/2)
        
        //アニメーションが止まっている時の表示
        indicator.hidesWhenStopped = true
        
        //indicatorの色について
        indicator.style = .gray
        
        //WebViewにaddSubView
        self.webView.addSubview(indicator)
        
    }
    
    //通信が開始したタイミングで呼ばれる
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
    
        //インディケーターを回したい
        indicator.startAnimating()
        
        
    }
    
    //通信が完了したタイミングで呼ばれる
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        indicator.stopAnimating()
    }
    
    
}
