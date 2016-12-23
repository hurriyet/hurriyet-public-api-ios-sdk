//
//  HAPage.swift
//  HurriyetApiSwiftSDK
//
//  Created by Hakkı Yiğit Yener on 17.12.2016.
//  Copyright © 2016 Hurriyet. All rights reserved.
//

import UIKit

class HAPage: NSObject {
    
    //Sayfa id'sini temsil eder.
    public var Id:String? = ""
    //Sayfanın oluşturulma tarihini temsil eder.
    public var CreatedDate:String? = ""
    //Sayfaya atanmış haberleri temsil eder.
    public var PageNews:Array<HAArticle>? = []
    //Sayfa başlığını temsil eder.
    public var Title:String? = ""
    //Sayfanın gerçek adresini temsil eder.
    public var Url:String? = ""
    
    init(dictionary: Dictionary<String, Any>) {
        super.init()
        Id = dictionary["Id"] as! String?;
        CreatedDate = dictionary["CreatedDate"] as! String?
        if  let array = dictionary["PageNews"] as! Array<[String:Any]?>?
        {
            for item in array
            {
                let article = HAArticle.init(dictionary: item!)
                PageNews?.append(article)
            }
        }
        Title = dictionary["Title"] as! String?
        Url = dictionary["Url"] as! String?
    }
}
