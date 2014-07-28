//
//  Store.swift
//  MyFirstSwiftProject
//
//  Created by Christian De Martino on 7/27/14.
//  Copyright (c) 2014 Christian De Martino. All rights reserved.
//

import Foundation

let REDDIT_TOP = "http://www.reddit.com/top.json?limit=25"

struct Reddit {
    var redditTitle:String? = nil
}

class Store {
    
    class var sharedInstance : Store {
    struct Static {
        static let instance : Store = Store()
        }
        return Static.instance
    }
   
    func parseReddits() {
    
        AFHTTPSessionManager().GET(REDDIT_TOP, parameters: nil, success: { (operation: NSURLSessionDataTask!,
            responseObject: AnyObject!) in
            
            println("JSON: " + responseObject.description)
          
            //let redditData:Array<Dictionary<String,String>> = responseObject["data"] as Array!
            if let jsonResult = responseObject as? Dictionary<String, AnyObject> {
                // do whatever with jsonResult
                
                for redditData in enumerate(jsonResult) {
                    
                    var reddit = Reddit()
                }
                
            }
     
            }, failure:  { (operation: NSURLSessionDataTask!,
                error: NSError!) in
                println("Error: " + error.localizedDescription)
            })
    
    }
}


