//
//  DashBoardVM.swift
//  Assignment
//
//  Created by Saurabh Borate on 22/05/20.
//

import Foundation
import UIKit
import Alamofire
class DashBoardVM {
    
   let topics = ["Fiction", "Drama", "Humor" , "Politics" , "Philosophy" , "History" , "Adventure"]
    
    
    
    
}

extension DashBoardVM {
    
    func showTopicsDetail(index : Int)  {
        let parameters = Parameters()
        
        networkCalls.fetchGenericCall(urlRequestString: networkConstants.baseUrl + "?topic=humor" , requestParams: parameters, requestMode: .GET, completion: { (response : BooksResponse) in
            let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
            var vc : BooksVC =  storyboard.instantiateViewController(withIdentifier: "BooksVC") as! BooksVC
            vc.viewModel.booksArray = response.results
        
        }) { (error) in
        
        }
      
    }
    
}
