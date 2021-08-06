//
//  HeadlineView.swift
//  HeadlineView
//
//  Created by Milad Golchinpour on 8/4/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct HeadlineView: View {
    @EnvironmentObject var settings: Settings
    @State private var showAddView = false
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text("Any Task")
                    .font(.title)
                    .fontWeight(.semibold)
                Spacer()
                Button(settings.isEditingMode ? "Done" : "Edit") {
                    withAnimation(.spring()) {
                        settings.isEditingMode.toggle()
                    }
                }
            }
            
            Button {
                showAddView.toggle()
            } label: {
                Text("New Task")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .blurStyle()
            }
        }
        .blurStyle()
        .sheet(isPresented: $showAddView, content: AddTaskForm.init)
    }
}

struct HeadlineView_Previews: PreviewProvider {
    static var previews: some View {
        HeadlineView()
    }
}
