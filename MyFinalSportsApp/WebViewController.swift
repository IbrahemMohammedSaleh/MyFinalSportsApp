//
//  WebViewController.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 22/06/2022.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.load(URLRequest(url: URL(string: "https://www.youtube.com/watch?v=i2yhyaNb4ac")!))
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
