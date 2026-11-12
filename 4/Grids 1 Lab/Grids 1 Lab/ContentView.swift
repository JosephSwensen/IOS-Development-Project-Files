//
//  ContentView.swift
//  Grids 1 Lab
//
//  Created by Joseph Swensen on 11/9/26.
//

import SwiftUI

struct ContentView: View {
    
    let hatRows = [
        GridItem(.fixed(150))
    ]
    
    let shirtRows = [
        GridItem(.fixed(200)),
        GridItem(.fixed(200))
    ]
    
    let pantRows = [
        GridItem(.adaptive(minimum: 100, maximum: 200)),
        GridItem(.adaptive(minimum: 100, maximum: 200)),
        GridItem(.adaptive(minimum: 100, maximum: 200)),
        GridItem(.adaptive(minimum: 100, maximum: 200))
    ]
    
    let orderItems = Array(hats.prefix(2)) + Array(shirts.prefix(1)) + Array(pants.prefix(1))

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                Color.clear
                    .frame(height: 0)
                    .id("top")
    
                Section("Hats") {
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: hatRows) {
                            ForEach(hats, id: \.name) { hat in
                                VStack {
                                    Text(hat.name)
                                    Text(hat.size)
                                    Text(hat.color)
                                    Text(String(format: "%.2f", hat.price))
                                }
                                .padding()
                                .font(.title)
                                .border(.black)
    
                            }
                        }
                        .scrollTargetLayout()
                    }
                    .scrollTargetBehavior(.viewAligned)
                }
                .font(.title)
                
                Section("Shirts") {
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: shirtRows) {
                            ForEach(shirts, id: \.name) { shirt in
                                VStack {
                                    Text(shirt.name)
                                    Text(shirt.size)
                                    Text(shirt.color)
                                    Text(String(format: "%.2f", shirt.price))
                                }
                                .padding()
                                .font(.title)
                                .border(.black)
    
                            }
                        }
                        .scrollTargetLayout()
                    }
                    .scrollTargetBehavior(.viewAligned)
                }
                .font(.title)
                
                Section("Pants") {
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: pantRows) {
                            ForEach(pants, id: \.name) { pant in
                                VStack {
                                    Text(pant.name)
                                    Text(pant.size)
                                    Text(pant.color)
                                    Text(String(format: "%.2f", pant.price))
                                }
                                .padding()
                                .font(.title)
                                .border(.black)
    
                            }
                        }
                        .scrollTargetLayout()
                    }
                    .scrollTargetBehavior(.viewAligned)
                }
                .font(.title)
    
                OrderSummaryView(items: orderItems)
                    .padding()
    
                Button("Back to Top") {
                    withAnimation {
                        proxy.scrollTo("top", anchor: .top)
                    }
                }
                .padding(.bottom)
            }
        }
    }
}

struct OrderSummaryView: View {
    let items: [Clothing]

    var total: Double {
        items.reduce(0) { $0 + $1.price }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Order Summary")
                .font(.title)

            Grid(alignment: .leading, horizontalSpacing: 24, verticalSpacing: 12) {
                GridRow {
                    Text("Item")
                    Text("Size")
                    Text("Price")
                        .gridColumnAlignment(.trailing)
                }
                .font(.headline)

                Divider()
                    .gridCellUnsizedAxes(.horizontal)

                ForEach(items, id: \.name) { item in
                    GridRow {
                        Text(item.name)
                        Text(item.size)
                        Text(item.price, format: .currency(code: "USD"))
                    }
                }

                GridRow {
                    Text("Total")
                        .gridCellColumns(2)
                    Text(total, format: .currency(code: "USD"))
                }
                .font(.headline)
            }
        }
    }
}

#Preview {
    ContentView()
}
