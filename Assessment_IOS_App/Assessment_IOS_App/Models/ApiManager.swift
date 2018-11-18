//
//  ApiManager.swift
//  Assessment_IOS_App
//
//  Created by Raj on 18/11/18.
//  Copyright © 2018 Raj. All rights reserved.
//

import Foundation

class ApiManager:NSObject{
    
    class func makeApiCall(result:@escaping ([DataModel])-> Void)
    {
        var request = URLRequest(url: URL(string: "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/30.json?api-key=e86edaacc47746018603f85c026afa08")!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let jsonDecoder = JSONDecoder()
                print(response)
                let resultJson = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:AnyObject]
                print("API Response = ",resultJson ?? "")
                if let reply  = resultJson!["results"] as? [[String :AnyObject]]{
                   
               
                        DispatchQueue.main.async {
                            let dataModel:[DataModel] =  getModelsDataArray(dataDict:reply)
                            result(dataModel)
                        }
                    //}
                }
            } catch {
                print("JSON Serialization error")
            }
        }).resume()
        
    }
}
