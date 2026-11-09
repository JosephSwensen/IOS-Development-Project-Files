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
    
    var body: some View {
        ScrollView {
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
        }
    }
}

#Preview {
    ContentView()
}
