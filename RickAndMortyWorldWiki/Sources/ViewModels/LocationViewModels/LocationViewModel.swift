//
//  LocationViewModel.swift
//  RickAndMortyWorldWiki
//
//  Created by Радэль Зубаиров on 12.12.2024.
//

import Foundation
import Combine
import SwiftUI
import SwiftUICore

public class LocationViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var locations: [LocationInfoModel]? = []
    @Published var characters: [CharacterModel] = []
    @Published var errorMessage: Error? = nil
    public var page: Int = 1
    private var pages: Int = 1
    var characterUrls: [String] = []
    
    func fetchLocations(){
        self.isLoading = true
        NetworkManager.shared.fetchLocations(page: page) { result, error, pages in
            if let newError = error {
                debugPrint(newError)
                self.isLoading = false;
                self.errorMessage = newError
                return
            }
            else {
                self.errorMessage = nil
            }
                
            self.locations = result
            
            if let newPages = pages {
                self.pages = newPages
            }
            
            self.isLoading = false;
        }
    }
    
    func fetchCharacters(){
        self.isLoading = true
        NetworkManager.shared.getCharacterInfo(characterUrl: characterUrls) { result, error in
            if let newError = error {
                debugPrint(newError)
                self.isLoading = false;
                self.errorMessage = newError
                return
            }
            else {
                self.errorMessage = nil
            }
                
            if let result {
                self.characters.append(result)
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
            fetchLocations()
        }
    }
    
    func backPage() {
        self.page -= 1
        
        if self.page < 1 {
            self.page = 1
        }
        else {
            fetchLocations()
        }
    }
}
