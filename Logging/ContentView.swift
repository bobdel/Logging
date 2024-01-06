//
//  ContentView.swift
//  Logging
//
//  Created by Joshua Homann on 9/24/21.
//

// import Combine
import SwiftUI
// import UIKit

struct ContentView: View {
    private let title = "Logging Root View"
    @State private var showList = false
    @State private var showAnalytics = false
    var body: some View {
        return NavigationStack {
            VStack(alignment: .leading) {
                Button {
                    Log.navigation.debug("Show Analytics tapped")
                    showAnalytics.toggle()
                } label: {
                    Label("Show Analytics", systemImage: "square")
                }
                Button {
                    Log.navigation.log("Display List tapped")
                    showList.toggle()
                } label: {
                    Label("List View", systemImage: "circle")
                }
                .navigationDestination(isPresented: $showList, destination: { ListView() })
            }
            .onAppear { Log.navigation.log("\(title) did appear")}
            .sheet(isPresented: $showAnalytics) {
                LogView()
            }
            .navigationTitle(title)
        }
    }
}

#Preview("Logging Root View") {
    ContentView()
}

struct ListView: View {
    private let title = "List view"
    var body: some View {
        VStack {
            List(0..<1000) { number in
                NavigationLink("\(number)", destination: Text("\(number)"))
                    .onAppear { Log.navigation.log("\(number) did appear")}
            }
            .onAppear { Log.navigation.log("\(title) did appear") }
            .navigationTitle(title)
        }
    }
}

#Preview("List View") {
    ListView()
}
