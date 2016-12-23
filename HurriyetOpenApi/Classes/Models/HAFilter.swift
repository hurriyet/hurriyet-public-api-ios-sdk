//
//  HAFilter.swift
//  HurriyetApiSwiftSDK
//
//  Created by Hakkı Yiğit Yener on 21.12.2016.
//  Copyright © 2016 Hurriyet. All rights reserved.
//

import UIKit

public class HAFilter: NSObject {
    //Haber id'sini temsil eder.
    public var Id:String? = ""
    //Haberin en son güncellenme tarihini temsil eder.
    public var ModifiedDate:String? = ""
    //Haberin bağlı bulunduğu dizini temsil eder. /{dizin}/ şeklindeki ifade biçimi, ağaç yapı olarak devam etmektedir. Örneğin; /spor/futbol/.
    public var Path:String? = ""
    //Yazar id'sini temsil eder.
    public var WriterId:String? = ""
    //Eğer daha gelişmiş bir filtreleme kullanmak isterseniz sorgunuzu buraya yazın.
    public var ManuelQuestString:String? = ""
    
    func getFilterString() -> String{
        
        
        if let manuelQuestStringValue = ManuelQuestString
        {
            if manuelQuestStringValue.characters.count > 0
            {
                return "$filter=\(manuelQuestStringValue)"
            }
        }
        var filterParameters:Array<String> = []
        if let idValue = Id {
            if idValue.characters.count > 0 {
                filterParameters.append("Id+eq+'\(idValue)'")
            }
        }
        if let modifiedDateValue = ModifiedDate {
            if modifiedDateValue.characters.count > 0 {
                filterParameters.append("ModifiedDate+eq+'\(modifiedDateValue)'")
            }
        }
        if let pathValue = Path {
            if pathValue.characters.count > 0 {
                filterParameters.append("Path+eq+'\(pathValue)'")
            }
        }
        if let writerIdValue = WriterId {
            if writerIdValue.characters.count > 0 {
                filterParameters.append("WriterId+eq+'\(writerIdValue)'")
            }
        }
        
        if filterParameters.count > 0
        {
            return "$filter=\(filterParameters.joined(separator: "+and+"))"
        }
        
        return ""
    }
    
    
}
