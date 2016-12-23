//
//  HABaseObject.swift
//  HurriyetApiSwiftSDK
//
//  Created by Hakkı Yiğit Yener on 16.12.2016.
//  Copyright © 2016 Hurriyet. All rights reserved.
//

import UIKit

public class HABaseObject: NSObject {
    //Haber id'sini temsil eder.
    public var Id:String? = ""
    //Haber içerik tipini temsil eder. Olası değerler: Article, Column, NewsPhotoGallery, Page, Folder
    public var ContentType:String? = ""
    //Haberin oluşturulma tarihini temsil eder.
    public var CreatedDate:String? = ""
    //Haberin spot metnini temsil eder.
    public var Description:String? = ""
    //Haberin görsellerini temsil eder.
    public var Files:Array<HAImage>? = []
    //Haberin en son güncellenme tarihini temsil eder.
    public var ModifiedDate:String? = ""
    //Haberin bağlı bulunduğu dizini temsil eder. /{dizin}/ şeklindeki ifade biçimi, ağaç yapı olarak devam etmektedir. Örneğin; /spor/futbol/
    public var Path:String? = ""
    //Haberin başlığını temsil eder.
    public var Title:String? = ""
    //Haberin gerçek adresini temsil eder.
    public var Url:String? = ""
    //Haberin orijinal metnini temsil eder.
    public var Text:String? = ""
    
    init(dictionary: Dictionary<String, Any>) {
        super.init()
        Id           = dictionary["Id"] as! String?;
        ContentType  = dictionary["ContentType"] as! String?
        CreatedDate  = dictionary["CreatedDate"] as! String?
        Description  = dictionary["Description"] as! String?
        if  let array = dictionary["Files"] as! Array<[String:Any]?>?
        {
            for item in array
            {
                let image = HAImage.init(dictionary: item!)
                Files?.append(image)
            }
        }
        ModifiedDate = dictionary["ModifiedDate"] as! String?
        Path         = dictionary["Path"] as! String?
        Title        = dictionary["Title"] as! String?
        Url          = dictionary["Url"] as! String?
        Text         = dictionary["Text"] as! String?
    }
}
