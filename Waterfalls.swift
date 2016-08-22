//
//  Waterfalls.swift
//  waterfalls-coredatatesting
//
//  Created by JuanPa Villa on 7/19/16.
//  Copyright © 2016 JuanPa Villa. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Waterfalls: NSManagedObject {
    
    //Below we are using this function to save the images into CORE Data, we first turn the image passed in into a PNG representation of data, and then we assign that data to the self.image (which is the var created by CoreData in the entity "Waterfall"

    func setWaterfallImage(img: UIImage) {
        let data = UIImagePNGRepresentation(img)
        self.image = data
    }
    
    //The function below is to actually get the data
    
    func getWaterfallImg() -> UIImage {
        let img = UIImage(data: self.image!)!
        return img
    }

    
    
    
}
