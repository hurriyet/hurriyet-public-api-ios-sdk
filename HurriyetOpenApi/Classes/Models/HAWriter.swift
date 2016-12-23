//
//  HAWriter.swift
//  HurriyetApiSwiftSDK
//
//  Created by Hakkı Yiğit Yener on 17.12.2016.
//  Copyright © 2016 Hurriyet. All rights reserved.
//

import UIKit

class HAWriter: NSObject {
    
    //Yazar id'sini temsil eder.
    public var Id:String? = ""
    //Yazarın tam adını temsil eder.
    public var FullName:String? = ""
    //Yazar içerik tipini temsil eder. Sabit değer: PersonContainer
    public var ContentType:String? = ""
    //Yazarın sistemde oluşturulma tarihini temsil eder.
    public var CreatedDate:String? = ""
    //Yazarın görsellerini temsil eder.
    public var Files:Array<HAImage>? = []
    //Yazarın sistemde bağlı olduğu dizini temsil eder.
    public var Path:String? = ""
    //Yazarın gerçek adresini temsil eder.
    public var Url:String? = ""
    
    init(dictionary: Dictionary<String, Any>) {
        super.init()
        Id           = dictionary["Id"] as! String?;
        FullName  = dictionary["Fullname"] as! String?
        ContentType  = dictionary["ContentType"] as! String?
        CreatedDate  = dictionary["CreatedDate"] as! String?
        if  let array = dictionary["Files"] as! Array<[String:Any]?>?
        {
            for item in array
            {
                let image = HAImage.init(dictionary: item!)
                Files?.append(image)
            }
        }
        Path         = dictionary["Path"] as! String?
        Url          = dictionary["Url"] as! String?
    }
}
