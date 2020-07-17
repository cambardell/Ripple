//
//  DataProvider.swift
//  Ripple
//
//  Created by Cameron Bardell on 2020-07-15.
//  Copyright © 2020 Cameron Bardell. All rights reserved.
//

import Foundation
import CoreData
import SwiftUI

class LogData: ObservableObject {
    @FetchRequest(
        entity: Log.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Log.date, ascending: false)
        ]
    ) var logs: FetchedResults<Log>
}

func isLogAtDate(date: Date, morning: Bool, context: NSManagedObjectContext) -> Bool {
    
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Log")
    request.predicate = NSPredicate(format: "date = %@", date as CVarArg)
    request.returnsObjectsAsFaults = false
    
    do {
        
        let result = try context.fetch(request)
        for _ in result as! [NSManagedObject] {
            if result.isEmpty {
                return false
            } else {
                return true
            }
      }
        
    } catch {
        
        print("Failed")
    }
    return false
    
}
