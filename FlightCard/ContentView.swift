//
//  ContentView.swift
//  FlightCard
//
//  Created by Scott Nelson on 2/5/20.
//  Copyright © 2020 Scott Nelson. All rights reserved.
//

import SwiftUI

struct VFXView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: VFXView.UIViewType, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}

struct FlightInfoView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Flight").foregroundColor(Color.gray)
                Text("AR 712")
            }
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text("Class")
                    .font(.system(size: 14))
                    .foregroundColor(Color.gray)
                Text("First")
            }
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text("Boarding")
                    .font(.system(size: 14))
                    .foregroundColor(Color.gray)
                Text("21:35")
            }
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text("Terminal")
                    .font(.system(size: 14))
                    .foregroundColor(Color.gray)
                Text("B")
            }
        }.frame(maxWidth: .infinity)
    }
}

struct PersonCardView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(.white)
                .shadow(color: Color.init(white: 0.9), radius: 10, x: 0, y: 10)
            
            VStack(spacing: 0) {
                PersonInfoView()
                PersonInfoView()
            }
        }
    }
}

struct PlaneCardView: View {
    var body: some View {
        
        ZStack {
            VFXView(effect: UIBlurEffect(style: .regular))
                .cornerRadius(16)
                .shadow(radius: 10 , x: 0, y: 10)
            
            VStack {
                Group {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("LAS")
                                .font(.largeTitle)
                            Text("24, Apr, 16:30")
                        }.foregroundColor(.white)
                        
                        Spacer()
                        
                        Image(systemName: "airplane")
                            .font(Font.system(size: 50, weight: .light))
                            .foregroundColor(.white)
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            Text("NYC")
                                .font(.largeTitle)
                            Text("20:45")
                        }.foregroundColor(.white)
                    }.padding(.top)
                    
                    Image("plane")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .shadow(radius: 10, x: 0, y: 10)
                    
                    FlightInfoView()
                }
                .padding(.leading, 16)
                .padding(.trailing, 16)
                
                PersonCardView()
                    .frame(height: 210)
                
                Spacer()
            }
            
        }.padding()
    }
}

struct PersonView: View {
    var body: some View {
        
        ZStack {
            Image("male")
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            GeometryReader { g in
                ZStack {
                    Circle()
                        .foregroundColor(Color.white)
                        .frame(width: 17, height: 17)
                    
                    Image(systemName: "checkmark.circle.fill").renderingMode(.template)
                        .foregroundColor(.green)
                        .font(.system(size: 13))
                }.position(x: g.size.width - 5, y: g.size.height - 45)
            }
            
        }.frame(width: 50, height: 50)
    }
}

struct PersonInfoView: View {
    var body: some View {
        HStack {
            VStack() {
                Text("Jessy J.").font(.title)
                Text("jessy@gmail.com").font(.footnote)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            ZStack {
                RoundedRectangle(cornerRadius: .greatestFiniteMagnitude).frame(width: 60, height: 30)
                    .foregroundColor(Color.init("ColumbiaBlue"))
                
                Text("17-C")
                    .foregroundColor(.white)
            }.padding(.trailing, 20)
            
            PersonView()
            
        }.padding()
    }
}

struct NavigationView: View {
    var body: some View {
        VStack {
            HStack {
                Button(action: {}, label: {
                    Image("left-arrow").renderingMode(.template)
                }).foregroundColor(.white)
                
                Spacer()
                
                Button(action: {}, label: {
                    Image("logo").renderingMode(.template)
                }).foregroundColor(.white)
            }.padding(30)
            
            Spacer()
        }
    }
}

struct BackgroundView: View {
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(Color.init("CaliforniaOrange"))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Rectangle()
                    .foregroundColor(.white)
                    .edgesIgnoringSafeArea(.all)
                    .frame(height: 600)
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        
        ZStack {
            BackgroundView()
            
            
            PlaneCardView()
                .frame(height: 650)
            
            VStack {
                NavigationView()
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
