//
//  model.swift
//  ClassProjectHardik-V2
//
//  Created by Hardik Gupta on 4/21/20.
//  Copyright © 2020 Hardik Gupta. All rights reserved.
//

import Foundation
import UIKit
import CoreData

public class PlacesModel{
    
    init() {
        
    }
    
    var fetchResults = [Places]()
    
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    func addPlaceInfo(pName:String, det:String, picture1: Data)
    {
        let ent = NSEntityDescription.entity(forEntityName: "Places", in: self.managedObjectContext)
        //adding to the managed object context
        let newItem = Places(entity: ent!, insertInto: self.managedObjectContext)
        newItem.namePlace = pName
        newItem.info = det
        
        if var t:Data = picture1 as Data
        {
            newItem.photo = picture1 as Data
        }
        
        do {
            try self.managedObjectContext.save()
        } catch _ {
        }
        
        print(newItem)
    }
    
    func numberofrecords() -> Int
        {
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Places")
                var x = 0
                fetchResults = ((try? managedObjectContext.fetch(fetchRequest)) as? [Places])!
            
                x = fetchResults.count
            
                print("Number of entities: \(x)\n")
        
                return x
        }
    
    func getPlaceObject(eyeDee:String) -> Places
    {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Places")
        
        fetchResults = ((try? managedObjectContext.fetch(fetchRequest)) as? [Places])!
        
        for i in 0..<fetchResults.count
        {
            if fetchResults[i].namePlace == eyeDee
            {
                return fetchResults[i]
            }
        }
        return fetchResults[fetchResults.count]
    }
    
    
    
    func doesPlaceInfoExist(eyeDee:String) -> Bool
    {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Places")
        fetchResults = ((try? managedObjectContext.fetch(fetchRequest)) as? [Places])!
        
        for i in 0..<fetchResults.count
        {
            if fetchResults[i].namePlace == eyeDee
            {
                return true
            }
        }
        return false
    }
    
    func delete(x : Int){
        managedObjectContext.delete(fetchResults[x])
        
        fetchResults.remove(at:x)
        
        do {
            
            try managedObjectContext.save()
        } catch {
            
        }
    }
    
    func updatePlace(nameS:String, infoS:String, picture1: Data)
      {
          
              let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Places")
             // fetchRequest.predicate = NSPredicate(format: "jobId = '-1'")
              fetchResults = ((try? managedObjectContext.fetch(fetchRequest)) as? [Places])!

              for object in fetchResults
              {
                if(object.namePlace == nameS)
                 {
                      
                    object.info = infoS
                    
                      if var t:Data = picture1 as Data
                      {
                        object.photo = picture1 as Data
                      }
                      
                  }
              }
              do {
                  try managedObjectContext.save()
                  print("saved!")
              } catch let error as NSError  {
                  print("Could not save \(error), \(error.userInfo)")
              }
         
      }
    
    
}
