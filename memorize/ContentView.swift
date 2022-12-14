//
//  ContentView.swift
//  memorize
//
//  Created by Rafo ðĨš on 15/08/22.
//

import SwiftUI

var emojisCategories = [
    "vehicles": ["ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ðī", "ðē", "ðĩ", "ð", "ðĻ", "ð", "ð", "ð", "ð", "ðĄ", "ð ", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "âïļ", "ðŦ", "ðŽ", "ðĐ", "ðš", "ð°", "ð", "ðļ", "ð"],
    "animals": ["ðĶ", "ðĶ", "ðĶ", "ðą", "ð", "ðŊ", "ð", "ð", "ðī", "ð", "ðĶ", "ðŪ", "ð", "ð", "ð", "ð·", "ð", "ð", "ð―", "ð", "ð", "ð", "ðŠ", "ðŦ", "ðĶ", "ðĶ", "ð", "ðĶ", "ðĶ", "ðĶ", "ð­", "ð", "ð", "ðđ", "ð°", "ð", "ðŋ", "ðĶ", "ðĶ", "ðŧ", "ðĻ", "ðž", "ðĶ", "ðĶĄ", "ðū", "ðĶ", "ð", "ð", "ðĢ", "ðĪ", "ðĨ", "ðĶ", "ð§", "ð", "ðĶ", "ðĶ", "ðĶĒ", "ðĶ", "ðĶ", "ðĶ", "ðļ", "ð", "ðĒ", "ðĶ", "ð", "ðē", "ð", "ðĶ", "ðĶ", "ðģ", "ð", "ðŽ", "ð", "ð ", "ðĄ", "ðĶ", "ð", "ð", "ð", "ðĶ", "ð", "ð", "ð", "ð", "ðĶ", "ð·", "ðļ", "ðĶ", "ðĶ", "ðĶ ", "ð", "ðļ", "ðŪ", "ðĩ", "ðđ", "ðĨ", "ðš", "ðŧ", "ðž", "ð·", "ðą",],
    "food": ["ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ðĨ­", "ðĨĨ", "ðĨ", "ð", "ð", "ðĨ", "ðĨĶ", "ðĨ", "ðķ", "ð―", "ðĨ", "ðĨ", "ð ", "ðĨ", "ð", "ðĨ", "ðĨĻ", "ð§", "ðĨ", "ðģ", "ðĨ", "ðĨ", "ðĨĐ", "ð", "ð", "ð­", "ð", "ð", "ð", "ðĨŠ", "ðĨ", "ðŪ", "ðŊ", "ðĨ", "ðĨ", "ðĨŦ", "ð", "ð", "ðē", "ð", "ðĢ", "ðą", "ðĨ", "ðĪ", "ð", "ð", "ð", "ðĨ", "ðĨ ", "ðĒ", "ðĄ", "ð§", "ðĻ", "ðĶ", "ðĨ§", "ð°", "ð", "ðŪ", "ð­", "ðŽ", "ðŦ", "ðŋ", "ð§", "ðĐ", "ðŠ", "ð°", "ðĨ", "ðŊ", "ðĨ", "ðž", "ðĨĪ", "ðĩ", "â", "ðķ", "ðš", "ðŧ", "ðĨ", "ð·", "ðĨ"]
    
]

struct ContentView: View {
    var body: some View {
        let emojiArray: [String] = emojisCategories["vehicles"] ?? ["ðĨ", "ð·", "ðĨ", "ð°", "ð"]
        
        VStack() {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                    ForEach(emojiArray[0..<emojiArray.count], id: \.self) { emoji in
                        Card(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            
            Spacer(minLength: 20)
            
            HStack() {
                CategoryButton(categoryName: "Vehicles", categorySymbol: "car")
                Spacer()
                CategoryButton(categoryName: "Animals", categorySymbol: "tortoise")
                Spacer()
                CategoryButton(categoryName: "Food", categorySymbol: "fork.knife")
            }
        }.padding()
        
    }
}

struct Card: View {
    var content: String
    @State var isShowing: Bool = false
    
    var body: some View {
    
        ZStack() {
            let shape = RoundedRectangle(cornerRadius: 20)
                
            if isShowing {
                shape
                    .stroke(lineWidth: 3)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
                
                Text(content).font(.largeTitle)
            } else {
                shape.fill(.red)
            }
        }
        .onTapGesture {
            isShowing = !isShowing
        }
    }
}


struct CategoryButton: View {
    var categoryName: String
    var categorySymbol: String
    
    var body: some View {
        Button {
            
            
        } label: {
            VStack() {
                Image(systemName: categorySymbol).font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                Text(categoryName)
            }
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
