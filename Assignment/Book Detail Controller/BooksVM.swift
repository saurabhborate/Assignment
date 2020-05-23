//
//  BooksVM.swift
//  Assignment
//
//  Created by Saurabh Borate on 22/05/20.
//

import Foundation
import Alamofire
import GradientLoadingBar
class BooksVM{
    var booksArray : Box<[Book]> = Box([Book]())
    var searchTopic = ""
    let loader : Box<Bool> = Box(false)
    private var nextPage : String?
    private var booksContainer : [Book]? {
      
        didSet {
            booksArray.value = booksContainer ?? [Book]()
        }
    }
}

extension BooksVM {
    
    func loadBooksWithTopic() {
        loader.value = true
        networkCalls.fetchGenericCall(urlRequestString: "http://skunkworks.ignitesol.com:8000/books/?topic=\(searchTopic)" , requestParams: Parameters(), requestMode: .GET, completion: { (response : BooksResponse) in
            if let books =  response.results
            {
                self.booksContainer = books
                self.nextPage = response.next
            }
            self.loader.value = false
        }) { (error) in
            
        }
    }
    
    func loadMoreBooks()  {
        
        if let nextPageUrl = nextPage {
            
            loader.value = true
                   networkCalls.fetchGenericCall(urlRequestString: nextPageUrl , requestParams: Parameters(), requestMode: .GET, completion: { (response : BooksResponse) in
                       if let books =  response.results
                       {
                        self.booksContainer?.append(contentsOf: books)
                           self.nextPage = response.next
                       }
                       self.loader.value = false
                   }) { (error) in
                       
                   }
        }

    }
}
