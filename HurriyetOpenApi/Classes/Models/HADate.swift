//
//  HADate.swift
//  HurriyetApiSwiftSDK
//
//  Created by Hakkı Yiğit Yener on 16.12.2016.
//  Copyright © 2016 Hurriyet. All rights reserved.
//

import UIKit

class HADate: NSObject {
    public var Date:String?
    init(dictionary: Dictionary<String, Any>) {
        super.init()
        Date       = dictionary["Date"] as! String?;
    }
}
