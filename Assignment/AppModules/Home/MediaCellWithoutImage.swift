//
//  MediaCellWithoutImage.swift
//  Assignment
//
//  Created by Saurabh Borate on 27/06/20.
//

import UIKit
import SDWebImage
class MediaCellWithoutImage: UITableViewCell {
    var postData : Article?
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDesignation: UILabel!
    @IBOutlet weak var lblComments: UILabel!
    @IBOutlet weak var lblLikes: UILabel!
    @IBOutlet weak var lblArticalContent: UILabel!
    @IBOutlet weak var lblArticalTitle: UILabel!
    @IBOutlet weak var lblArticalUrl: UILabel!
    @IBOutlet weak var imgArtical: UIImageView!
    @IBOutlet weak var lblArticalCreatedTime: UILabel!
    
    @IBOutlet weak var constantAticalImageHeight: NSLayoutConstraint!
    
    
    
    func setUpData(){
        self.imgUser.sd_setImage(with: URL(string: postData?.user?[0].avatar ?? ""), placeholderImage: UIImage(named: "PH-Logo"))
        self.lblName.text = postData?.user?[0].name ?? ""
        self.lblDesignation.text = postData?.user?[0].designation ?? ""
        self.lblArticalContent.text = postData?.content ?? ""
     //   if let title = postData?.media?[0].title
      //  self.lblArticalTitle.text = postData?.media?[0].title ?? ""
      //  self.lblArticalUrl.text = postData?.media?[0].url ?? ""
        if (postData?.media!.isEmpty)!{
            self.lblArticalTitle.text = ""
            self.lblArticalUrl.text = ""
        }else{
        if let title = postData?.media?[0].title{
            self.lblArticalTitle.text = title
        }else{
            self.lblArticalTitle.text = ""
        }
        if let url = postData?.media?[0].url{
            self.lblArticalUrl.text = url
        }else{
            self.lblArticalUrl.text = ""
            }}
        let timeOffset3 = getDateOffset(dateString: postData!.createdAt!)
       // print(timeOffset3)
        self.lblArticalCreatedTime.text = "\(timeOffset3) ago"
        //self.imgArtical.sd_setImage(with: URL(string: postData?.media?[0].image ?? "" ), placeholderImage: UIImage(named: "PH-Logo"))
        self.lblLikes.text = "Likes \(postData?.likes ?? 0)"
        self.lblComments.text = "Comments \(postData?.comments ?? 0)"
    }
    
    func getDateOffset(dateString : String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"
        
        guard let date = dateFormatterGet.date(from: dateString) else {
            print("There was an error decoding the string")
            return ""
        }
        let now = Date()
        return now.offset(from: date)
    }

}

