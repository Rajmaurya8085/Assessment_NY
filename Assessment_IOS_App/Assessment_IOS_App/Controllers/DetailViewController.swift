//
//  DetailViewController.swift
//  Assessment_IOS_App
//
//  Created by Raj on 18/11/18.
//  Copyright © 2018 Raj. All rights reserved.
//

import UIKit

private let detailsControllerTtitle = "Details"
private let backButtonNam = "Back"

class DetailViewController: UIViewController {
    var dataModel :DataModel!
    
    @IBOutlet weak  var captionLbl: UILabel!
    @IBOutlet weak var desLbl: UILabel!
    @IBOutlet weak var detailsImageView: UIImageView!
    @IBOutlet weak var publishDateLbl: UILabel!
    @IBOutlet weak var publishLbl: UILabel!
    @IBOutlet weak var sourceLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    
    
    //MARK: View controller life cycle delegate method
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        setData()
    }
    
    // Mark: Custom Method
    func initialSetup(){
        self.title = detailsControllerTtitle
        let backButton = UIBarButtonItem(title: backButtonNam, style: UIBarButtonItem.Style.done, target: nil, action: nil);
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    func setData(){
        titleLbl.text = dataModel.title
        sourceLbl.text = dataModel.source
        publishDateLbl.text  = dataModel.published_date
    }
    
}

