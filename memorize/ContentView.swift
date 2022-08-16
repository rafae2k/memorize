//
//  ContentView.swift
//  memorize
//
//  Created by Rafo 🥺 on 15/08/22.
//

import SwiftUI

var emojisCategories = [
    "vehicles": ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🚚", "🚛", "🚜", "🛴", "🚲", "🛵", "🏍", "🚨", "🚔", "🚍", "🚘", "🚖", "🚡", "🚠", "🚟", "🚃", "🚋", "🚞", "🚝", "🚄", "🚅", "🚈", "🚂", "🚆", "🚇", "🚊", "🚉", "✈️", "🛫", "🛬", "🛩", "💺", "🛰", "🚀", "🛸", "🚁"],
    "animals": ["🦆", "🦉", "🦊", "🐱", "🐈", "🐯", "🐅", "🐆", "🐴", "🐎", "🦄", "🐮", "🐂", "🐃", "🐄", "🐷", "🐖", "🐗", "🐽", "🐏", "🐑", "🐐", "🐪", "🐫", "🦙", "🦒", "🐘", "🦏", "🦛", "🦘", "🐭", "🐁", "🐀", "🐹", "🐰", "🐇", "🐿", "🦔", "🦇", "🐻", "🐨", "🐼", "🦘", "🦡", "🐾", "🦃", "🐔", "🐓", "🐣", "🐤", "🐥", "🐦", "🐧", "🕊", "🦅", "🦆", "🦢", "🦉", "🦚", "🦜", "🐸", "🐊", "🐢", "🦎", "🐍", "🐲", "🐉", "🦕", "🦖", "🐳", "🐋", "🐬", "🐟", "🐠", "🐡", "🦈", "🐙", "🐚", "🐌", "🦋", "🐛", "🐜", "🐝", "🐞", "🦗", "🕷", "🕸", "🦂", "🦟", "🦠", "💐", "🌸", "💮", "🏵", "🌹", "🥀", "🌺", "🌻", "🌼", "🌷", "🌱",],
    "food": ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🍈", "🍒", "🍑", "🍍", "🥭", "🥥", "🥝", "🍅", "🍆", "🥑", "🥦", "🥒", "🌶", "🌽", "🥕", "🥔", "🍠", "🥐", "🍞", "🥖", "🥨", "🧀", "🥚", "🍳", "🥞", "🥓", "🥩", "🍗", "🍖", "🌭", "🍔", "🍟", "🍕", "🥪", "🥙", "🌮", "🌯", "🥗", "🥘", "🥫", "🍝", "🍜", "🍲", "🍛", "🍣", "🍱", "🥟", "🍤", "🍙", "🍚", "🍘", "🍥", "🥠", "🍢", "🍡", "🍧", "🍨", "🍦", "🥧", "🍰", "🎂", "🍮", "🍭", "🍬", "🍫", "🍿", "🧂", "🍩", "🍪", "🌰", "🥜", "🍯", "🥛", "🍼", "🥤", "🍵", "☕", "🍶", "🍺", "🍻", "🥂", "🍷", "🥃"]
    
]

struct ContentView: View {
    var body: some View {
        let emojiArray: [String] = emojisCategories["vehicles"] ?? ["🥂", "🍷", "🥃", "🍰", "🎂"]
        
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
