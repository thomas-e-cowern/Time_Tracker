//
//  SaveTimeSegmentView.swift
//  Time_Tracker
//
//  Created by Thomas Cowern New on 3/4/21.
//

import SwiftUI

struct SaveTimeSegmentView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {

            VStack (alignment: .center) {
                Button(action: {
                    print("Saved time segment")
                }) {
                    Text("Save Time Segment")
                }
                .padding()
                .background(Color.green)
                .frame(width: 200, alignment: .center)
                
                Spacer()
                    .frame(height: 50)
                
                Button(action: {
                    print("Canceled time segment")
                }) {
                    Text("Exit Without Saving")
                }
                .padding()
                .background(Color.red)
                .frame(width: 200)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            }

    }
}

struct SaveTimeSegmentView_Previews: PreviewProvider {
    static var previews: some View {
        SaveTimeSegmentView()
    }
}
