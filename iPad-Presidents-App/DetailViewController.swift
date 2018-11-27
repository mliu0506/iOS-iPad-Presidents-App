//
//  DetailViewController.swift
//  iPad Application
//
//  Created by Michael Liu on 2018-11-14.
//  Copyright © 2018 CS2680. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var webView: UIWebView!
    
    func configureView()
    {
        if let detail = self.detailItem
        {
            if let label = self.detailDescriptionLabel
            {
                label.text = detail["url"].stringValue
                    if let url = URL(string: detail["url"].stringValue)
                    {
                        let request = URLRequest(url: url)
                        webView.loadRequest(request)
                    }
                
            }
        }
    }
    
    //func configureView() {
        // Update the user interface for the detail item.
    //    if let detail = detailItem {
    //        if let label = detailDescriptionLabel {
    //            label.text = detail.description
    //        }
    //    }
    //}

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    var detailItem: JSON? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }


}

