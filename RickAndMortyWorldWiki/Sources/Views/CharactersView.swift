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
        HStack {
            Button("<") {
                characterListViewModel.backPage()
            }
            Text("\(characterListViewModel.page)")
            Button(">") {
                characterListViewModel.nextPage()
            }
        }
        .frame(alignment: .top)
        ZStack(alignment: .top) {
            if characterListViewModel.isLoading {
                ProgressView()
            }
            else {
                if characterListViewModel.characters == nil {
                    Text("No character yet")
                }
                else {
                    ScrollView {
                        VStack (spacing: 50) {
                            ForEach(characterListViewModel.characters ?? [], id: \.id) { character in
                                CharacterView(character: character)
                            }
                        }
                        .padding(10)
                    }
                }
            }
        }
        .onAppear() {
            characterListViewModel.fetchCharacters()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        
    }
}
