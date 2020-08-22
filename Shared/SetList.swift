//
//  SetList.swift
//  Bricking It (iOS)
//
//  Created by Ben Cardy on 19/08/2020.
//

import SwiftUI
import CoreData


enum SetListSortType {
    case number, year, name, theme, subtheme, pieces, rating
}


struct SetList: View {
    @Environment(\.managedObjectContext) private var viewContext

    var theme: Theme?
    var query: String?
    
    var fetchRequest: FetchRequest<BricksetSet>
    var allSets: FetchedResults<BricksetSet> {
        return fetchRequest.wrappedValue
    }
    
    var navigationTitle: String {
        if let theme = theme {
            return theme.theme ?? "Unknown Theme"
        }
        return query ?? "Who knows"
    }
    
    init() {
        fetchRequest = FetchRequest<BricksetSet>(
            entity: BricksetSet.entity(),
            sortDescriptors: [],
            animation: .default
        )
    }
    
    init(theme: Theme) {
        fetchRequest = FetchRequest<BricksetSet>(
            entity: BricksetSet.entity(),
            sortDescriptors: [],
            predicate: NSPredicate(format: "themeName = %@", theme.theme ?? "Unknown"),
            animation: .default
        )
        self.theme = theme
    }
    
    init(query: String) {
        let predicates = [
            NSPredicate(format: "name contains[cd] %@", query),
            NSPredicate(format: "number contains[cd] %@", query),
        ]
        let predicate = NSCompoundPredicate(type: .or, subpredicates: predicates)
        fetchRequest = FetchRequest<BricksetSet>(
            entity: BricksetSet.entity(),
            sortDescriptors: [],
            predicate: predicate,
            animation: .default
        )
        self.query = query
    }
    
    
    @State private var setListSortType: SetListSortType = .number {
        didSet {
            updateSetList()
        }
    }
    @State private var setSections = [String]()
    @State private var setsBySection = [String: [BricksetSet]]()
    
    private func sortSetsWithinSectionsByNumber(_ setsInSections: [String: [BricksetSet]]) -> [String: [BricksetSet]] {
        var temp = [String: [BricksetSet]]()
        for (key, value) in setsInSections {
            temp[key] = value.sorted { $0.compareNumber(with: $1) }
        }
        return temp
    }
    
    private func sortSetsWithinSectionsByNumber(_ sets: [BricksetSet]) -> [String: [BricksetSet]] {
        return sortSetsWithinSectionsByNumber(["All": sets])
    }
    
    private func clearSetList() {
        setSections = [String]()
        setsBySection = [String: [BricksetSet]]()
    }
    
    private func sortSetListByNumber() {
        setSections = ["All"]
        setsBySection = sortSetsWithinSectionsByNumber(Array(allSets))
    }
    
    private func sortSetListByYear() {
        setsBySection = sortSetsWithinSectionsByNumber(Dictionary(grouping: allSets, by: { String($0.year) }))
        setSections = setsBySection.keys.sorted { $0.compare($1, options: [.numeric]) == .orderedDescending }
    }
    
    private func sortSetListByName() {
        setSections = ["All"]
        setsBySection["All"] = Array(allSets).sorted { $0.name ?? "Unknown" < $1.name ?? "Unknown" }
    }
    
    private func sortSetListByTheme() {
        setsBySection = sortSetsWithinSectionsByNumber(Dictionary(grouping: allSets, by: { $0.themeName ?? "No theme" }))
        setSections = setsBySection.keys.sorted()
    }
    
    private func sortSetListBySubtheme() {
        setsBySection = sortSetsWithinSectionsByNumber(Dictionary(grouping: allSets, by: { $0.fullTheme }))
        setSections = setsBySection.keys.sorted()
    }
    
    private func sortSetListByPieceCount() {
        setSections = ["All"]
        setsBySection["All"] = Array(allSets).sorted { s1, s2 in
            if s1.pieces != s2.pieces {
                return s1.pieces > s2.pieces
            }
            return s1.compareNumber(with: s2)
        }
    }
    
    private func sortSetListByRating() {
        setSections = ["All"]
        setsBySection["All"] = Array(allSets).sorted { s1, s2 in
            if s1.rating != s2.rating {
                return s1.rating > s2.rating
            }
            return s1.compareNumber(with: s2)
        }
    }
    
    private func updateSetList() {
        clearSetList()
        if allSets.count == 0 { return }
        switch setListSortType {
        case .rating:
            sortSetListByRating()
        case .pieces:
            sortSetListByPieceCount()
        case .subtheme:
            sortSetListBySubtheme()
        case .theme:
            sortSetListByTheme()
        case .name:
            sortSetListByName()
        case .year:
            sortSetListByYear()
        default:
            sortSetListByNumber()
        }
    }
    
    var body: some View {
        List {
            ForEach(setSections, id: \.self) { section in
                Section(header: Text(section)) {
                    ForEach(setsBySection[section]!) { set in
                        HStack {
                            Text(set.name ?? "Unknown")
                            Spacer()
                            Text(set.number ?? "Unknown")
                            Spacer()
                            Text(String(set.pieces))
                        }
                    }
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarItems(trailing:
                                HStack {
                                    if let theme = theme {
                                        Button(action: {
                                            theme.toggleFavourite(withContext: viewContext)
                                        }) {
                                            Image(systemName: theme.favourite ? "star.fill" : "star")
                                        }
                                    }
                                    Spacer().frame(minWidth: 10)
                                    Menu {
                                        Button(action: { self.setListSortType = .number }) {
                                            Label("Set number", systemImage: setListSortType == .number ? "checkmark" : "")
                                        }
                                        Button(action: { self.setListSortType = .name }) {
                                            Label("Set name", systemImage: setListSortType == .name ? "checkmark" : "")
                                        }
                                        if theme == nil {
                                            Button(action: { self.setListSortType = .theme }) {
                                                Label("Theme", systemImage: setListSortType == .theme ? "checkmark" : "")
                                            }
                                        }
                                        Button(action: { self.setListSortType = .subtheme }) {
                                            Label("Subtheme", systemImage: setListSortType == .subtheme ? "checkmark" : "")
                                        }
                                        Button(action: { self.setListSortType = .pieces }) {
                                            Label("Piece count", systemImage: setListSortType == .pieces ? "checkmark" : "")
                                        }
                                        Button(action: { self.setListSortType = .year }) {
                                            Label("Year released", systemImage: setListSortType == .year ? "checkmark" : "")
                                        }
                                        Button(action: { self.setListSortType = .rating }) {
                                            Label("Overall rating", systemImage: setListSortType == .rating ? "checkmark" : "")
                                        }
                                    } label: {
                                        Image(systemName: "slider.horizontal.3")
                                    }
                                }
        )
        .navigationTitle(Text(navigationTitle))
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            updateSetList()
        }
    }

}


struct SetList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SetList(query: "fire").environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
