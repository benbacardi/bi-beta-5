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



class ThemeListController: NSObject, ObservableObject, NSFetchedResultsControllerDelegate {
    
    var fetchedResultsController: NSFetchedResultsController<Theme>?
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    var allThemes: [Theme] {
        fetchedResultsController?.fetchedObjects ?? []
    }
    
    @Published var themeListSortType: ThemeListSortType = .current {
        didSet {
            updateThemeList()
        }
    }
    @Published var themeSections = [String]()
    @Published var themesBySection = [String: [Theme]]()
    @Published var showFavouritesFirst = true {
        didSet {
            updateThemeList()
        }
    }
    @Published var refreshId: Int = 0
    
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
        themesBySection["All"] = allThemes
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
    
    func predicate() -> NSPredicate? {
        return nil
    }
    
    func fetchRequest() -> NSFetchRequest<Theme> {
        let fetch: NSFetchRequest<Theme> = Theme.fetchRequest()
        fetch.predicate = predicate()
        fetch.sortDescriptors = [
            NSSortDescriptor(keyPath: \Theme.theme, ascending: true),
        ]
        return fetch
    }
    
    func loadData() {
        print("Loading data for Themes")
        if let fetchedResultsController = fetchedResultsController {
            fetchedResultsController.fetchRequest.predicate = predicate()
        } else {
            fetchedResultsController = NSFetchedResultsController<Theme>(fetchRequest: fetchRequest(), managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            fetchedResultsController?.delegate = self
        }
        try? fetchedResultsController?.performFetch()
        updateThemeList()
    }
    
    @objc func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        refreshId += 1
    }
    
}


struct ThemeList: View {
    
    @ObservedObject var controller: ThemeListController
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Theme.theme, ascending: true)],
        animation: .default)
    private var allThemes: FetchedResults<Theme> {
        didSet {
            updateThemeList()
        }
    }
    
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
        //addFavouritesSection()
    }
    
    var body: some View {
        NavigationView {
            List {
                Text(String(controller.allThemes.count))
                ForEach(controller.themeSections, id: \.self) { section in
                    Section(header: Text(section)) {
                        ForEach(controller.themesBySection[section]!) { theme in
                            NavigationLink(destination: SetList(theme: theme)) {
                                ThemeListItem(theme: theme)
                            }
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarItems(trailing:
                                    Menu {
                                        Button(action: { self.controller.themeListSortType = .current }) {
                                            Label("Current theme", systemImage: controller.themeListSortType == .current ? "checkmark" : "")
                                        }
                                        Button(action: { self.controller.themeListSortType = .year }) {
                                            Label("Year", systemImage: controller.themeListSortType == .year ? "checkmark" : "")
                                        }
                                        Button(action: { self.controller.themeListSortType = .name }) {
                                            Label("Theme name", systemImage: controller.themeListSortType == .name ? "checkmark" : "")
                                        }
//                                        Divider()
//                                        Button(action: { self.showFavouritesFirst.toggle() }) {
//                                            Label("Show favourites first", systemImage: showFavouritesFirst ? "checkmark" : "")
//                                        }
                                    } label: {
                                        Image(systemName: "slider.horizontal.3")
                                    }
            )
            .navigationTitle(Text("Themes"))
            .navigationBarTitleDisplayMode(.large)
        }
        .onAppear {
            controller.loadData()
            //updateThemeList()
        }
    }
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeList(controller: ThemeListController(context: PersistenceController.preview.container.viewContext)).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
