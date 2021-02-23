//
//  ContentView.swift
//  Time_Tracker
//
//  Created by Thomas Cowern New on 2/22/21.
//

import SwiftUI

struct ContentView: View {
    
    // MARK:  Properties
    @State var showNewProjectForm : Bool = false
    @ObservedObject var data = DataController.shared
    
    var projects : [Project] = []
    
    // MARK:  Body
    var body: some View {
        NavigationView {
            VStack {
                if data.projects.count == 0 {
                    Text("Add a project to begin ✅")
                        .fontWeight(.bold)
                        .font(.callout)
                } else {
                    ForEach( data.projects ) { project in
                        NavigationLink(destination: ProjectTimerView(project: project))
                            {
                                ProjectListTile(project: project)
                            }
                            
                        }
                }
            }
            .navigationTitle("Time Tracker")
            .navigationBarItems(trailing: Button(action: {
                showNewProjectForm.toggle()
            }){
                Text("Add New Project")
            })
        }
        .sheet(isPresented: $showNewProjectForm, content: {
            AddProjectView()
        })
    }
}

// MARK:  Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(projects: [testProjectOne, testProjectTwo])
    }
}
