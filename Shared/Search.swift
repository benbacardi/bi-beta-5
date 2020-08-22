//
//  Search.swift
//  Bricking It
//
//  Created by Ben Cardy on 21/08/2020.
//

import SwiftUI
import UIKit


struct SearchBar: UIViewRepresentable {

    @Binding var text: String
    var placeholder: String
    var searchFunction: () -> ()

    class Coordinator: NSObject, UISearchBarDelegate {

        @Binding var text: String
        var searchFunction: () -> ()

        init(text: Binding<String>, searchFunction: @escaping () -> ()) {
            _text = text
            self.searchFunction = searchFunction
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }

        func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
            searchBar.showsCancelButton = true
        }
        
        func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
            searchBar.showsCancelButton = false
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
        }

        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchFunction()
        }
        
    }

    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text, searchFunction: searchFunction)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.placeholder = placeholder
        searchBar.searchBarStyle = .minimal
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
}



struct Search: View {
    
    @State var query: String = ""
    @State private var goToSearchResults = false
    
    private func performSearch() {
        goToSearchResults = true
    }
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $query, placeholder: "Set number or name", searchFunction: performSearch)
                    .padding([.leading, .trailing], 8)
                Spacer()
                
                NavigationLink(
                    destination: SetList(
                        query: query
                    ),
                    isActive: $goToSearchResults
                ) {
                    EmptyView()
                }
                
            }
            .navigationTitle(Text("Search"))
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
