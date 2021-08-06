//
//  ContentView.swift
//  Shared
//
//  Created by Milad Golchinpour on 8/4/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(entity: Task.entity(), sortDescriptors: [])
    var tasks: FetchedResults<Task>
    
    var bgImage: String {
        #if os(macOS)
        return "BGmac"
        #else
        return "BG"
        #endif
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Group {
                HeadlineView()
                
                TasksList(tasks: tasks)
            }
            .frame(maxWidth: 500)
            
            Spacer()
        }
        .buttonStyle(.plain)
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image(bgImage).resizable().scaledToFill().ignoresSafeArea())
        #if os(macOS)
        .frame(minWidth: 350, minHeight: 500)
        .frame(maxWidth: 712)
        #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
