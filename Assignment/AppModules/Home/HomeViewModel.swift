//
//  HomeViewModel.swift
//  Assignment
//
//  Created by Saurabh Borate on 28/06/20.
//

import Foundation


class HomeViewModel{
    var postList : Box<[Article]> = Box([Article]())
    var loader : Box<Bool> = Box(false)
    var alertMessage : Box<String> = Box(String())
    
}

extension HomeViewModel{
    func loadMedia(){
        self.loader.value = true
        networkCalls.fetchGenericCall(urlRequestString: networkConstants.baseUrl, requestParams: nil, requestMode: .GET, completion: { (response : [Article]) in
            self.postList.value = response
            self.loader.value = false
        }) { (error) in
            self.alertMessage.value = error!.localizedDescription
        }
    }
}

