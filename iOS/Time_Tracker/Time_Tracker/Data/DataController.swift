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
    
    @Published var projects : [String] = []

    func saveData () {
            DispatchQueue.global().async {
                if let defaults = UserDefaults(suiteName: "group.MobileSoftwareServices.Time_Tracker") {
                    let encoder = JSONEncoder()
                    if let encoded = try? encoder.encode(self.projects) {
                        defaults.setValue(encoded, forKey: "projects")
                        defaults.synchronize()
//                        WidgetCenter.shared.reloadAllTimelines()
                    }
                }
            }
        }
}
