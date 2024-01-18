//
//  ListView.swift
//  Logging
//
//  Created by Robert DeLaurentis on 1/18/24.
//

import SwiftUI

struct ListView: View {
    private let title = "ListView"
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
