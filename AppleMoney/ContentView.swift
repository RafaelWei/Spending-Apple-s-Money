//
//  ContentView.swift
//  AppleMoney
//
//  Created by Rafael Wei on 28/09/20.
//  Copyright © 2020 Rafael Wei. All rights reserved.
//

import SwiftUI

struct Item: Identifiable {
    var id: String = UUID().uuidString
    
    let image: String
    
    let price: Int64
    
    var amount: Int
    
    let itemName: String
    
    mutating func addOne() {
        self.amount = self.amount+1
    }
    
    mutating func decreaseOne() {
        self.amount = self.amount-1
    }
    
    init(image: String, amount: Int, itemName: String, price: Int64){
        self.image = image
        self.amount = amount
        self.itemName = itemName
        self.price = price
    }
}

struct itemTestData {
    
    static func items() -> [Item] {
        let item1 = Item(image: "tim", amount: 0, itemName: "Big Mac", price: 2)
        let item2 = Item(image: "boeing", amount: 0, itemName: "1 dolar", price: 2)
        let item3 = Item(image: "basquete", amount: 0, itemName: "Batata de Marechal", price: 2)
        let item4 = Item(image: "tim", amount: 0, itemName: "Sandália havaianas", price: 2)
        let item5 = Item(image: "tim", amount: 0, itemName: "Vans", price: 2)
        let item6 = Item(image: "tim", amount: 0, itemName: "Alcool gel", price: 2)
        let item7 = Item(image: "tim", amount: 0, itemName: "Samsung", price: 2)
        
        return [item1, item2, item3, item4, item5, item6, item7]
    }
}

struct AvatarView: View{
    let image: String
    
    let size: CGFloat
    
    var body: some View{
        Image(image)
        .resizable()
        .frame(width: size, height: size)
        .aspectRatio(contentMode: .fill)
//        .clipShape(Circle())
//            .overlay(Circle().stroke(Color.white.opacity(0.5), lineWidth: 5))
    }
}

struct itemView: View{
    @State var item: Item
    @Binding var money: Int64
    
    var body: some View{
        ZStack() {
            Color.clear
//            Color(red: 1, green: 0, blue: 0, opacity: 0).edgesIgnoringSafeArea(.all)
            VStack(alignment: .center, spacing: 3){
                AvatarView(image: item.image, size: 100)
                Text(item.itemName).font(.system(size: 40))
                Text("$2")
                    .foregroundColor(Color.green)
                    .font(.system(size: 30))
                HStack(alignment: .center, spacing: 40){
                    Button(action: {}) {
                        Text("Sell")
                        .padding(6)
                        .font(.system(size: 25))
                    }
                    .background(Color.red)
                    .onTapGesture {
                        self.item.decreaseOne()
                        self.money = self.money + self.item.price
                    }
                    
                    Text("\(item.amount)")
                        .font(.system(size: 30))
                    
                    Button(action: {}) {
                        Text("Buy")
                        .padding(6)
                        .font(.system(size: 25))
                    }
                    .background(Color.green)
                    .foregroundColor(Color.white)
                    .onTapGesture {
                        self.item.addOne()
                        self.money = self.money - self.item.price
                    }
                }
            }
            .padding(.leading, 15)
            .padding(.trailing, 15)
            .background(Color.clear)
        }
        
    }
}

struct ContentView: View {
    /// items
    let items = itemTestData.items()
    
    @State var money: Int64 = 1000000000000
    
    /// view body
    var body: some View {
            VStack{
                Image("appleCarryingMoney")
                .resizable()
                .frame(width: 70, height: 70, alignment: .leading)
    
                // List inside the navigationController
                List {
                    // loop through all the posts and create a post view for each item
                    ForEach(items) { item in
                        itemView(item: item, money: self.$money)
                    }
                }
                .padding(.leading, -20)   // this will removes the left spacing (default is 20)
                .padding(.trailing, -20)  // this will removes the right spacing (default is 20)
                
                RoundedRectangle(cornerRadius: 0)
                .frame(height: 50)
                .foregroundColor(Color(red: 0.10, green: 0.74, blue: 0.61))
                .overlay(Text("R$ \(money)").font(.system(size: 30)))
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
