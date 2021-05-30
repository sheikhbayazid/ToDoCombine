//
//  ContentView.swift
//  ToDoCombine
//
//  Created by Sheikh Bayazid on 5/30/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = TaskViewModel()
    @State private var isSheetShowing = false
    
    var addTask: some View {
        VStack {
            Button("Add Task") {
                self.isSheetShowing = true
            }
            .sheet(isPresented: $isSheetShowing) {
                AddTaskView(viewModel: viewModel)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.tasks.value, id: \.self) { task in
                    Text(task)
                }
            }.listStyle(PlainListStyle())
            .navigationTitle("Tasks")
            .navigationBarItems(trailing: addTask)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
