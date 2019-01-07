//
//  ApiManager.swift
//  Assessment_IOS_App
//
//  Created by Raj on 18/11/18.
//  Copyright © 2018 Raj. All rights reserved.
//

import Foundation
import UIKit

private let attributedTitle  = "attributedTitle"
private let offlineMessage = "We are going to show previous saved"
private let dataSavingKey  = "savedData"
private let errorAlertTitle = "Error"
private let urlString = "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/30.json?api-key=e86edaacc47746018603f85c026afa08"
private let offlineErrorCode = -1009


class ApiManager:NSObject{
    
    class func makeApiCall(result:@escaping ([DataModel])-> Void)
    {
        
        let urlRequest = URL(string: urlString)
        guard let url = urlRequest else{return}
      
        URLSession.shared.dataTask(with:url) { (data, responseData, error) in
            DispatchQueue.main.async {
                if error == nil && data  != nil{
                    let jsonObject = try? JSONSerialization.jsonObject(with:data!, options: [])
                    guard let json = jsonObject as? [String :Any] else{return}
                    
                    if let reply  = json["results"] as? [[String :AnyObject]]{
                        
                        /* Saving received data  in user default*/
                        UserDefaults.standard.set(JSON(reply).rawString(), forKey:dataSavingKey)
                        
                        /* parsing data into model*/
                        let dataModel:[DataModel] =  getModelsDataArray(dataDict:reply)
                        result(dataModel)
                    }
                }
                else if error != nil{
                    /* checking error in response Data*/
                    guard let errorType  = error as NSError? else  {return}
                    
                    /* checking Offline error code */
                    if errorType.code == offlineErrorCode{
                        
                        /* retriving saved data from user Default */
                        if let data = UserDefaults.standard.value(forKey:dataSavingKey) as? String {
                        /* parsing retrived data into user model */
                        guard let json =  JSON.init(parseJSON: data).arrayObject as? [[String:AnyObject]] else {return}
                        let dataModel:[DataModel] =  getModelsDataArray(dataDict:json)
                        result(dataModel)
                            ApiManager.showAlertTostMessage(title:errorAlertTitle, message:(errorType.localizedDescription) + " " + offlineMessage, controller:ApiManager.getTopController()
                                , success: { (success) in
                            })
                        }else{
                            result([DataModel]())
                            ApiManager.showAlertTostMessage(title:errorAlertTitle, message:(errorType.localizedDescription), controller:ApiManager.getTopController()
                                , success: { (success) in
                            })
                        }
                    }
                }
            }
            }.resume()
    }
    
    class func showAlertTostMessage(title:String, message:String, controller:UIViewController,success:  (_ completed:Bool)->Void){
        
        let attributedString = NSAttributedString(string: title, attributes: [
            (kCTFontAttributeName as NSAttributedString.Key) : UIFont.systemFont(ofSize: 20),
            NSAttributedString.Key.foregroundColor as NSAttributedString.Key : UIColor.red
            ])
        let alertController = UIAlertController(title: "" , message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.setValue(attributedString, forKey: attributedTitle)
        controller.present(alertController, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            alertController.dismiss(animated: false, completion: nil)
        }
    }
    
    class func getTopController() -> UIViewController{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let navController = appDelegate.window!.rootViewController as! UINavigationController
        return navController.topViewController!
    }
}


