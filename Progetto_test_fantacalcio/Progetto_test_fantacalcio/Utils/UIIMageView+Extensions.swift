//
//  UIIMageView+Extensions.swift
//  Progetto_test_fantacalcio
//
//  Created by Nicola Lauritano on 06/06/23.
//

import Foundation
import UIKit

extension UIImageView {

 public func imageFromServerURL(urlString: String, placeholderImage: UIImage = UIImage()) {

        if self.image == nil{
              self.image = placeholderImage
        }

        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in

            if error != nil {
                print(error ?? "No Error")
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })

        }).resume()
    }}
