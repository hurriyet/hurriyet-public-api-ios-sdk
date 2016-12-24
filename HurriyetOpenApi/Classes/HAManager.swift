//
//  HAManager.swift
//  HurriyetApiSwiftSDK
//
//  Created by Hakkı Yiğit Yener on 22.12.2016.
//  Copyright © 2016 Hurriyet. All rights reserved.
//

import Alamofire
import UIKit

public class HAManager: NSObject {
    
    
    private var apiKey:String?
    private let baseUrl:String = "https://api.hurriyet.com.tr/v1"
    public static let sharedInstance = HAManager()
    private override init() {}

    public func initWith(ApiKey apiKey:String!){
        HAManager.sharedInstance.apiKey = apiKey;
    }
    
    public func makeRequest(Filter filter:HAFilter?, SelectableList selectableList:Array<HASelectable>?, ResultCount resultCount:Int?, Path path:String, complationHandler: @escaping (DataResponse<Any>) -> Void)
    {
        if let apiKeyValue = self.apiKey
        {
            let url = "\(baseUrl)/\(path)?\(self.urlBuilder(Filter: filter, SelectableList: selectableList, ResultCount: resultCount))"
            let headers: HTTPHeaders = [
                "accept": "application/json",
                "apikey": apiKeyValue]
            
            Alamofire.request(url, headers:headers).responseJSON {response in
                complationHandler(response)
            }
        }
        else
        {
            print("Lütfen 'HAManager.sharedInstance.initWith(ApiKey apiKey:String!)' fonsiyonunu kullanarak Api Key'i ekleyin.");
        }
    }
    
    public func getArticles(Filter filter:HAFilter?, SelectableList selectableList:Array<HASelectable>?, ResultCount resultCount:Int?, complationHandler:@escaping (_ result:Array<HAArticle>) -> Void)
    {
        
        self.makeRequest(Filter: filter, SelectableList: selectableList, ResultCount: resultCount, Path: kArticles) { (response:DataResponse<Any>) in
            var articles = Array<HAArticle>()
            
            if  let json = response.result.value as? Array<[String: Any]>
            {
                for item in json
                {
                    articles.append(HAArticle.init(dictionary:item))
                }
            }
            complationHandler(articles)
        }
    }
    
    public func getArticleDetail(ArticleId articleId:String, SelectableList selectableList:Array<HASelectable>?, complationHandler:@escaping (_ result:HAArticle?) -> Void)
    {
        self.makeRequest(Filter: nil, SelectableList: selectableList, ResultCount: nil, Path: "\(kArticles)/\(articleId)") { (response:DataResponse<Any>) in
            
            var article:HAArticle?
            
            if let json = response.result.value as? [String: Any]
            {
                article = HAArticle.init(dictionary:json)
            }
            complationHandler(article)
        }
    }
    
    public func getColumns(Filter filter:HAFilter?, SelectableList selectableList:Array<HASelectable>?, ResultCount resultCount:Int?, complationHandler: @escaping (_ result:Array<HAColumn>) -> Void)
    {
        self.makeRequest(Filter: filter, SelectableList: selectableList, ResultCount: resultCount, Path: kColumns) { (response:DataResponse<Any>) in
            
            var columns = Array<HAColumn>()
            
            if  let json = response.result.value as? Array<[String: Any]>
            {
                for item in json
                {
                    columns.append(HAColumn.init(dictionary:item))
                }
            }
            complationHandler(columns)
        }
    }
    
    public func getColumnDetail(ColumnId columnId:String, SelectableList selectableList:Array<HASelectable>?, complationHandler:@escaping (_ result:HAColumn?) -> Void)
    {
        self.makeRequest(Filter: nil, SelectableList: selectableList, ResultCount: nil, Path: "\(kColumns)/\(columnId)") { (response:DataResponse<Any>) in
            
            var column:HAColumn?
            
            if let json = response.result.value as? [String: Any]
            {
                column = HAColumn.init(dictionary:json)
            }
            complationHandler(column)
        }
    }
    
    public func getDate(complationHandler:@escaping (_ result:HADate?) -> Void)
    {
        self.makeRequest(Filter: nil, SelectableList: nil, ResultCount: nil, Path: kDate) { (response:DataResponse<Any>) in
            
            var date:HADate?
            
            if let json = response.result.value as? [String: Any]
            {
                date = HADate.init(dictionary: json)
            }
            complationHandler(date)
        }
    }
    
    public func getPhotoGalleries(Filter filter:HAFilter?, SelectableList selectableList:Array<HASelectable>?, ResultCount resultCount:Int?, complationHandler: @escaping (_ result:Array<HAPhotoGallery>) -> Void)
    {
        self.makeRequest(Filter: filter, SelectableList: selectableList, ResultCount: resultCount, Path: kNewsPhotoGalleries) { (response:DataResponse<Any>) in
            
            var photoGalleries = Array<HAPhotoGallery>()
            
            if  let json = response.result.value as? Array<[String: Any]>
            {
                for item in json
                {
                    photoGalleries.append(HAPhotoGallery.init(dictionary:item))
                }
            }
            complationHandler(photoGalleries)
        }
    }
    public func getPhotoGalleryDetail(PhotoGalleryId photoGalleryId:String, SelectableList selectableList:Array<HASelectable>?, complationHandler:@escaping (_ result:HAPhotoGallery?) -> Void)
    {
        self.makeRequest(Filter: nil, SelectableList: selectableList, ResultCount: nil, Path: "\(kNewsPhotoGalleries)/\(photoGalleryId)") { (response:DataResponse<Any>) in
            
            var photoGallery:HAPhotoGallery?
            
            if let json = response.result.value as? [String: Any]
            {
                photoGallery = HAPhotoGallery.init(dictionary:json)
            }
            complationHandler(photoGallery)
        }
    }
    
    public func getPages(Filter filter:HAFilter?, SelectableList selectableList:Array<HASelectable>?, ResultCount resultCount:Int?, complationHandler:@escaping (_ result:Array<HAPage>) -> Void)
    {
        self.makeRequest(Filter: filter, SelectableList: selectableList, ResultCount: resultCount, Path: kPages) { (response:DataResponse<Any>) in
            
            
            var pages = Array<HAPage>()
            
            if  let json = response.result.value as? Array<[String: Any]>
            {
                for item in json
                {
                    pages.append(HAPage.init(dictionary:item))
                }
            }
            complationHandler(pages)
        }
    }
    
    public func getPageDetail(PageId pageId:String, SelectableList selectableList:Array<HASelectable>?, complationHandler:@escaping (_ result:HAPage?) -> Void)
    {
        self.makeRequest(Filter: nil, SelectableList: selectableList, ResultCount: nil, Path: "\(kPages)/\(pageId)") { (response:DataResponse<Any>) in
            
            var page:HAPage?
            
            if let json = response.result.value as? [String: Any]
            {
                page = HAPage.init(dictionary:json)
            }
            complationHandler(page)
        }
    }
    
    public func getPaths(Filter filter:HAFilter?, SelectableList selectableList:Array<HASelectable>?, ResultCount resultCount:Int?, complationHandler:@escaping (_ result:Array<HAPath>) -> Void)
    {
        self.makeRequest(Filter: filter, SelectableList: selectableList, ResultCount: resultCount, Path: kPaths) { (response:DataResponse<Any>) in
            
            var paths = Array<HAPath>()
            
            if  let json = response.result.value as? Array<[String: Any]>
            {
                for item in json
                {
                    paths.append(HAPath.init(dictionary:item))
                }
            }
            complationHandler(paths)
        }
    }
    
    public func getPathDetail(PathId pathId:String, SelectableList selectableList:Array<HASelectable>?, complationHandler:@escaping (_ result:HAPath?) -> Void)
    {
        self.makeRequest(Filter: nil, SelectableList: selectableList, ResultCount: nil, Path: "\(kPaths)/\(pathId)") { (response:DataResponse<Any>) in
            
            var path:HAPath?
            
            if let json = response.result.value as? [String: Any]
            {
                path = HAPath.init(dictionary:json)
            }
            complationHandler(path)
        }
    }
    
    public func getWriters(Filter filter:HAFilter?, SelectableList selectableList:Array<HASelectable>?, ResultCount resultCount:Int?, complationHandler:@escaping (_ result:Array<HAWriter>) -> Void)
    {
        self.makeRequest(Filter: filter, SelectableList: selectableList, ResultCount: resultCount, Path: kWriters) { (response:DataResponse<Any>) in
            
            var writers = Array<HAWriter>()
            
            if  let json = response.result.value as? Array<[String: Any]>
            {
                for item in json
                {
                    writers.append(HAWriter.init(dictionary:item))
                }
            }
            complationHandler(writers)
        }
    }
    
    public func getWriterDetail(WriterId writerId:String, SelectableList selectableList:Array<HASelectable>?, complationHandler:@escaping (_ result:HAWriter?) -> Void)
    {
        self.makeRequest(Filter: nil, SelectableList: selectableList, ResultCount: nil, Path: "\(kWriters)/\(writerId)") { (response:DataResponse<Any>) in
            
            var writer:HAWriter?
            
            if let json = response.result.value as? [String: Any]
            {
                writer = HAWriter.init(dictionary:json)
            }
            complationHandler(writer)
        }
    }
    
    public func searchArticles(Filter filter:HAFilter?, SelectableList selectableList:Array<HASelectable>?, ResultCount resultCount:Int?, complationHandler:@escaping (_ result:Array<HAArticle>) -> Void)
    {
        
        self.makeRequest(Filter: filter, SelectableList: selectableList, ResultCount: resultCount, Path: kSearch) { (response:DataResponse<Any>) in
            var articles = Array<HAArticle>()
            
            if  let json = response.result.value as? Array<[String: Any]>
            {
                for item in json
                {
                    articles.append(HAArticle.init(dictionary:item))
                }
            }
            complationHandler(articles)
        }
    }
    
    private func urlBuilder(Filter filter:HAFilter?, SelectableList selectableList:Array<HASelectable>?, ResultCount resultCount:Int?) -> String
    {
        var queryParameters:Array<String> = []
        
        if  let selectList = selectableList
        {
            if  selectList.count > 0 {
                var rawValueArray:Array<String> = [];
                
                for item in selectList {
                    rawValueArray.append(item.rawValue)
                }
                queryParameters.append("$select=\(rawValueArray.joined(separator: ","))")
            }
        }
        if let count = resultCount
        {
            if (count > 0)
            {
                queryParameters.append("$top=\(count)")
            }
        }
        if let filterObject = filter
        {
            if (filterObject.getFilterString().characters.count > 0)
            {
                queryParameters.append(filterObject.getFilterString())
            }
        }
        return queryParameters.joined(separator: "&");
    }
}
