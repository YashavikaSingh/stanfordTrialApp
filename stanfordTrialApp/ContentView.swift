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
    @State var isFaceUp = false
    var base  =  RoundedRectangle(cornerRadius: 22)
    var body: some View{
        ZStack{
            if(isFaceUp)
            {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
        Text("👻")
    }
else
        {
            base
        }
            
        }.onTapGesture{isFaceUp.toggle()}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
