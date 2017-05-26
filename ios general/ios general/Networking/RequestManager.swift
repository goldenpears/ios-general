//
//  RequestManager.swift
//  ios general
//
//  Created by lokovna on 5/26/17.
//  Copyright © 2017 Darina Locovna. All rights reserved.
//

import Foundation
import Alamofire

class RequestManager: NSObject
{
    static func fetchOrganizations(_: [String : AnyObject])
    {
        NSLog("Fetching!")
        Alamofire.request("http://gitlab.faifly.com/ios-general/ios-tutorial/uploads/ffffec34fa4a727922bb1e09cc24b21d/tutorial.json").responseJSON
        {
            response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value
            {
                print("JSON: \(JSON)")
            }
        }
    }
}
