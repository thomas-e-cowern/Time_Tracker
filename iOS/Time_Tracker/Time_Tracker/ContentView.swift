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
    @State var showNewProjectForm : Bool = false
    
    @State var projects : [Project] = []
    
    // MARK:  Body
    var body: some View {
        VStack {
            Button(action: {
                showNewProjectForm.toggle()
            }, label: {
                Text("Add a project...")
            })
            .sheet(isPresented: $showNewProjectForm, content: {
                AddProjectView()
            })
            
            
                ForEach( projects ) { project in
                    Text(project.name)
                }

            .foregroundColor(Color.white)
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
