//
//  AddProjectView.swift
//  Time_Tracker
//
//  Created by Thomas Cowern New on 2/22/21.
//

import SwiftUI

struct AddProjectView: View {
    
    @State var name : String
    @State var developer : String
    @State var description : String
    
    
    var body: some View {
        Form {
            Section {
                TextField("Project name", text: $name)
                TextField("Project developer", text: $developer)
                TextField("Project description", text: $description)
            }
            
            Section {
                Button(action: {
                    DataController.shared.projects.append(<#T##newElement: Project##Project#>)
                }, label: {
                    "Save New Project"
                })
            }
            
        }
    }
}

struct AddProjectView_Previews: PreviewProvider {
    static var previews: some View {
        AddProjectView(name: "New project", developer: "Tom", description: "This is a demo project")
    }
}
