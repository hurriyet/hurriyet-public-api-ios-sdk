//
//  HAMetaData.swift
//  HurriyetApiSwiftSDK
//
//  Created by Hakkı Yiğit Yener on 15.12.2016.
//  Copyright © 2016 Hurriyet. All rights reserved.
//

import UIKit

public class HAMetaData: NSObject {
    public var Title:String?
    init(dictionary: Dictionary<String, Any>) {
        super.init()
        Title       = dictionary["Title"] as! String?;
    }
}
