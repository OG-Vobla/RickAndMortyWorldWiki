//
//  EpisodeInformationView.swift
//  RickAndMortyWorldWiki
//
//  Created by Радэль Зубаиров on 13.12.2024.
//

import SwiftUICore
import SwiftUI

struct EpisodeInformationView: View {
    @ObservedObject private var episodeViewModel: EpisodeViewModel = EpisodeViewModel()
    var episode: EpisodeModel = EpisodeModel(id: 0, name: "", air_date: "", episode: "", characters: [], url: "", created: "")
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                VStack {
                    Image("EpisodePng")
                        .resizable()
                        .scaledToFit()
                }
                    .frame(height: 200)
                    .padding(30)
                Text(episode.name)
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
                        Section(header: Text("Episode")) {
                            Text(episode.episode)
                        }
                        Section(header: Text("Air date")) {
                            Text(episode.air_date)
                        }
                    }
                }
                .frame(height: 300)
                VStack {
                    HStack {
                        Text("Cast")
                            .font(.title2.weight(.medium))
                            .foregroundColor(.primary.opacity(0.5))
                        Spacer()
                    }
                    .padding()
                    if(episodeViewModel.isLoading)
                    {
                        ProgressView()
                    }
                    else{
                        List {
                            ForEach(episodeViewModel.characters, id: \.id) { resident in
                                Section(header: Text("Resident name: \(resident.name)")) {
                                    HStack{
                                        Text("Resident status: \(resident.status), species: \(resident.species), gender: \(resident.gender)")
                                    }
                                }
                            }
                        }
                    }
                }
                .onAppear {
                    episodeViewModel.characterUrls = episode.characters
                    episodeViewModel.fetchCharacters()
                }
                .frame(height: 400)
            }
        }
    }
}
