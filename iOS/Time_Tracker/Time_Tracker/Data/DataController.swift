//
//  DataController.swift
//  Time_Tracker
//
//  Created by Thomas Cowern New on 2/22/21.
//

import Foundation

class DataController: ObservableObject {
    
    // MARK:  Properties
    static var shared = DataController()
    
    @Published var projects : [Project] = []

    func saveData () {
            DispatchQueue.global().async {
                if let defaults = UserDefaults(suiteName: "group.MobileSoftwareSystems.Time-Tracker") {
                    let encoder = JSONEncoder()
                    if let encoded = try? encoder.encode(self.projects) {
                        defaults.setValue(encoded, forKey: "projects")
                        defaults.synchronize()
//                        WidgetCenter.shared.reloadAllTimelines()
                    }
                }
            }
        }
    
    func loadData () {
            DispatchQueue.global().async {
                if let defaults = UserDefaults(suiteName: "group.MobileSoftwareSystems.Time-Tracker") {
                    if let data = defaults.data(forKey: "projects") {
                        let decoder = JSONDecoder()
                        if let jsonProjects = try? decoder.decode([Project].self, from: data) {
                            DispatchQueue.main.async {
                                self.projects = jsonProjects
                                print("projects from loadData: ", self.projects[0].id)
                            }
                        }
                    }
                }
            }
        }
    
    func saveNewProject (project: Project) {
        if let index = projects.firstIndex(where: {loopingProject -> Bool in
            return project.id == loopingProject.id
        }) {
            projects[index] = project
        } else {
            projects.append(project)
        }
        print("PJ:", projects[0].name)
        saveData()
    }
}
