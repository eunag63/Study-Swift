//
//  ViewController.swift
//  SampleWebView
//
//  Created by 김은아 on 2021/09/05.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //url string을 준비한다
        let urlString = "https://www.google.com"
        //url을 request로 만들기
        
        if let url = URL(string: urlString) { //unwrap - 옵셔널 바인딩
            let urlReq = URLRequest(url: url)
            WebViewMain.load(urlReq)
        }
    }
    
    @IBOutlet weak var WebViewMain: WKWebView!
    
    
}

