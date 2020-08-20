//
//  SetList.swift
//  Bricking It (iOS)
//
//  Created by Ben Cardy on 19/08/2020.
//

import SwiftUI
import CoreData


struct SetList: View {
    @Environment(\.managedObjectContext) private var viewContext

    @State var fetchRequest: FetchRequest<BricksetSet>
    private var allSets: FetchedResults<BricksetSet> {
        return fetchRequest.wrappedValue
    }
    
    var body: some View {
        Group {
            Text(String(describing: allSets.count))
        }
    }

}


struct SetList_Previews: PreviewProvider {
    static var previews: some View {
        SetList(fetchRequest: FetchRequest<BricksetSet>(entity: BricksetSet.entity(), sortDescriptors: [], animation: .default)).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
