//
//  idineApp.swift
//  idine
//
//  Created by tientran on 8/8/20.
//

import SwiftUI

@main
struct idineApp: App {
    var body: some Scene {
        WindowGroup {
            // use Order observable for some view listen
            AppView().environmentObject(Order())
        }
    }
}
