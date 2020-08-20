//
//  ContentView.swift
//  Shared
//
//  Created by Ben Cardy on 19/08/2020.
//

import SwiftUI
import CoreData
import Foundation


enum ThemeListSortType {
    case current, year, name
}


struct ThemeListItem: View {
    
    var theme: Theme
    
    var body: some View {
        HStack {
            if theme.favourite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
            Text(theme.theme ?? "Unknown")
            Spacer()
            Text(String(theme.setCount))
                .foregroundColor(.secondary)
        }
    }
    
}


struct ThemeList: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Theme.theme, ascending: true)],
        animation: .default)
    private var allThemes: FetchedResults<Theme>
    
    @State private var themeListSortType: ThemeListSortType = .current {
        didSet {
            updateThemeList()
        }
    }
    @State private var themeSections = [String]()
    @State private var themesBySection = [String: [Theme]]()
    @State private var showFavouritesFirst = true {
        didSet {
            updateThemeList()
        }
    }
    
    private func clearThemeList() {
        themeSections = [String]()
        themesBySection = [String: [Theme]]()
    }
    
    private func sortThemeListByYear() {
        themesBySection = Dictionary(grouping: allThemes, by: { String($0.yearTo) })
        themeSections = Array(themesBySection.keys).sorted(by: >)
    }
    
    private func sortThemeListByCurrent() {
        themeSections = ["Current", "Retired"]
        let currentYear = Int32(Calendar.current.component(.year, from: Date()))
        themesBySection = Dictionary(grouping: allThemes, by: { $0.yearTo >= currentYear ? "Current" : "Retired" })
    }
    
    private func sortThemeListByName() {
        themeSections = ["All"]
        themesBySection["All"] = Array(allThemes)
    }
    
    private func addFavouritesSection() {
        if !showFavouritesFirst { return }
        themeSections.insert("Favourites", at: 0)
        themesBySection["Favourites"] = allThemes.filter { $0.favourite }
    }
    
    private func updateThemeList() {
        clearThemeList()
        if allThemes.count == 0 { return }
        switch themeListSortType {
        case .year:
            sortThemeListByYear()
        case .name:
            sortThemeListByName()
        default:
            sortThemeListByCurrent()
        }
        addFavouritesSection()
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(themeSections, id: \.self) { section in
                    Section(header: Text(section)) {
                        ForEach(themesBySection[section]!) { theme in
                            NavigationLink(destination: SetList(fetchRequest: FetchRequest<BricksetSet>(entity: BricksetSet.entity(), sortDescriptors: [], animation: .default))) {
                                ThemeListItem(theme: theme)
                            }
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarItems(trailing:
                                    Menu {
                                        Button(action: {
                                            self.themeListSortType = .current
                                        }) {
                                            HStack {
                                                Label("Current theme", systemImage: themeListSortType == .current ? "checkmark" : "")
                                            }
                                        }
                                        Button(action: {
                                            self.themeListSortType = .year
                                        }) {
                                            Label("Year", systemImage: themeListSortType == .year ? "checkmark" : "")
                                        }
                                        Button(action: {
                                            self.themeListSortType = .name
                                        }) {
                                            Label("Theme name", systemImage: themeListSortType == .name ? "checkmark" : "")
                                        }
                                        Divider()
                                        Button(action: {
                                            self.showFavouritesFirst.toggle()
                                        }) {
                                            Label("Show favourites first", systemImage: showFavouritesFirst ? "checkmark" : "")
                                        }
                                    } label: {
                                        Image(systemName: "slider.horizontal.3")
                                    }
            )
            .navigationTitle(Text("Themes"))
            .navigationBarTitleDisplayMode(.large)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {
            updateThemeList()
        }
    }
    
    //    private func addItem() {
    //        withAnimation {
    //            let newItem = Theme(context: viewContext)
    //            newItem.theme = "Theme"
    //
    //            do {
    //                try viewContext.save()
    //            } catch {
    //                // Replace this implementation with code to handle the error appropriately.
    //                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
    //                let nsError = error as NSError
    //                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
    //            }
    //        }
    //    }
    //
    //    private func deleteItems(offsets: IndexSet) {
    //        withAnimation {
    //            offsets.map { items[$0] }.forEach(viewContext.delete)
    //
    //            do {
    //                try viewContext.save()
    //            } catch {
    //                // Replace this implementation with code to handle the error appropriately.
    //                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
    //                let nsError = error as NSError
    //                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
    //            }
    //        }
    //    }
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeList().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
