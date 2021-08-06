//
//  AddTaskForm.swift
//  AddTaskForm
//
//  Created by Milad Golchinpour on 8/4/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct AddTaskForm: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name = ""
    @State private var date: Date = Date()
    
    @State private var showDatePicker = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Information")) {
                    TextField("Title", text: $name)
                    Toggle("Preferred Date", isOn: $showDatePicker.animation())
                }
                
                if showDatePicker {
                    Section {
                        DatePicker("Date", selection: $date)
                    }
                }
                
                Section {
                    Button("Done") {
                        saveNewTask()
                    }
                    .disabled(name.isEmpty)
                }
            }
            #if os(macOS)
            .padding(40)
            .frame(width: 600, height: 300)
            #endif
            .navigationTitle("New Task")
            .toolbar {
                Button("Cancel") { presentationMode.wrappedValue.dismiss() }
            }
        }
        #if os(macOS)
        .frame(width: 600, height: 300)
        #endif
    }
    
    func saveNewTask() {
        let task = Task(context: moc)
        
        task.name = name
        task.date = date
        task.completed = false
        
        do {
            try moc.save()
        } catch {
            print("Error when saving new task")
        }
        
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddTaskForm_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskForm()
    }
}
