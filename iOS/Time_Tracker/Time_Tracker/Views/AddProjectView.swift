//
//  AddProjectView.swift
//  Time_Tracker
//
//  Created by Thomas Cowern New on 2/22/21.
//

import SwiftUI

struct AddProjectView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var newProject = Project()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Project name", text: $newProject.name)
                    TextField("Project developer", text: $newProject.developer)
                    TextField("Project description", text: $newProject.description)
                }
                
                Section {
                    Button(action: {
                        DataController.shared.saveNewProject(project: newProject)
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Add New Project")
                    }
                }
            }
            .navigationBarItems(trailing: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Cancel")
            }))
        }
    }
}

struct AddProjectView_Previews: PreviewProvider {
    static var previews: some View {
        AddProjectView()
    }
}
