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
    
   let topics = ["Fiction", "Drama", "Humour" , "Politics" , "Philosophy" , "History" , "Adventure"]
    
        
}

extension DashBoardVM {
    
    func showTopicsDetail(index : Int) -> UIViewController {
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let vc : BooksVC =  storyboard.instantiateViewController(withIdentifier: "BooksVC") as! BooksVC
        vc.viewModel.searchTopic = topics[index]
        return vc
    }
}
