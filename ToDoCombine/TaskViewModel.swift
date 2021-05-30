//
//  TaskViewModel.swift
//  ToDoCombine
//
//  Created by Sheikh Bayazid on 5/30/21.
//

import Foundation
import Combine

class TaskViewModel: ObservableObject {
    let tasks = CurrentValueSubject<[String], Never> (["Buy Milk"])
    var newTasks = PassthroughSubject<String, Never>()
    
    var subscriptions = Set<AnyCancellable>()
    
    init() {
        // Data stream to create new task
        newTasks
            .filter ({ $0.count > 3})
            .sink { completion in
                print("Completion: \(completion)")
            }
            receiveValue: { [self] newTask in
                print("Before: \(tasks.value)")
                
                self.tasks.send(tasks.value + [newTask])
                self.objectWillChange.send() // HAVE TO WRITE THIS ELSE VIEW WILL NOT UPDATE THE DATA
                
                print("After: \(tasks.value)")
            }
            .store(in: &subscriptions)
        
        // Get initial values at launch like from file system
        // Save changes in to file system
    }
}
