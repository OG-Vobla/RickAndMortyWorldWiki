//
//  CharactersView.swift
//  RickAndMortyWorldWiki
//
//  Created by Радэль Зубаиров on 29.10.2024.
//

import SwiftUICore
import SwiftUI

struct CharactersView: View {
    @ObservedObject private var characterListViewModel: CharacterListViewModel = CharacterListViewModel()
    
    var body: some View {
        ZStack{
            if characterListViewModel.isLoading {
                ProgressView()
            }
            
            if characterListViewModel.characters == nil {
                Text("No character yet")
            }
            
            ScrollView {
                LazyVStack {
                    ForEach(characterListViewModel.characters ?? [], id: \.id) { character in
                        Text(character.name)
                    }
                }
            }
        }
        .onAppear() {
            characterListViewModel.fetchCharacters()
        }
        
    }
}
