//
//  DataModel.swift
//  Assessment_IOS_App
//
//  Created by Raj on 18/11/18.
//  Copyright © 2018 Raj. All rights reserved.
//

import Foundation

enum Type:String{
    case Interactive
    case Article
}

enum MediaType:String{
    case Image
    case Video
}

enum MediaSubType:String{
    case photo
}


func getModelsDataArray(dataDict:[[String :AnyObject]])->[DataModel]{
    var dataArray:[DataModel] = [DataModel]()
    
    for tyData in dataDict {
      dataArray.append(DataModel.init(dataDict: tyData))
    }
    return dataArray
}

class DataModel:NSObject{
    var usrString:String?
    var adx_keywords:String?
    var section:String?
    var type:Type?
    var title:String?
    var abstract:String?
    var published_date:String?
    var source:String?
    var id:Double?
    var asset_id:Double?
    var media:[Media] = [Media]()
    init(dataDict:[String:Any]) {
        usrString = dataDict["url"] as? String ?? ""
        adx_keywords = dataDict["adx_keywords"] as? String ?? ""
        if let typeData = dataDict["type"] as? String {
            type = Type(rawValue: typeData)
        }
        section = dataDict["section"] as? String
        title = dataDict["title"] as? String ?? ""
        abstract = dataDict["abstract"] as? String ?? ""
        published_date = dataDict["published_date"] as? String ?? ""
        source = dataDict["source"] as? String ?? ""
        id = dataDict["id"] as? Double ?? 0
        asset_id = dataDict["asset_id"] as? Double ?? 0.0
        if let mediaData = dataDict["media"] as? [[String :Any]]{
            for mediaDict in mediaData{
                
                media.append(Media(dictData:mediaDict as [String : AnyObject]))
            }
        }
    }
}

class Media:NSObject{
   
    var mediaType:MediaType?
    var caption:String?
    var formatedMedia:[String:MediaMetaData]  = [:]
    init(dictData:[String:AnyObject]) {
        if let type = dictData["type"] as? String{
            mediaType = MediaType(rawValue: type)
        }
        caption  = dictData["caption"] as? String ?? ""
        if let metadataArray  = dictData["media-metadata"] as? [[String :AnyObject]]{
            for mediaMetaData in metadataArray {
                let formated  = mediaMetaData["format"] as? String ?? ""
                formatedMedia[formated] = MediaMetaData(dataDict: mediaMetaData)
        }
        }
    }
}

class MediaMetaData:NSObject{
    var usrString:String?
    var formate:String?
    var height:Float?
    var width:Float?
    init(dataDict:[String:Any]) {
        usrString = dataDict["url"] as? String ?? ""
        formate = dataDict["format"] as? String ?? ""
        height = dataDict["height"] as? Float ?? 0.0
        width = dataDict["width"] as? Float ?? 0.0

    }
}
