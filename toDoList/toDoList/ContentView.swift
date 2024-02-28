//
//  ContentView.swift
//  toDoList
//
//  Created by StudentAM on 2/27/24.
//

import SwiftUI

struct ContentView: View {
    @State private var input: String = "" //store the input
    @State private var tasks: [String] = [] //store the input in the array
    @State private var count: Int = 0 //keep track of how many tasks added
    @State private var showToast: Bool = false //check if input is empty or not
    
    var body: some View {
        NavigationView{
            VStack{ //allign components vertically
                Text("Number of tasks : \(count)") //add text for users to keep track of the number of tasks added
                    .padding() //add padding to the component
                    .frame(maxWidth: .infinity, alignment: .leading) //add width and allign it to the left
                
                TextField("Enter a new task", text: $input) //add text field to allow user input new task
                    .textFieldStyle(RoundedBorderTextFieldStyle()) //style the text field to have rounded border
                    .padding() //add padding to the component
                   
                   
                HStack{ //allign buttons horizontally
                    Button("Add task", action:{ //create add task button and when it is clicked, execute addTask func
                        addTask()
                    })
                    .padding() //add padding to the component
                    .background(input.isEmpty ? Color.gray : Color.blue) //check if input is empty then the background color is gray, or else change it to blue
                    .foregroundColor(.white) //font color is white
                    .cornerRadius(8) //border radius is 8
                    
                    
                    Button("Remove all tasks", action: { //create remove all tasks button and execute removeAll func when it is clicked
                        removeAll()
                    })
                    .disabled(tasks.isEmpty) //disable the button when there is no tasks
                    .padding() //add padding to the component
                    .background(tasks.isEmpty ? Color.gray : Color.blue) //check if task is empty, then background color is gray, or else change it to blue
                    .foregroundColor(.white) //font color is white
                    .cornerRadius(8) //border radius is 8
                }
                Spacer() //takes all the available spaces and expand vertically
                
                List{ //list each task added
                    ForEach(tasks, id: \.self){ task in Text(task)
                    } //differentiate each task, even if they are the same
                    .onDelete(perform: deleteItem) //allow users to delete specific task
                }

            }
            .navigationTitle("To-Do List") //add title
            
            .alert(isPresented: $showToast){ //if showToast is true, then show alert
                Alert(
                    title: Text("No task has added"),
            message: Text("Please enter a task!")
                    )
            }
        }

    }
    
    func deleteItem(offset: IndexSet){
        tasks.remove(atOffsets: offset) //remove item from the tasks array
        count -= 1 //remove 1 keep track the number of tasks
    }
    
    func addTask(){
        if input.isEmpty{ //check if user type something, if not show alert
            showToast = true
        }
        else{ //else, add task
            tasks.append(input) //append input to tasks array
            input = "" //make the input clear
            count += 1 //add 1 keep track the number of tasks
        }
    }
    
    func removeAll(){
        tasks.removeAll() //remove all the tasks
        count = 0 //reset the number of task
    }
    
}

#Preview {
    ContentView()
}
