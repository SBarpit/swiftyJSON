//
//  Modal.swift
//  SwiftyJSON
//
//  Created by Appinventiv Mac on 21/03/18.
//  Copyright © 2018 Appinventiv Mac. All rights reserved.
//



import Foundation

struct Result {
    
    var title:String
    var body:String
    var signatureCount:String
    
    init(result:JSON) {
    title = result["title"].stringValue
    body = result["body"].stringValue
    signatureCount = result["signatureCount"].stringValue
      
    }
}

