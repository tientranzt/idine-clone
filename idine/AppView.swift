//
//  AppView.swift
//  idine
//
//  Created by tientran on 8/9/20.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            // have 2 view
            ContentView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Menu")
                }

            OrderView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Order")
                }
        }
    }
}

//struct AppView_Previews: PreviewProvider {
//    static var previews: some View {
//        AppView()
//    }
//}
