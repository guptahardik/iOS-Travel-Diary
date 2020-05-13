//
//  Places+CoreDataProperties.swift
//  ClassProjectHardik-V2
//
//  Created by Hardik Gupta on 4/21/20.
//  Copyright © 2020 Hardik Gupta. All rights reserved.
//
//

import Foundation
import CoreData


extension Places {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Places> {
        return NSFetchRequest<Places>(entityName: "Places")
    }

    @NSManaged public var namePlace: String?
    @NSManaged public var photo: Data?
    @NSManaged public var info: String?

}
