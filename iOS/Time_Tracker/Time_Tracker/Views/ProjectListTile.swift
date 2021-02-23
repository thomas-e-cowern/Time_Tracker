//
//  ProjectListTile.swift
//  Time_Tracker
//
//  Created by Thomas Cowern New on 2/23/21.
//

import SwiftUI

struct ProjectListTile: View {
    
    // MARK:  Properties
    @ObservedObject var data = DataController.shared
    var project : Project
    
    
    // MARK:  Body
    var body: some View {
        Text(project.name)
            .frame(minWidth: 250)
            .padding()
            .background(Color.green)
            .cornerRadius(10)
            
    }
}

// MARK:  Preview
struct ProjectListTile_Previews: PreviewProvider {
    static var previews: some View {
        ProjectListTile(project: testProjectOne)
    }
}
