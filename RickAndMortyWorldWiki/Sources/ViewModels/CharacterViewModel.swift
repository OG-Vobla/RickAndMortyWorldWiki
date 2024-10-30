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
    private var page: Int = 1
    private var pages: Int = 1
    
    
    func fetchCharacters() {
        self.isLoading = true
        NetworkManager.shared.fetchCharacters(page: page) { result, error, pages in
            if let newError = error{
                debugPrint(newError)
                self.isLoading = false;
                return
            }
            
            self.characters = result
            
            if let newPages = pages {
                self.pages = newPages
            }
            
            self.isLoading = false;
        }
    }
    
    func nextPage() {
        page += 1
        
        if page > pages {
            page = pages
        }
    }
    
    func backPage() {
        page -= 1
        
        if page < 0 {
            page = 0
        }
    }
}
