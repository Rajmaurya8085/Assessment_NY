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
    
    @IBOutlet weak var captionLbl: UILabel!
    @IBOutlet weak var desLbl: UILabel!
    @IBOutlet weak var detailsImageView: UIImageView!
    @IBOutlet weak var publishDateLbl: UILabel!
    @IBOutlet weak var publishLbl: UILabel!
    @IBOutlet weak var sourceLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detail"
        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.done, target: nil, action: nil);
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
  setData()
    }
    func setData(){
        titleLbl.text = dataModel.title
        sourceLbl.text = dataModel.source
        publishDateLbl.text  = dataModel.published_date
        publishLbl.text = dataModel.type?.rawValue
        captionLbl.text  = dataModel.media.first?.caption
        if let imegeUrl = dataModel.media.first?.formatedMedia["Standard Thumbnail"]{
            userImageView.loadImageUsingCache(withUrl: imegeUrl.usrString ?? "")
        }
        if let imegeUrl = dataModel.media.first?.formatedMedia["superJumbo"]{
            detailsImageView.loadImageUsingCache(withUrl: imegeUrl.usrString ?? "")
        }
    }


    
    
}
