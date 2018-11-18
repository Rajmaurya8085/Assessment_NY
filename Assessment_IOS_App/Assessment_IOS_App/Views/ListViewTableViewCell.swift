//
//  ListViewTableViewCell.swift
//  Assessment_IOS_App
//
//  Created by Raj on 18/11/18.
//  Copyright © 2018 Raj. All rights reserved.
//

import UIKit

class ListViewTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var sourceLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var listImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setDataFromModels(dataModel:DataModel){
    titleLbl.text = dataModel.title
    sourceLbl.text = dataModel.source
    dateLbl.text  = dataModel.published_date
    typeLbl.text = dataModel.type?.rawValue
        if let imegeUrl = dataModel.media.first?.formatedMedia["Standard Thumbnail"]{
            listImageView.loadImageUsingCache(withUrl: imegeUrl.usrString ?? "")
        }
    }
}
