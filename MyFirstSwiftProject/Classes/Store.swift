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
   
    typealias completionHandler = (reddits:[Reddit]) -> Void
    func parseReddits(completionClosure:completionHandler) {
    
        AFHTTPSessionManager().GET(REDDIT_TOP, parameters: nil, success: { (operation: NSURLSessionDataTask!,
            responseObject: AnyObject!) in
            
            println("JSON: " + responseObject.description)
          
            let json = JSONValue(responseObject)
            let topReddits = json["data"]["children"].array!
            
            var reddits = [Reddit]()
            
                for redditData in topReddits {
                    
                    let redditDictionary:Dictionary = redditData["data"].object!
                    var reddit = Reddit()
                    reddit.redditTitle = redditDictionary["title"]?.string
                    reddits.append(reddit)
                }
            
            completionClosure(reddits:reddits)
     
            }, failure:  { (operation: NSURLSessionDataTask!,
                error: NSError!) in
                println("Error: " + error.localizedDescription)
            })
    
    }
}


