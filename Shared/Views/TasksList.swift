//
//  TasksList.swift
//  TasksList
//
//  Created by Milad Golchinpour on 8/4/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

struct TasksList: View {
    var tasks: FetchedResults<Task>
    
    var body: some View {
        VStack {
            if tasks.isEmpty {
                Text("No Tasks")
                    .font(.headline)
            } else {
                ScrollView(showsIndicators: false) {
                    ForEach(tasks, id: \.self) { task in
                        TaskRow(task: task)
                            .padding(.vertical)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .blurStyle()
    }
}
