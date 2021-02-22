//
//  ContentView.swift
//  Time_Tracker
//
//  Created by Thomas Cowern New on 2/22/21.
//

import SwiftUI

struct ContentView: View {
    
    // MARK:  Properties
    @State private var selectedProject : String = ""
    @State private var newProject : String = ""
    @State var showNewProjectTextField : Bool = false
    
    // MARK:  Body
    var body: some View {
        VStack {
            Button(action: {
                showNewProjectTextField = true
            }, label: {
                Text("Add a project...")
            })
            if showNewProjectTextField {
                TextField("Enter your name", text: $newProject)
                Button(action: {
//                    DataController.shared.projects.append(newProject)
                }, label: {
                    Text("Add")
                    Image(systemName: "plus")
                })
            }
            
            Picker("Please choose a project", selection: $selectedProject) {
//                ForEach( DataController.shared.projects, id: \.self) {
//                    Text($0.name)
//                }
            }
            Text("You selected: \(selectedProject)")
        }
    }
}

// MARK:  Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
