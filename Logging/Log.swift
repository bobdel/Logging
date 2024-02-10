//
//  Log.swift
//  Logging
//
//  Created by Joshua Homann on 9/24/21.
//

import OSLog
import Foundation

enum Log {
    static let subsystem = Bundle.main.bundleIdentifier ?? ""

    // categories for this module
    static let navigation = Logger(subsystem: Self.subsystem, category: Name.navigation.rawValue)
    static let analytics = Logger(subsystem: Self.subsystem, category: Name.analytics.rawValue)

    // namespace for categories
    enum Name: String, Hashable, CaseIterable {
        case analytics
        case navigation
    }

    // used to display the log inside the app.
    static func entries(for names: [Name], since seconds: TimeInterval) throws -> [OSLogEntryLog] {
        let logStore = try OSLogStore(scope: .currentProcessIdentifier)
        let position = logStore.position(date: .now.addingTimeInterval(-seconds))
        let predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [
            NSPredicate(format: "subsystem == %@", Self.subsystem),
            NSCompoundPredicate(orPredicateWithSubpredicates: names.map(\.rawValue).map {
                NSPredicate(format: "category == %@", $0)
            })
        ])

        let entries = try logStore.getEntries(with: [.reverse], at: position, matching: predicate)

        return entries.compactMap { $0 as? OSLogEntryLog }
    }
}

// Notes for logging https://www.avanderlee.com/debugging/oslog-unified-logging/
