//
//  AlamoreFireAPIService.swift
//  CleanSwift
//
//  Created by Raheel Sadiq on 29/11/2020.
//

import UIKit
import Alamofire

class AlamoreFireAPIService: NSObject, APIService {
    
    let alamoFire = Session.default
    
    func execute(
        request: URLRequest,
        completion: @escaping(APIManager.Status) -> Void) {

        alamoFire.request(request).responseJSON { (dataResponse) in
                        
            let code = dataResponse.response?.statusCode ?? 0
            switch dataResponse.result {
            case .success(let json):
                switch code {
                case 200:
                    completion(.success(json))
            
                case 204:
                    completion(.success(nil))
                default:
                    completion(.notHandled)
                }
                
            case .failure(let error):
                switch code/100 {
                case 4:
                    completion(.failure(error))
                default:
                    if error.code == URLError.notConnectedToInternet.rawValue {
                        completion(.internetUnavailable)
                    }else{
                        completion(.notHandled)
                    }
                }
            }
        }
    }
}

extension Error {
    var code: Int { return (self as NSError).code }
    var domain: String { return (self as NSError).domain }
}
