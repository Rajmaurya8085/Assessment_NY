//
//  Extension.swift
//  Assessment_IOS_App
//
//  Created by Raj on 18/11/18.
//  Copyright © 2018 Raj. All rights reserved.
//

import Foundation

import Foundation
import UIKit

@IBDesignable
extension UIView{
    
    @IBInspectable var borderColor:UIColor{
        set{
            self.layer.borderColor = (newValue as UIColor).cgColor
        }
        get{
            let color  = self.layer.borderColor
            return UIColor(cgColor: color!)
        }
    }
    
    @IBInspectable var borderWidth:CGFloat{
        set{
            self.layer.borderWidth = newValue
        }
        get{
            return self.layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius:CGFloat{
        set{
            self.layer.cornerRadius = newValue
        }
        get{
            return self.layer.cornerRadius
        }
    }
    @IBInspectable var shadowColor:UIColor{
        set{
            self.layer.shadowColor = (newValue as UIColor).cgColor
        }
        get{
            let  color = self.layer.shadowColor
            return UIColor(cgColor: color!)
        }
    }
    @IBInspectable var shadownOffset: CGSize{
        set {
            self.layer.shadowOffset = newValue
        }
        get{
            return self.layer.shadowOffset
        }
    }
    @IBInspectable var shadowRadius: CGFloat{
        set {
            self.layer.shadowRadius = newValue
        }
        get{
            return self.layer.shadowRadius
        }
    }
    @IBInspectable var shadowOpacity: Float{
        set {
            self.layer.shadowOpacity = newValue
        }
        get{
            return self.layer.shadowOpacity
        }
    }
    
    func setShadowOnView(color: CGColor) {
        self.layer.shadowColor = color
        self.layer.shadowOffset = CGSize(width: 20, height: 20)
        self.layer.shadowOpacity = 0.7
        self.layer.shadowRadius = 2.0
        self.clipsToBounds = true
    }
    
    
    
}


extension UIStoryboard{
    
    /* This is generic method used for get instance of controller from storyboard */ 
    class func loadViewController<T:UIViewController>(storyBoardName:String,identifierVC:String,type:T.Type) -> T
    {
        let storyboard = UIStoryboard(name: storyBoardName, bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(withIdentifier: identifierVC) as! T
        return controller
    }
}

let imageCache = NSCache<NSString, UIImage>()
extension UIImageView {
    /* this method is used to  download image from string url and store on cache */
    func loadImageUsingCache(withUrl urlString : String) {
        let url = URL(string: urlString)
        if url == nil {return}
        self.image = nil
        
        // check cached image
        if let cachedImage = imageCache.object(forKey: urlString as NSString)  {
            self.image = cachedImage
            return
        }
        
        /* adding activicty loader on Image */
        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView.init(style: .gray)
        addSubview(activityIndicator)
        activityIndicator.startAnimating()
        activityIndicator.center = self.center
        
        // if not, download image from url
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    imageCache.setObject(image, forKey: urlString as NSString)
                    self.image = image
                    activityIndicator.removeFromSuperview()
                }
}

        }).resume()
    }
}




