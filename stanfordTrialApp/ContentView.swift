//
//  ContentView.swift
//  stanfordTrialApp
//
//

import SwiftUI
import CoreData

struct ContentView: View {
 
    let emojis = ["👻", "🎃" , "🤡", "☠️", "🧟", "🧞", "🥷🏻", "🕸️", "👹", "🧙🏻‍♀️", "🎪"]
    var body: some View{
            ScrollView{
                cards
            }
        .padding()
    }
    
    
    
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120 ))]) {
            ForEach(emojis.indices, id: \.self)
            { index in CardView(content: emojis[index]).aspectRatio(2/3, contentMode: .fit)
            }
        } .foregroundColor(.orange)
    }
    

  
}





struct CardView: View{
  
    let content :String
    @State var isFaceUp = false
   
    var base  =  RoundedRectangle(cornerRadius: 22)
    var body: some View{
        ZStack{
        Group{
            base.foregroundColor(.white)
            base.strokeBorder(lineWidth: 2)
            Text(content).font(.largeTitle)
        }
        .opacity(isFaceUp ? 0 : 1)
        base.fill().opacity(isFaceUp ? 1 : 0)
        }
        .onTapGesture{isFaceUp.toggle()}
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
