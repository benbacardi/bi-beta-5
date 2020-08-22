//
//  Main.swift
//  Bricking It
//
//  Created by Ben Cardy on 21/08/2020.
//

import SwiftUI

struct Main: View {
    @State var selectedTab = 2
    var body: some View {
        TabView(selection: $selectedTab) {
//            ThemeList()
//                .tabItem {
//                    Image(systemName: "square.grid.2x2")
//                    Text("Themes")
//                }
//                .tag(1)
            Search()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
                .tag(2)
        }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
