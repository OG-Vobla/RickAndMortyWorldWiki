//
//  CharacterViewModel.swift
//  RickAndMortyWorldWiki
//
//  Created by Радэль Зубаиров on 29.10.2024.
//

import Foundation
import Combine
import SwiftUI
import SwiftUICore

public class CharacterListViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var characters: [CharacterModel]? = []
    @Published var errorMessage: Error? = nil
    public var page: Int = 1
    private var pages: Int = 1
    var filters: FilterProtocol?
    var selectedFilters: [Filter] = []
    
    func fetchCharacters(){
        self.isLoading = true
        NetworkManager.shared.fetchCharacters(page: page, filters: selectedFilters) { result, error, pages in
            if let newError = error {
                debugPrint(newError)
                self.isLoading = false;
                self.errorMessage = newError
                return
            }
            else {
                self.errorMessage = nil
            }
                
            self.characters = result
            
            if let newPages = pages {
                self.pages = newPages
            }
            
            self.isLoading = false;
        }
    }
    
    func nextPage() {
        self.page += 1
        
        if self.page > pages {
            self.page = pages
        }
        else {
            fetchCharacters()
        }
    }
    
    func backPage() {
        self.page -= 1
        
        if self.page < 1 {
            self.page = 1
        }
        else {
            fetchCharacters()
        }
    }
    
    func filterCharacters(selectedFilter: Filter) {
        selectedFilters.removeAll { $0.filterName == selectedFilter.filterName }
        page = 1
        if selectedFilter.filterSelected != nil {
            self.selectedFilters.append(selectedFilter)
        }
        fetchCharacters()
    }
}
