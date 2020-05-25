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
    private var searchText = ""
    private var timer: Timer?
    private var nextPage : String?
    private var coverFilter = true
    private var booksContainer : [Book]? {
      
        didSet {
            booksArray.value = booksContainer?.removingDuplicates() ?? [Book]()
        }
    }
    //
     
     
     
     func updateSearch(searchText: String)  {
            
             timer?.invalidate()  // Cancel any previous timer
              self.searchText = searchText
             if searchText.isEmpty || searchText.count < 2
             {
                 return
             }
             
                  // …schedule a timer for 0.5 seconds
             timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(loadSearchedBooks), userInfo: nil, repeats: false)
         }
   @objc func loadSearchedBooks()  {
        loader.value = true
        searchBookByLanguage()
        searchBookByTitleOrAuthorName()
        
    }
    func searchBookByLanguage (){
        networkCalls.fetchGenericCall(urlRequestString: "http://skunkworks.ignitesol.com:8000/books?languages=\(searchText)" , requestParams: Parameters(), requestMode: .GET, completion: { (response : BooksResponse) in
            if let books =  response.results
            {
                self.booksContainer?.append(contentsOf: books)
                self.booksArray.value = books
                print("languages book count = \(books.count)")
            }
            self.loader.value = false
        }) { (error) in
            
        }
    }
    func searchBookByTitleOrAuthorName (){
        
        networkCalls.fetchGenericCall(urlRequestString: setupCoverFilter(inputUrl: setupCoverFilter(inputUrl: "http://skunkworks.ignitesol.com:8000/books?search=\(searchText)")) , requestParams: Parameters(), requestMode: .GET, completion: { (response : BooksResponse) in
            if let books =  response.results
            {
                self.booksContainer?.append(contentsOf: books)
                self.booksArray.value = books
                print("TitleOrAuthorName book count = \(books.count)")
            }
            self.loader.value = false
        }) { (error) in
            
        }
    }
    
    func updateCoverFilter()  {
        coverFilter = !coverFilter
    }
    
    func setupCoverFilter(inputUrl : String ) -> String {
        let url =  coverFilter ? inputUrl + "&mime_type=image%2Fjpeg" : inputUrl
        defer {
            print("calling : \(url)")
        }
        return url
     }
}

extension BooksVM {
    
    func loadBooksWithTopic() {
        loader.value = true
        networkCalls.fetchGenericCall(urlRequestString: setupCoverFilter(inputUrl: "http://skunkworks.ignitesol.com:8000/books/?topic=\(searchTopic)") , requestParams: Parameters(), requestMode: .GET, completion: { (response : BooksResponse) in
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


extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()

        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }

    mutating func removeDuplicates() {
        self = self.removingDuplicates()
        
    }

}
