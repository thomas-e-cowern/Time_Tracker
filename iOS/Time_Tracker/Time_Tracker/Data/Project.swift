//
//  Project.swift
//  Time_Tracker
//
//  Created by Thomas Cowern New on 2/22/21.
//

import Foundation

class Project: ObservableObject, Identifiable, Codable {
    @Published var id = UUID().uuidString
    @Published var name = ""
    @Published var developer = ""
    @Published var description = ""
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case developer
        case description
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: CodingKeys.id)
        try container.encode(name, forKey: CodingKeys.name)
        try container.encode(developer, forKey: CodingKeys.developer)
        try container.encode(description, forKey: CodingKeys.description)
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        developer = try values.decode(String.self, forKey: .developer)
        description = try values.decode(String.self, forKey: .description)
    }
    
    init () {
        
    }
}

var testProjectOne : Project {
    let project = Project()
    project.id = "1"
    project.name = "Test Project One"
    project.developer = "Tom Bomb"
    project.description = "The first test project...."
    return project
}
var testProjectTwo : Project {
    let project = Project()
    project.id = "2"
    project.name = "Test Project Two"
    project.developer = "Tom C"
    project.description = "The second test project...."
    return project
}
