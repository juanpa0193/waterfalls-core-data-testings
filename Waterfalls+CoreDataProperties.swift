//
//  Waterfalls+CoreDataProperties.swift
//  waterfalls-coredatatesting
//
//  Created by JuanPa Villa on 7/19/16.
//  Copyright © 2016 JuanPa Villa. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Waterfalls {

    @NSManaged var image: NSData?
    @NSManaged var title: String?
    @NSManaged var location: String?
    @NSManaged var waterfallDescription: String?

}
