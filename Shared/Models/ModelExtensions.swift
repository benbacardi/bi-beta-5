//
//  ModelExtensions.swift
//  Bricking It (iOS)
//
//  Created by Ben Cardy on 21/08/2020.
//

import Foundation
import CoreData


extension BricksetSet {
    
    var fullTheme: String {
        let theme = themeName ?? "Unknown"
        if let subtheme = subtheme, subtheme.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
            return "\(theme): \(subtheme)"
        }
        return theme
    }
    
    func compareNumber(with set: BricksetSet) -> Bool {
        let s1name = number ?? "Unknown"
        let s2name = set.number ?? "Unknown"
        return s1name.compare(s2name, options: [.numeric]) == .orderedDescending
    }
    
}


extension Theme {

    func toggleFavourite(withContext viewContext: NSManagedObjectContext) {

        viewContext.performAndWait {
            self.favourite.toggle()
            try? viewContext.save()
        }

    }

}
