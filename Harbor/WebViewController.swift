//
//  WebViewController.swift
//  Harbor
//
//  Created by Robin Mehta on 3/29/16.
//  Copyright © 2016 robin. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let webView = UIWebView()
        self.view.addSubview(webView)
        webView.pinToEdgesOfSuperview()
        
        let url = NSURL (string: "https://google.com")
        let requestObj = NSURLRequest(URL: url!);
        webView.loadRequest(requestObj)
        self.navigationController?.navigationBarHidden = false
        self.navigationItem.hidesBackButton = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
