//
//  BookModel.swift
//  Assignment
//
//  Created by Saurabh Borate on 22/05/20.
//

import Foundation


import Foundation

// MARK: - ProductModel
class BooksResponse: Codable {
    var count: Int?
    var next: String?
    var previous: String?
    var results: [Book]?
    
    init(count: Int?, next: String?, previous: String?, results: [Book]?) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }
}

// MARK: - Result
class Book: Codable, Hashable {
    
    static func == (lhs: Book, rhs: Book) -> Bool {
        return lhs.id == rhs.id
        
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    var id: Int
    var authors: [Author]?
    //  var bookshelves: [String]?
    //  var downloadCount: Int?
    var formats: Formats?
    //    var languages: [Language]?
    //    var mediaType: MediaType?
    var subjects: [String]?
    var title: String?
    
    //    init(id: Int?, authors: [Author]?, bookshelves: [String]?, downloadCount: Int?, formats: Formats?, languages: [Language]?, mediaType: MediaType?, subjects: [String]?, title: String?) {
    //        self.id = id
    //        self.authors = authors
    //        self.bookshelves = bookshelves
    //        self.downloadCount = downloadCount
    //        self.formats = formats
    //        self.languages = languages
    //        self.mediaType = mediaType
    //        self.subjects = subjects
    //        self.title = title
    //    }
}

// MARK: - Author
class Author: Codable {
    var birthYear, deathYear: Int?
    var name: String?
    
    init(birthYear: Int?, deathYear: Int?, name: String?) {
        self.birthYear = birthYear
        self.deathYear = deathYear
        self.name = name
    }
}

// MARK: - Formats
class Formats: Codable {
    var applicationXMobipocketEbook: String?
    var applicationPDF: String?
    var textPlainCharsetUsASCII, textPlainCharsetUTF8: String?
    var applicationRDFXML: String?
    var applicationZip: String?
    var applicationEpubZip: String?
    var textHTMLCharsetUTF8: String?
    var textPlainCharsetISO88591: String?
    var imageJPEG: String?
    var textPlain: String?
    var textHTMLCharsetUsASCII: String?
    var textHTML: String?
    var textRtf: String?
    var textHTMLCharsetISO88591: String?
    var applicationPrsTex: String?
    
    init(applicationXMobipocketEbook: String?, applicationPDF: String?, textPlainCharsetUsASCII: String?, textPlainCharsetUTF8: String?, applicationRDFXML: String?, applicationZip: String?, applicationEpubZip: String?, textHTMLCharsetUTF8: String?, textPlainCharsetISO88591: String?, imageJPEG: String?, textPlain: String?, textHTMLCharsetUsASCII: String?, textHTML: String?, textRtf: String?, textHTMLCharsetISO88591: String?, applicationPrsTex: String?) {
        self.applicationXMobipocketEbook = applicationXMobipocketEbook
        self.applicationPDF = applicationPDF
        self.textPlainCharsetUsASCII = textPlainCharsetUsASCII
        self.textPlainCharsetUTF8 = textPlainCharsetUTF8
        self.applicationRDFXML = applicationRDFXML
        self.applicationZip = applicationZip
        self.applicationEpubZip = applicationEpubZip
        self.textHTMLCharsetUTF8 = textHTMLCharsetUTF8
        self.textPlainCharsetISO88591 = textPlainCharsetISO88591
        self.imageJPEG = imageJPEG
        self.textPlain = textPlain
        self.textHTMLCharsetUsASCII = textHTMLCharsetUsASCII
        self.textHTML = textHTML
        self.textRtf = textRtf
        self.textHTMLCharsetISO88591 = textHTMLCharsetISO88591
        self.applicationPrsTex = applicationPrsTex
    }
    enum CodingKeys: String, CodingKey {
        case imageJPEG = "image/jpeg"
        case textHTMLCharsetISO88591 = "text/html; charset=iso-8859-1"
    }
}

enum Language {
    case en
    case es
}

enum MediaType {
    case text
}
