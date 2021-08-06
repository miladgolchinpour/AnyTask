//
//  EditTaskForm.swift
//  EditTaskForm
//
//  Created by Milad Golchinpour on 8/4/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct EditTaskForm: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var task: Task
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Infomation")) {
                    TextField("Title", text: $task.name ?? "")
                    Toggle("Completed", isOn: $task.completed)
                }
                
                Section {
                    DatePicker("Date", selection: $task.date ?? Date())
                }
                
                Section {
                    Button("Done") {
                        try? moc.save()
                        presentationMode.wrappedValue.dismiss()
                    }
                    .disabled(task.name!.isEmpty)
                }
            }
            #if os(macOS)
            .padding(40)
            .frame(width: 600, height: 300)
            #endif
            .navigationTitle("Edit Task")
            .toolbar {
                Button("Cancel") { presentationMode.wrappedValue.dismiss() }
            }
        }
        #if os(macOS)
        .frame(width: 600, height: 300)
        #endif
    }
}

struct EditTaskForm_Previews: PreviewProvider {
    static var previews: some View {
        EditTaskForm(task: Task())
    }
}
