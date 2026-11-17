//
//  ContentView.swift
//  Animation compition
//
//  Created by Joseph Swensen on 11/17/26.
//

import SwiftUI

struct ContentView: View {
    @State var rectangleWidth: CGFloat = 50
    @State var rectangleHeight: CGFloat = 50
    @State var buttonLabel: String = "START"
    @State var rotationAngle: CGFloat = 0
    @State var triangleColor: Color = .clear
    @State var triangleOffsetX: Int = .zero
    @State var triangleOffsetY: Int = .zero
    @State var triangleOpacity: Double = 100
    @State var triangleRotationAngle: CGFloat = 0
    
    
    var body: some View {
        ZStack {
            Color.blue
            
            VStack {
                
                Spacer()
                
                ZStack {
                    Rectangle()
                        .frame(width: rectangleWidth, height: rectangleHeight)
                        .foregroundStyle(.gray)
                        .rotationEffect(.degrees(rotationAngle))
                    
                    Triangle()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(triangleColor)
                        .offset(x: CGFloat(triangleOffsetX), y: CGFloat(triangleOffsetY))
                        .opacity(triangleOpacity)
                        .rotationEffect(.degrees(triangleRotationAngle))
                }
                
                Spacer()
                
                Button(buttonLabel) {
                    
                    if buttonLabel == "START" {
                        withAnimation(.bouncy.delay(0.5)) {
                            rectangleHeight += 400
                        }
                        
                        withAnimation(.bouncy.delay(1)) {
                            rectangleWidth += 400
                        }
                        
                        withAnimation(.bouncy.delay(1).speed(0.5)) {
                            rotationAngle += 180
                        }
                        
                        withAnimation(.bouncy.delay(3.2)) {
                            triangleColor = .green
                        }
                        
                        withAnimation(.snappy.delay(4)) {
                            triangleOffsetX += 100
                        }
                        
                        withAnimation(.snappy.delay(4.5)) {
                            triangleOffsetX -= 150
                            triangleOffsetY -= 100
                        }
                        
                        withAnimation(.snappy.delay(5)) {
                            triangleOffsetY += 230
                        }
                        
                        withAnimation(.snappy.delay(5.5)) {
                            triangleOffsetX += 50
                            triangleOffsetY -= 150
                        }
                        
                        withAnimation(.snappy.delay(6)) {
                            triangleOffsetX += 200
                            triangleOffsetY += 100
                        }
                        
                        withAnimation(.bouncy.delay(6.3)) {
                            triangleRotationAngle = 400
                        }
                        
                        withAnimation(.easeOut.speed(0.2).delay(6.5)) {
                            triangleOpacity -= 100
                        }
                        
                        buttonLabel = "RESTART"
                    } else {
                        withAnimation() {
                            buttonLabel = "START"
                            triangleColor = .clear
                            rectangleHeight = 50
                            rectangleWidth = 50
                            rotationAngle = 0
                        }
                    }
                }
                .buttonStyle(.glass)
                .padding()
            }
        }
        .ignoresSafeArea()
    }
}
    
//-----------------------------------------------------

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

#Preview {
    ContentView()
}
