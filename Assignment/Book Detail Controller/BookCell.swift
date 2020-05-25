//
//  BookCell.swift
//  Assignment
//
//  Created by Saurabh Borate on 23/05/20.
//

import UIKit
import SDWebImage
class BookCell: UICollectionViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var contentImage: UIImageView!
    @IBOutlet weak var author: UILabel!
    var bookData : Book?
    
    func setupData()  {
        self.contentImage.sd_setImage(with: URL(string: bookData?.formats?.imageJPEG ?? ""), placeholderImage: UIImage(named: "bookDefaultIcon"))
        self.contentImage.addViewBorder(borderColor: UIColor.darkGray.cgColor, borderWith: 1)
        self.title.text = bookData?.title
        if  (bookData?.authors!.count)! > 0{
            self.author.text =  bookData?.authors?[0].name
        }
        
    }
}

