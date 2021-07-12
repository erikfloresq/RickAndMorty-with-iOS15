//
//  ContentView.swift
//  WatchApp Extension
//
//  Created by Erik Flores on 12/7/21.
//

import SwiftUI

struct ContentView: View {
    let images: [String] = ["imageMock", "imageMock", "imageMock"]

    var body: some View {
        NavigationView {
            List {
                ForEach(images, id: \.self) { image in
                    ZStack {
                        Image(image)
                            .resizable()
                            .scaledToFill()
                            .mask(RoundedRectangle(cornerRadius: 20))
                        VStack {
                            Spacer()
                            LinearGradient(colors: [.black, .clear], startPoint: .bottom, endPoint: .top)
                                .frame(height: 70)
                        }
                        VStack {
                            Spacer()
                            Text("Rick!")
                                .font(.title2)
                                .bold()
                                .padding()
                        }
                    }
                    .swipeActions {
                        Button {
                            print("demo")
                        } label: {
                            Image(systemName: "star")
                        }
                        tint(Color.yellow)
                    }
                }
            }
            .listStyle(.carousel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
