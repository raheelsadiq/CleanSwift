//
//  APIManager.swift
//  CleanSwift
//
//  Created by Raheel Sadiq on 29/11/2020.
//

import UIKit
import Alamofire

protocol APIService {
    func execute(request:URLRequest,
                 completion: @escaping (_ status:APIManager.Status) -> Void)
}

class APIManager: NSObject {
    
    enum Status {
        case success(Any?)
        case failure(Error?)
        case internetUnavailable
        case notHandled
    }
    
    let apiService: APIService
    
    init(service: APIService) {
        apiService = service
    }
    
    func execute(request: Request,
                 completion: @escaping ((_ status:APIManager.Status) -> Void) ) {

        //Create Request, add anyting into header etc
        let urlRequest = request.urlRequest()

        apiService.execute(request: urlRequest) { (status) in
            completion(status)
        }
    }
}

// MARK: APIManager models

extension APIManager {
    enum Url: String {
        case fetchRepositories = "https://github-trending-api.waningflow.com/repositories?language=typescript&since=daily"
    }
   
    struct Request {
        
        init(url: Url, methodType: HTTPMethod, params: Any?) {
            self.url = URL(string: url.rawValue)!
            self.methodType = methodType
            self.params = params
        }
        
        let url: URL
        let methodType: HTTPMethod
        let params: Any?
        
        public func urlRequest() -> URLRequest {
            
            var request = URLRequest(url: url)
            request.httpMethod = methodType.rawValue
            request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
            
            request.allHTTPHeaderFields = [
                "Content-Type":"application/json",
                "Accept":"application/json",
            ]
            
            if let param = params {
                do{
                    let paramsData = try JSONSerialization.data(withJSONObject: param, options: JSONSerialization.WritingOptions.prettyPrinted)
                    request.httpBody = paramsData
                }catch{
                    print("Error creating body")
                }
            }
            return request
        }
    }
}
