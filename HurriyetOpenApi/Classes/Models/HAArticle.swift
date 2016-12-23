//
//  HAArticle.swift
//  HurriyetApiSwiftSDK
//
//  Created by Hakkı Yiğit Yener on 15.12.2016.
//  Copyright © 2016 Hurriyet. All rights reserved.
//

import UIKit

public class HAArticle: HABaseObject {
    
    //Haberle ilişkilendirilmiş haberleri temsil eder.
    public var RelatedNews:Array<HAArticle>? = []
    //Haberle ilişkilendirilmiş etiketleri temsil eder.
    public var Tags:Array<String>? = []
    //Haber eğer köşe yazısı tipinde ise köşe yazarının bilgisini temsil eder.
    public var Writers:Array<[String: Any]>? = []
    
    override init(dictionary: Dictionary<String, Any>) {
        super.init(dictionary: dictionary)
        if let array = dictionary["RelatedNews"] as! Array<[String: Any]>?
        {
            for item in array
            {
                RelatedNews?.append(HAArticle.init(dictionary:item))
            }
        }
        Tags         = dictionary["Tags"] as! Array<String>?
        Writers      = dictionary["Writers"] as! Array<[String: Any]>?
    }
}
