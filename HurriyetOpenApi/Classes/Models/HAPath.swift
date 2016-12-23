//
//  HAPath.swift
//  HurriyetApiSwiftSDK
//
//  Created by Hakkı Yiğit Yener on 17.12.2016.
//  Copyright © 2016 Hurriyet. All rights reserved.
//

import UIKit

public class HAPath: NSObject {
    
    //Dizin id'sini temsil eder.
    public var Id:String? = ""
    //Dizini temsil eder.
    public var Path:String? = ""
    //Dizin başlığını temsil eder.
    public var Title:String? = ""

    init(dictionary: Dictionary<String, Any>) {
        super.init()
        Id = dictionary["Id"] as! String?;
        Path = dictionary["Path"] as! String?
        Title = dictionary["Title"] as! String?
    }
}
