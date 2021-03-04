//
//  ProjectTimerView.swift
//  Time_Tracker
//
//  Created by Thomas Cowern New on 2/23/21.
//

import SwiftUI

struct ProjectTimerView: View {
    
    // MARK:  Propeties
    var project : Project
    @State var seconds = 0
    @State var minutes = 0
    @State var hours = 0
    
    @State var timerRunning : Bool = false
    @State var timer: Timer? = nil
    
    // MARK:  Body
    var body: some View {
        VStack {
            Text(project.name)
                .padding()
                .font(.title)
            
            Spacer()
                .frame(height: 200)
            
            Text("\(hours) hours : \(minutes) minutes : \(seconds) seconds")
                .padding()
                .font(.title2)
                .background(Color.gray)
            
            Spacer()
                .frame(height: 200)
            
            if timerRunning {
                HStack {
                    Button(action: {
                        stopTimer()
                        timerRunning = false
                    }) {
                        Text("Stop")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                    .padding()
                    .frame(width: 100)
                    .background(Color.red)
                    .border(Color.black)
                    .cornerRadius(5)
                    .shadow(color: .gray, radius: 10, x: 10, y: 1.0)
                    
                    Button(action: {
                        stopTimer()
                        timerRunning = false
                    }) {
                        Text("Pause")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                    .padding()
                    .frame(width: 100)
                    .background(Color.yellow)
                    .border(Color.black)
                    .cornerRadius(5)
                    .shadow(color: .gray, radius: 10, x: 10, y: 1.0)
                }
            } else {
                Button(action: {
                    startTimer()
                    timerRunning = true
                }) {
                    Text("Start")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
                .padding()
                .frame(width: 100)
                .background(Color.green)
                .border(Color.black)
                .cornerRadius(5)
                .shadow(color: .gray, radius: 10, x: 10, y: 1.0)
                
            }
        }
    }

    func startTimer () {
        let startTime = Date()
        print("Start time: \(startTime)")
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
      
            if seconds == 59 {
                seconds = 0
                if minutes == 59 {
                    minutes = 0
                    hours = hours + 1
                } else {
                    minutes = minutes + 1
                }
            } else {
                seconds = seconds + 1
            }
        }
    }
    
    func stopTimer(){
        timer?.invalidate()
        timer = nil
      }
}



// MARK:  Preview
struct ProjectTimerView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectTimerView(project: testProjectTwo)
    }
}
