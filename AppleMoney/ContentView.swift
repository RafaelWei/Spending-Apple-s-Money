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
        let item1 = Item(image: "mascara", amount: 0, itemName: "Máscara", price: 1)
        let item2 = Item(image: "chinelo", amount: 0, itemName: "Chinelo", price: 5)
        let item3 = Item(image: "livros", amount: 0, itemName: "Livro", price: 15)
        let item4 = Item(image: "caixaCorona", amount: 0, itemName: "Pack de cerveja", price: 20)
        let item5 = Item(image: "rodizioJapones", amount: 0, itemName: "Rodizio japones", price: 40)
        let item6 = Item(image: "JBL_PULSE3", amount: 0, itemName: "JBL pulse 3", price: 100)
        let item7 = Item(image: "chuteira", amount: 0, itemName: "Chuteira", price: 150)
        let item8 = Item(image: "airpods", amount: 0, itemName: "Airpods", price: 200)
        let item9 = Item(image: "ps5", amount: 0, itemName: "Playstation 5", price: 500)
        let item10 = Item(image: "drone", amount: 0, itemName: "Drone", price: 800)
        let item11 = Item(image: "rickshaw", amount: 0, itemName: "Rickshaw elétrico", price: 2300)
        let item12 = Item(image: "cavalo", amount: 0, itemName: "Cavalo", price: 2500)
        let item13 = Item(image: "carro", amount: 0, itemName: "Carro zero", price: 7000)
        let item14 = Item(image: "anelDiamante", amount: 0, itemName: "Anel de diamante", price: 10000)
        let item15 = Item(image: "jetski", amount: 0, itemName: "Jet ski", price: 12000)
        let item16 = Item(image: "rolex", amount: 0, itemName: "Rolex", price: 15000)
        let item17 = Item(image: "tesla", amount: 0, itemName: "Tesla", price: 75000)
        let item18 = Item(image: "lamborghini", amount: 0, itemName: "Lamborghini", price: 280000)
        let item19 = Item(image: "mcdonalds", amount: 0, itemName: "Franquia do McDonalds", price: 1500000)
        let item20 = Item(image: "iate", amount: 0, itemName: "Iate", price: 7500000)
        let item21 = Item(image: "tanque", amount: 0, itemName: "Tanque", price: 8000000)
        let item22 = Item(image: "formula1", amount: 0, itemName: "Carro de fórmula 1", price: 15000000)
        let item23 = Item(image: "mansao", amount: 0, itemName: "Mansão", price: 45000000)
        let item24 = Item(image: "boeing", amount: 0, itemName: "Boeing 747", price: 148000000)
        let item25 = Item(image: "neymar", amount: 0, itemName: "Neymar", price: 190000000)
        let item26 = Item(image: "monaLisa", amount: 0, itemName: "Mona Lisa", price: 780000000)
        let item27 = Item(image: "messi", amount: 0, itemName: "Messi", price: 822000000)
        let item28 = Item(image: "basketball", amount: 0, itemName: "Time de basquete", price: 1200000000)
        let item29 = Item(image: "realMadrid", amount: 0, itemName: "Real Madrid", price: 1700000000)
        let item30 = Item(image: "samsung", amount: 0, itemName: "Samsung", price: 60000000000)
        
        
        return [item1, item2, item3, item4, item5, item6, item7, item8, item9, item10, item11, item12, item13, item14, item15, item16, item17, item18, item19, item20, item21, item22, item23, item24, item25, item26, item27, item28, item29, item30]
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
    @State var showAlert: Bool
    
    @Binding var money: Int64
    
    var body: some View{
        ZStack() {
            Color.clear
//            Color(red: 1, green: 0, blue: 0, opacity: 0).edgesIgnoringSafeArea(.all)
            VStack(alignment: .center, spacing: 3){
                AvatarView(image: item.image, size: 100)
                Text(item.itemName).font(.system(size: 40))
                Text("$\(item.price)")
                    .foregroundColor(Color.green)
                    .font(.system(size: 30))
                HStack(alignment: .center, spacing: 40){
                    Button(action: {}) {
                        Text("Sell")
                        .fontWeight(.bold)
                        .font(.system(size: 25))
                        .padding()
                        .background(Color(red: 0.74, green: 0.76, blue: 0.78))
                        .cornerRadius(40)
                        .foregroundColor(.black)
                        .padding(10)
                    }
                    .onTapGesture {
                        if(self.item.amount > 0){
                            self.item.decreaseOne()
                            self.money = self.money + self.item.price
                        }
                    }
                    
                    Text("\(item.amount)")
                        .font(.system(size: 30))
                    
                    Button(action: {}) {
                        Text("Buy")
                        .fontWeight(.bold)
                        .font(.system(size: 25))
                        .padding()
                        .background(Color.green)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                        .padding(10)
                    }
                    .alert(isPresented: self.$showAlert) {
                        Alert(title: Text("Parabéns"), message: Text("Você conseguiu colocar a Apple no Serasa"), dismissButton: .default(Text("OK")))
                    }
                    .onTapGesture {
                        if(self.money>0){
                            self.item.addOne()
                            if(self.item.price <= 200){
                                for i in 1...self.item.price {
                                    Timer.scheduledTimer(withTimeInterval: Double(i)*0.005, repeats: false) { (timer) in
                                        self.money = self.money - 1
                                    }
                                }
                            }
                            else if(self.item.price <= 800){
                                for i in 1...self.item.price {
                                    Timer.scheduledTimer(withTimeInterval: Double(i)*0.001, repeats: false) { (timer) in
                                        self.money = self.money - 1
                                    }
                                }
                            }
                            else if(self.item.price <= 15000){
                                for i in 1...self.item.price {
                                    Timer.scheduledTimer(withTimeInterval: Double(i)*0.0001, repeats: false) { (timer) in
                                        self.money = self.money - 1
                                    }
                                }
                            }
                            else if(self.item.price <= 280000){
                                let aux = self.item.price/1000
                                for i in 1...aux {
                                    Timer.scheduledTimer(withTimeInterval: Double(i)*0.005, repeats: false) { (timer) in
                                        self.money = self.money - 1000
                                    }
                                }
                            }
                            else if(self.item.price <= 1500000){
                                let aux = self.item.price/10000
                                for i in 1...aux {
                                    Timer.scheduledTimer(withTimeInterval: Double(i)*0.01, repeats: false) { (timer) in
                                        self.money = self.money - 10000
                                    }
                                }
                            }
                            else if(self.item.price <= 15000000){
                                let aux = self.item.price/100000
                                for i in 1...aux {
                                    Timer.scheduledTimer(withTimeInterval: Double(i)*0.01, repeats: false) { (timer) in
                                        self.money = self.money - 100000
                                    }
                                }
                            }
                            else if(self.item.price <= 45000000){
                                let aux = self.item.price/1000000
                                for i in 1...aux {
                                    Timer.scheduledTimer(withTimeInterval: Double(i)*0.025, repeats: false) { (timer) in
                                        self.money = self.money - 1000000
                                    }
                                }
                            }
                            else if(self.item.price <= 190000000){
                                let aux = self.item.price/10000000
                                for i in 1...aux {
                                    Timer.scheduledTimer(withTimeInterval: Double(i)*0.02, repeats: false) { (timer) in
                                        self.money = self.money - 10000000
                                    }
                                }
                            }
                            else if(self.item.price <= 822000000){
                                let aux = self.item.price/1000000
                                for i in 1...aux {
                                    Timer.scheduledTimer(withTimeInterval: Double(i)*0.002, repeats: false) { (timer) in
                                        self.money = self.money - 1000000
                                    }
                                }
                            }
                            else if(self.item.price <= 1700000000){
                                let aux = self.item.price/10000000
                                for i in 1...aux {
                                    Timer.scheduledTimer(withTimeInterval: Double(i)*0.01, repeats: false) { (timer) in
                                        self.money = self.money - 10000000
                                    }
                                }
                            }
                            else if(self.item.price <= 60000000000){
                                let aux = self.item.price/1000000000
                                for i in 1...aux {
                                    Timer.scheduledTimer(withTimeInterval: Double(i)*0.025, repeats: false) { (timer) in
                                        self.money = self.money - 1000000000
                                    }
                                }
                            }
                            
                            if(self.money - self.item.price < 0){
                                self.showAlert = true
                            }
                        }
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
    
    @State var showAlert: Bool = false
    @State var money: Int64 = 1000000000000
    
    /// view body
    var body: some View {
        NavigationView{
            VStack{
                // List inside the navigationController
                List {
                    // loop through all the posts and create a post view for each item
                    ForEach(items) { item in
                        itemView(item: item, showAlert: false, money: self.$money)
                    }
                }
                .padding(.leading, -20)   // this will removes the left spacing (default is 20)
                .padding(.trailing, -20)  // this will removes the right spacing (default is 20)
                
                RoundedRectangle(cornerRadius: 0)
                .frame(height: 50)
                .foregroundColor(Color(red: 0.10, green: 0.74, blue: 0.61))
                .overlay(Text("R$\(money)").font(.system(size: 30)))
            }
            .navigationBarTitle(Text("Apple no Serasa").font(.system(size: 60)), displayMode: .inline)
            .navigationBarItems(leading:
                Image("appleCarryingMoney")
                    .resizable()
                    .frame(width: 70, height: 70, alignment: .leading)
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
