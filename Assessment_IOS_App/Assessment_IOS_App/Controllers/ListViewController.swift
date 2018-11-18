//
//  ListViewController.swift
//  Assessment_IOS_App
//
//  Created by Raj on 18/11/18.
//  Copyright © 2018 Raj. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
  
    
    
    @IBOutlet weak var listTableView: UITableView!
    var dataModelArrray:[DataModel] = [DataModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "NY Times Most Popular"
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if dataModelArrray.count == 0 {
        getDataFromAPi()
        }
    }
    func getDataFromAPi(){
        SwiftLoader.show(animated: true)
        DispatchQueue.global().async {
            
            ApiManager.makeApiCall(result: { [weak self] (dataModel) in
                self?.dataModelArrray = dataModel
                SwiftLoader.hide()
                self?.listTableView.reloadData()
            })
        }
    }

}


extension ListViewController :UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataModelArrray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"ListViewTableViewCell", for:indexPath) as? ListViewTableViewCell
        cell?.setDataFromModels(dataModel: dataModelArrray[indexPath.row])
        cell?.selectionStyle = .none
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controlller =  UIStoryboard.loadViewController(storyBoardName:"Main", identifierVC:"DetailViewController", type:DetailViewController.self)
        controlller.dataModel =  dataModelArrray[indexPath.row]
        self.navigationController?.pushViewController(controlller, animated:true)
    }
}
