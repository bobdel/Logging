//
//  ShareSheetView.swift
//  Logging
//
//  Created by Joshua Homann on 10/9/21.
//

import SwiftUI
import UIKit

struct ShareSheet: UIViewControllerRepresentable {
    var activityItems: [Any]
    // swiftlint:disable:next redundant_optional_initialization
    var applicationActivities: [UIActivity]? = nil
    // swiftlint:disable:next redundant_optional_initialization
    var completionWithItemsHandler: UIActivityViewController.CompletionWithItemsHandler? = nil

    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(
            activityItems: activityItems, applicationActivities: applicationActivities
        )
        controller.completionWithItemsHandler = completionWithItemsHandler
        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) { }
}
