//
//  AddTaskView.swift
//  ToDoCombine
//
//  Created by Sheikh Bayazid on 5/30/21.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: TaskViewModel
    @State private var newTask = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Enter your task", text: $newTask)
                Button("Add") {
                    viewModel.newTasks.send(newTask)
                    presentationMode.wrappedValue.dismiss()
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .navigationTitle("Add New Task")
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(viewModel: TaskViewModel())
    }
}
