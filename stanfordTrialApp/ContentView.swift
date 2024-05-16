//
//  ContentView.swift
//  stanfordTrialApp
//
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var cardCount = 4
    let emojis = ["👻", "🎃" , "🤡", "☠️", "🧟", "🧞", "🥷🏻", "🕸️", "👹", "🧙🏻‍♀️", "🎪"]
    var body: some View{
        VStack{
            ScrollView{
                cards
            }
                        Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            
            if(cardCount<emojis.count)
            {
                cardCount   += offset
            }
        }, label: {Image(systemName: symbol)}
               
        ).disabled(cardCount + offset > emojis.count || cardCount + offset < 1)
    }
    var cardCountAdjusters: some View{
        HStack{
            CardAdder
            Spacer()
            CardRemover
        }.font(.largeTitle).imageScale(.large)
    }
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120 ))]) {
            ForEach(0..<cardCount, id: \.self)
            { index in CardView(content: emojis[index]).aspectRatio(2/3, contentMode: .fit)
            }
        } .foregroundColor(.orange)
    }
    
    var CardAdder: some View{
        return cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }


    var CardRemover: some View{
        return  cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
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
