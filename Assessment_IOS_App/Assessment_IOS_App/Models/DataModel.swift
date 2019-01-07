import Foundation

enum contentType:String{
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

protocol rootDataModelPop {
    
    var usrString:String?{get}
     var adx_keywords:String?{get}
     var section:String?{get}
     var type:contentType?{get}
     var title:String?{get}
     var abstract:String?{get}
     var published_date:String?{get}
     var source:String?{get}
     var id:Double?{get}
     var asset_id:Double?{get}
     var media:[Media]{get}
    
}
struct DataModel:rootDataModelPop{
    private(set) var usrString:String?
    private(set) var adx_keywords:String?
    private(set) var section:String?
    private(set) var type:contentType?
    private(set) var title:String?
    private(set) var abstract:String?
    private(set) var published_date:String?
    private(set) var source:String?
    private(set) var id:Double?
    private(set) var asset_id:Double?
    private(set) var media:[Media] = [Media]()
    
    init(dataDict:[String:Any]) {
        usrString = dataDict["url"] as? String ?? ""
        adx_keywords = dataDict["adx_keywords"] as? String ?? ""
        if let typeData = dataDict["type"] as? String {
            type = contentType(rawValue: typeData)
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

protocol MediaPop {
    var mediaType:MediaType?{get}
    var caption:String?{get}
    var formatedMedia:[String:MediaMetaData] {get}

}

struct Media:MediaPop{
    
    private(set) var mediaType:MediaType?
    private(set) var caption:String?
    private(set) var formatedMedia:[String:MediaMetaData]  = [:]
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

protocol MetaData:Codable {
    var url:String?{get}
    var formate:String?{get}
    var height:Float?{get}
    var width:Float?{get}
}

struct MediaMetaData:MetaData{
    
    private(set) var url: String?
    private(set) var formate: String?
    private(set) var height:Float?
    private(set) var width:Float?
    init(dataDict:[String:Any]) {
        url = dataDict["url"] as? String ?? ""
        formate = dataDict["format"] as? String ?? ""
        height = dataDict["height"] as? Float ?? 0.0
        width = dataDict["width"] as? Float ?? 0.0
        
    }
}



