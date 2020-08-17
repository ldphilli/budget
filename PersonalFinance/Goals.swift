//
//  Goals.swift
//  PersonalFinance
//
//  Created by Luke Phillips on 06/08/2020.
//  Copyright © 2020 Luke Phillips. All rights reserved.
//

import SwiftUI



struct ColorManager {
    // create static variables for custom colors
    static let buttonAccent = Color("ButtonAccent")

    //... add the rest of your colors here
}



struct Goals: View {
    @State private var goalName = ""
    var body: some View {
      VStack {
        Button(action: {
            // What to perform
            print("Hello World tapped");
        }) {
            // How the button looks like
            Text("New Goal")
               .fontWeight(.semibold)
               //.frame(minWidth: 0, maxWidth: .infinity)
               .padding()
               .background(ColorManager.buttonAccent)
               .foregroundColor(Color.white)
               .cornerRadius(.infinity)
            }
         TextField("Title", text: $goalName)
      }
}

struct Goals_Previews: PreviewProvider {
    static var previews: some View {
        Goals()
      }
   }
}
