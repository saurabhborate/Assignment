//
//  CustomUIClasses.swift
//  intellicar
//
//  Created by Ketan on 28/01/20.
//  Copyright © 2020 Ketan Doiphode. All rights reserved.
//

import Foundation
import SwiftEntryKit
import UIKit


   enum notificationType
   {
       case success
       case fail
      
   }

   
func showNotification(type: notificationType, title: String, description:String )  {
       
   var gradientColors : [EKColor] {
           
           switch type {
         
           case .success:
             return  [EKColor(UIColor(red:0.80, green:0.21, blue:0.42, alpha:1.0)), EKColor(UIColor(red:0.74, green:0.25, blue:0.20, alpha:1.0))]
           case .fail:
//             return  [EKColor(UIColor(red:0.98, green:0.27, blue:0.27, alpha:1.0)),EKColor( UIColor(red:0.84, green:0.08, blue:0.08, alpha:1.0))]
      return  [EKColor(UIColor(red:0.80, green:0.21, blue:0.42, alpha:1.0)), EKColor(UIColor(red:0.74, green:0.25, blue:0.20, alpha:1.0))]
           
       }
       
       }
       
       var contentImage : UIImage? {
           
           
           switch type {
           
           case .success:
               return UIImage(named: "success")
           case .fail:
                return UIImage(named: "sad")
          
          
           
       }
       }
       
       
       
       // Generate top floating entry and set some properties
       var attributes = EKAttributes()
 
       if (type == .fail || type == .success )
       {
                  attributes = EKAttributes.topFloat
       }
       else
       {
           attributes = EKAttributes.bottomFloat
       }
       
       attributes.entryBackground = .gradient(gradient: .init(colors: gradientColors, startPoint: .zero, endPoint: CGPoint(x: 1, y: 1)))
       attributes.popBehavior = .animated(animation: .init(translate: .init(duration: 0.3), scale: .init(from: 1, to: 0.7, duration: 0.7)))
       attributes.shadow = .active(with: .init(color: .black, opacity: 0.5, radius: 10, offset: .zero))
       attributes.statusBar = .dark
       attributes.scroll = .enabled(swipeable: true, pullbackAnimation: .jolt)
       attributes.positionConstraints.maxSize = .init(width: .constant(value: UIScreen.main.bounds.width), height: .intrinsic)
       
    let title = EKProperty.LabelContent(text: title, style: .init(font: UIFont.boldSystemFont(ofSize: 15), color: .white))
       let description = EKProperty.LabelContent(text: description, style: .init(font: UIFont.systemFont(ofSize: 12), color: .white))
       let image = EKProperty.ImageContent(image: contentImage!, size: CGSize(width: 35, height: 35))
       let simpleMessage = EKSimpleMessage(image: image, title: title, description: description)
       let notificationMessage = EKNotificationMessage(simpleMessage: simpleMessage)
       
       let contentView = EKNotificationMessageView(with: notificationMessage)
       SwiftEntryKit.display(entry: contentView, using: attributes)
       
   }

   
