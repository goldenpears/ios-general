import Foundation
import Alamofire

class RequestManager: NSObject
{
    var orgsNames = [String]()
    
    static func fetchOrganizations(data: @escaping ([String: AnyObject]) -> Void)
    {
        NSLog("Fetching!")
        Alamofire.request("http://gitlab.faifly.com/ios-general/ios-tutorial/uploads/ffffec34fa4a727922bb1e09cc24b21d/tutorial.json").responseJSON { response in
            print(response.result)
            if let JSON = response.result.value
            {
                let dictionary = JSON as? [String: AnyObject]
                data(dictionary!)
            }
        }
    }
}
