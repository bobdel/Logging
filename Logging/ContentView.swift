//
//  ContentView.swift
//  Logging
//
//  Created by Joshua Homann on 9/24/21.
//

import SwiftUI

struct ContentView: View {

    private let title = "ContentView"

    @State private var showList = false
    @State private var showLogView = false

    var body: some View {
        return NavigationStack {
            VStack(alignment: .leading) {
//                NavigationLink("Test List View", destination: ListView())
                Button {
                    Log.navigation.debug("Show LogView tapped")
                    showLogView.toggle()
                } label: {
                    Label("Show LogView", systemImage: "square")
                }
                Button {
                    Log.navigation.log("Display List tapped")
                    showList.toggle()
                } label: {
                    Label("Show List View", systemImage: "circle")
                }
                .navigationDestination(isPresented: $showList, destination: { ListView() })
            }
            .padding(.bottom, 220)
            .buttonStyle(.borderedProminent)
            .onAppear { Log.navigation.log("\(title) did appear")}
            .sheet(isPresented: $showLogView) {
                LogView()
            }
            .navigationTitle(title)
        }
    }
}

#Preview("Logging Root View") {
    ContentView()
}
