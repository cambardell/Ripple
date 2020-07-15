//
//  ListTestView.swift
//  Ripple
//
//  Created by Cameron Bardell on 2020-07-15.
//  Copyright © 2020 Cameron Bardell. All rights reserved.
//

import SwiftUI

struct ListTestView: View {
    @EnvironmentObject var logData: LogData
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(
        entity: Log.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Log.date, ascending: false)
        ]
    ) var logs: FetchedResults<Log>
    
    var body: some View {
        List {
            
            ForEach(self.logs, id: \.self) { log in
                Text("test")
            }

        }
    }
}

struct ListTestView_Previews: PreviewProvider {
    static var previews: some View {
        ListTestView().environmentObject(LogData())
    }
}
