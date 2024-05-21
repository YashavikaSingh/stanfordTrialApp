// view 
//   EmojiMemoryGameView.swift
//  stanfordTrialApp
//
//

import SwiftUI


struct  EmojiMemoryGameView: View {
    let persistenceController = PersistenceController.shared
    var ViewModel : EmojiMemoryGame = EmojiMemoryGame()
   
    var body: some View{
            ScrollView{
                cards
            }
        .padding()
    }
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120 ))]) {
            ForEach(ViewModel.cards.indices, id: \.self)
            { index in CardView( ViewModel.cards[index]).aspectRatio(2/3, contentMode: .fit)
            }
        } .foregroundColor(.orange)
    }
}





struct CardView: View{
  
    let card : MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>) {
        self.card = card
    }
   
    var body: some View{
        ZStack{
        let base  =  RoundedRectangle(cornerRadius: 22)
        Group{
            base.foregroundColor(.white)
            base.strokeBorder(lineWidth: 2)
            Text(card.content).font(.largeTitle)
        }
        .opacity(card.isFaceUp ? 0 : 1)
            base.fill().opacity(card.isFaceUp ? 1 : 0)
        }
    }
}



struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
