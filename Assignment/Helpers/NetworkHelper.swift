//
//  NetworkHelper.swift
//  Assignment
//
//  Created by Saurabh Borate on 28/06/20.
//

import Foundation
import Alamofire
typealias errorBlock = (Error?) -> ()

extension String : Error {}

enum HTTPOperationCode : String
{
    case GET
    case POST
}

class networkCalls  {
    
    
   static func killAllNetworkRequest()  {

    }
    
    
    static func fetchGenericCall<T: Codable>( urlRequestString:String , requestParams : Parameters? ,requestMode: HTTPOperationCode, completion : @escaping ([T]) -> (), onError: @escaping errorBlock)//
    {
        
        var method : HTTPMethod? = .get
        switch requestMode {
       
        case .GET:
         method = .get
            
            break
        case .POST:
            method = .post
        break
            
        
        }
        
        
        
        AF.request(urlRequestString, method: method! ,parameters: requestParams, encoding: URLEncoding.queryString)
            .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
//                print("Progress: \(progress.fractionCompleted)")
            }
            .validate()
            .responseJSON { response in

//                print("Success: \(response.result)")
              //  print("Response String: \(String(describing: response.value))")
                
                if let errorDesc = response.error?.localizedDescription
                {
                    print("Sorry Api :\(urlRequestString) has Error , Code : \(String(describing: response.response?.statusCode)) , Reason : \(errorDesc)")
                  
                    if let reasonx = errorDesc.components(separatedBy: ":").last {
                        onError(reasonx)
                        return
                    }
                    onError(response.error)
                    return
                }
                
                let statusCode             = response.response?.statusCode
                if statusCode == nil
                {
                    
                }
                else if statusCode != 200
                {
                    
                }
                else
                {

                    do {
                        
                      //  let repos = decoder.decode([T].self, from: data)
                        let genericObject = try JSONDecoder().decode([T].self, from: response.data!)
                        completion(genericObject)
                    } catch let error {
                        print(error)
                    }
                    
                }
                
                
        }
        
        
        
    }
    
}
    
   
