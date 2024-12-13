//
//  LocationInformationView.swift
//  RickAndMortyWorldWiki
//
//  Created by Радэль Зубаиров on 12.12.2024.
//

import SwiftUICore
import SwiftUI

struct LocationInformationView: View {
    @ObservedObject private var locationViewModel: LocationViewModel = LocationViewModel()
    var location: LocationInfoModel = LocationInfoModel(id: 0, name: "", type: "", dimension: "", residents: [], url: "", created: "")
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                VStack {
                    Image("worldPng")
                        .resizable()
                        .scaledToFit()
                }
                    .frame(height: 200)
                    .padding(30)
                Text(location.name)
                    .font(.largeTitle)
                VStack {
                    HStack {
                        Text("Informations")
                            .font(.title2.weight(.medium))
                            .foregroundColor(.primary.opacity(0.5))
                        Spacer()
                    }
                    .padding()
                    List {
                        Section(header: Text("Type")) {
                            Text(location.type)
                        }
                        Section(header: Text("Dimension")) {
                            Text(location.dimension)
                        }
                    }
                }
                .frame(height: 300)
                VStack {
                    HStack {
                        Text("Residents")
                            .font(.title2.weight(.medium))
                            .foregroundColor(.primary.opacity(0.5))
                        Spacer()
                    }
                    .padding()
                    List {
                        ForEach(locationViewModel.characters, id: \.id) { resident in
                            Section(header: Text("Resident name: \(resident.name)")) {
                                Text("Resident status, species, gender: \(resident.status), \(resident.species), \(resident.gender)")
                            }
                        }
                    }
                    .onAppear {
                        locationViewModel.characterUrls = location.residents
                        locationViewModel.fetchCharacters()
                    }
                }
                .frame(height: 400)
            }
        }
    }
}
