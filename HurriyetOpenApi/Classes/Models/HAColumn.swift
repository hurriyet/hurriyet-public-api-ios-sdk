//
//  HAColumn.swift
//  HurriyetApiSwiftSDK
//
//  Created by Hakkı Yiğit Yener on 16.12.2016.
//  Copyright © 2016 Hurriyet. All rights reserved.
//

import UIKit

class HAColumn: HABaseObject {
    //Köşe yazarının tam adını temsil eder.
    public var FullName:String? = ""
    //Köşe yazarının id'sini temsil eder. Bu id üzerinden tekil sorgu alınabilir.
    public var WriterId:String? = ""
    
    override init(dictionary: Dictionary<String, Any>) {
        super.init(dictionary: dictionary)
        FullName    = dictionary["Fullname"] as! String?
        WriterId    = dictionary["WriterId"] as! String?
    }
}
