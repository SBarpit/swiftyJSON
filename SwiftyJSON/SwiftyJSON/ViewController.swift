//
//  ViewController.swift
//  SwiftyJSON
//
//  Created by Appinventiv Mac on 21/03/18.
//  Copyright © 2018 Appinventiv Mac. All rights reserved.
//


import UIKit


class ViewController: UIViewController {

    var resultModel:Result!
   
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
        
        if let url = URL(string: urlString) {
            
            if let data = try? String(contentsOf: url) {
                
                let json = JSON(parseJSON: data)
                
                if json["metadata"]["responseInfo"]["status"].intValue == 200 {
                  
//                    print("Success **")
                    self.parse(json: json)
                    
                }
                
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4)) {
            self.fetch()
        }
    }
    
    
    // Error: Problem in handling array type
    
    func parse(json: JSON) {
        
        for var result in json["results"].arrayValue {
            
            // MARK: Initialising DATA Model
            
            resultModel = Result(result: result)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // MARK: Fetching data from model
    
    func fetch(){
        
        print(resultModel.title)
        print(resultModel.body)
        print(resultModel.signatureCount)
    }

}

