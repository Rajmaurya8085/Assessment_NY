//
//  DetailViewController.swift
//  Assessment_IOS_App
//
//  Created by Raj on 18/11/18.
//  Copyright © 2018 Raj. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var dataModel :DataModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detail"
        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.done, target: nil, action: nil);
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton

    }
    



}
