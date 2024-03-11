//
//  SearchBarView.swift
//  Directory
//
//  Created by Sweta Jaiswal on 06/03/24.
//

import SwiftUI

struct SearchBarView: UIViewRepresentable {
    
    typealias UIViewType = UISearchBar
    @Binding var searchText: String
    
    
    /// A bridge to communicate between search bar in Swift and SwiftUI
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var searchBarValue: String
        
        init(text: Binding<String>) {
            _searchBarValue = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            searchBarValue = searchText
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
        }
        
        func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
            return true
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
        }
    }
    
    
    /// Default settings for search bar
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.delegate = context.coordinator
        searchBar.placeholder = Strings.Search.placeholderText
        searchBar.text = nil
        searchBar.searchBarStyle = .minimal
        searchBar.barStyle = .black
        searchBar.returnKeyType = .search
        searchBar.endEditing(true)
        searchBar.showsCancelButton = true
        return searchBar
    }
    
    /// Called when user interacts with search bar
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = searchText
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $searchText)
    }
    
}

#Preview {
    Group {
        SearchBarView(searchText: .constant(""))
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.light)
    }
    
}
