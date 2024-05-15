//
//  ContentView.swift
//  stanfordTrialApp
//
//  Created by Yashavika Singh on 12.05.24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View{
        HStack{
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
       
}

struct CardView: View{
    var isFaceUp: Bool = false
    var body: some View{
        ZStack{
            if(isFaceUp)
            {
                RoundedRectangle(cornerRadius: 22).foregroundColor(.white)
                RoundedRectangle(cornerRadius: 22).strokeBorder(lineWidth: 2)
        Text("👻")
    }
else
        {
            RoundedRectangle(cornerRadius: 22)
        }
            
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
