//
//  TaskRow.swift
//  TaskRow
//
//  Created by Milad Golchinpour on 8/4/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

/// Show Task Row View included Checkmark, Editing Buttons and Task title
struct TaskRow: View {
    @Environment(\.managedObjectContext) var moc
    
    @EnvironmentObject var settings: Settings
    @ObservedObject var task: Task
    
    @State private var showEditView = false
    
    var body: some View {
        HStack(spacing: 10) {
            // MARK: Change Task Completion Status Button
            Button {
                withAnimation(.spring()) {
                    moc.performAndWait {
                        task.completed.toggle()
                        try? moc.save()
                    }
                }
            } label: {
                Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
                    .font(.title2)
                    .foregroundColor(task.completed ? .green : .primary)
            }
            
            // MARK: Task Title
            Text(task.name ?? "Untitled")
            
            Spacer()
            
            if settings.isEditingMode {
                HStack(spacing: 5) {
                    // MARK: Edit Task Button
                    Button {
                        showEditView.toggle()
                    } label: {
                        Image(systemName: "square.and.pencil")
                            .foregroundColor(.primary)
                    }
                    .contentShape(Rectangle())
                    
                    // MARK: Delete Task Button
                    Button {
                        withAnimation(.spring()) {
                            moc.delete(task)
                            try? moc.save()
                        }
                    } label: {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }
                    .contentShape(Rectangle())
                }
                .font(.title3)
            }
        }
        .sheet(isPresented: $showEditView) { EditTaskForm(task: task) }
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(task: Task())
            .environmentObject(Settings())
    }
}
