//
//  ContentView.swift
//  toDoList
//
//  Created by StudentAM on 2/27/24.
//

import SwiftUI
struct ContentView: View {
    //store and manage variable
    @State private var input: String = ""
    @State private var tasks: [String] = []
    @State private var count: Int = 0
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Number of tasks : \(count)")
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                TextField("Enter a new task", text: $input)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                   
                   
                HStack{
                    Button("Add task", action:{
                        addTask()
                    })
                    .disabled(input.isEmpty)
                    .padding()
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    
                    
                    Button("Remove all tasks", action: {
                        removeAll()
                    })
                    .disabled(tasks.isEmpty)
                    .padding()
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
                Spacer()
                
                List{
                    ForEach(tasks, id: \.self){task in Text(task)
                    }
//                    .oneDelete(perform: removeAll)
                }
            }
            .navigationTitle("To-Do List")
            
        }
    }
    func addTask(){
        tasks.append(input)
        input = ""
    }
    
    func removeAll(){
        
    }
}

#Preview {
    ContentView()
}
