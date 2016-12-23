//
//  PhotoGallery.swift
//  HurriyetApiSwiftSDK
//
//  Created by Hakkı Yiğit Yener on 16.12.2016.
//  Copyright © 2016 Hurriyet. All rights reserved.
//

import UIKit

public class HAPhotoGallery: HABaseObject {
    //Haberle ilişkilendirilmiş etiketleri temsil eder.
    public var Tags:Array<String>? = []
    //Haberin editörünü temsil eder.
    public var Editor:String? = ""
    
    override init(dictionary: Dictionary<String, Any>) {
        super.init(dictionary: dictionary)
        Tags         = dictionary["Tags"] as! Array<String>?
        Editor      = dictionary["Writers"] as! String?
    }
}
