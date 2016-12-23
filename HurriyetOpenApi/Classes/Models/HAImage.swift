//
//  HAImage.swift
//  HurriyetApiSwiftSDK
//
//  Created by Hakkı Yiğit Yener on 15.12.2016.
//  Copyright © 2016 Hurriyet. All rights reserved.
//

import UIKit

public class HAImage: NSObject {
    
    public var FileUrl : String?
    public var MetaData : HAMetaData?
    
    init(dictionary: Dictionary<String, Any>) {
        super.init()
        FileUrl       = dictionary["FileUrl"] as! String?;
        if let meta = dictionary["Metadata"] as! Dictionary<String, Any>?
        {
            MetaData      = HAMetaData.init(dictionary:meta)
        }
        
    }
}
