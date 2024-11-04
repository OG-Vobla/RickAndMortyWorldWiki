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
    private var filters: [FilterProtocol.Type] = [GenderFilter.self, SpeciesFilter.self, StatusFilter.self]
    
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
        VStack {
            HStack {
                ForEach((0..<filters.count), id: \.self) {
                    PickerView(characterListViewModel: characterListViewModel, filterType: filters[$0])
                }
            }
            ZStack(alignment: .top) {
                if characterListViewModel.isLoading {
                    ProgressView()
                }
                else {
                    if characterListViewModel.characters == nil {
                        Text("No character yet")
                    }
                    else if characterListViewModel.errorMessage != nil {
                        Text(characterListViewModel.errorMessage!.localizedDescription)
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
    public struct PickerView: View {
        @ObservedObject public var characterListViewModel: CharacterListViewModel
        @State public var selectedFilter: String? = nil
        
        var filterType: FilterProtocol.Type
        var body: some View{ Picker("Select \(filterType.filterName)", selection: $selectedFilter) {
            Text("All").tag(nil as String?)
            ForEach(filterType.filterVariants, id: \.self) { filterVariant in
                Text(filterVariant).tag(filterVariant)
            }
        }
        .pickerStyle(MenuPickerStyle())
        .onChange(of: selectedFilter) {
                characterListViewModel.filterCharacters(
                    selectedFilter: Filter(filterName: filterType.filterName, filterSelected: selectedFilter))
            }
        }
    }
}
